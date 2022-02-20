local ModReady = true
local SqlReady = true
print = function(...)
end
error = function(...)
end

Init = function()
  
    if not QBCore or type(QBCore) ~= "table" then
        error("Could not find CORE.")
        return
    end
    Wait(1000)
    local doCont = true
    Start()
    if doCont then
        exports.oxmysql:execute(
            "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=@tableName",
            {["@tableName"] = "territories"},
            function(data)
                if data and type(data) == "table" then
                    exports.oxmysql:execute(
                        "SELECT * FROM territories",
                        {},
                        function(retData)
                            if retData and type(retData) == "table" and retData[1] then
                                for k, v in pairs(retData) do
                                    if v and v.zone and v.control and v.influence and Territories[v.zone] then
                                        Territories[v.zone].control = v.control
                                        Territories[v.zone].influence = v.influence
                                    end
                                end
                            end
                            ModReady = doCont
                            if ModReady then
                                Update()
                            end
                        end
                    )
                else
                    ModReady = doCont
                    if ModReady then
                        Update()
                    end
                end
            end
        )
    end
end
Start = function()
    if Territories and type(Territories) == "table" then
        for k, v in pairs(Territories) do
            Territories[k].players = {}
        end
    end
    
end
Update = function()
    while true do
        local now = GetGameTimer()
        if (not lastTime) or (now - lastTime > (Config and Config.InfluenceTick or 5000)) then
            lastTime = now
            TallyUp()
        end
        if (not lastSave) or (now - lastSave > (Config and Config.SqlSaveTimer or 5) * 60 * 1000) then
            lastSave = now
            exports.oxmysql:execute(
                "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=@territories",
                {
                    ["@territories"] = "territories"
                },
                function(retData)
                    if retData and type(retData) == "table" and retData[1] then
                        if Territories and type(Territories) == "table" then
                            for k, v in pairs(Territories) do
                                if v and type(v) == "table" and v.control and v.influence then
                                    exports.oxmysql:execute(
                                        "UPDATE territories SET control=@control,influence=@influence WHERE zone=@zone",
                                        {
                                            ["@control"] = v.control,
                                            ["@influence"] = v.influence,
                                            ["@zone"] = k
                                        }
                                    )
                                end
                            end
                        end
                    end
                end
            )
        end
        Wait(0)
    end
end
MarketAccess = {}
MarketCheck = function()
    local controlling = {}
    if Territories and type(Territories) == "table" then
        for k, v in pairs(Territories) do
            if v and type(v) == "table" and v.control then
                controlling[v.control] = (controlling[v.control] or 0) + 1
            end
        end
        for k, v in pairs(controlling) do
            if v >= 2 then
                if not MarketAccess[k] then
                    MarketAccess[k] = true
                    TriggerClientEvent("Territories:GotMarketAccess", -1, k)
                end
            else
                if MarketAccess[k] then
                    MarketAccess[k] = false
                    TriggerClientEvent("Territories:LostMarketAccess", -1, k)
                end
            end
        end
    end
end
TallyUp = function()
    local doUpdate = true
    for k, v in pairs(Territories) do
        if v and type(v) == "table" and v.control and v.influence then
            local mostMembers, memberCount, isDraw = GetActiveMembers(v)
            if mostMembers then
                if isDraw then
                    if v.control == mostMembers or v.control == isDraw then
                    else
                        doUpdate = true
                        v.influence = math.max(0.0, v.influence - 1.0)
                    end
                else
                    if v.control == mostMembers then
                        doUpdate = true
                        v.influence = math.min(100.0, v.influence + 1.0)
                    else
                        doUpdate = true
                        v.influence = math.max(0.0, v.influence - 1.0)
                        if v.influence <= 0.0 then
                            v.control = mostMembers
                        end
                    end
                end
            end
        end
    end
    if doUpdate then
        TriggerClientEvent("Territories:Sync", -1, Territories)
    end
end
GetActiveMembers = function(tab)
    local scores = {}
    for k, v in pairs(tab.players) do
        if v then
            if not scores[v] then
                scores[v] = 1
            else
                scores[v] = scores[v] + 1
            end
        end
    end
    local isDraw = false
    local highest, highestScore
    for k, v in pairs(scores) do
        if not highestScore or v >= highestScore then
            if not highestScore or v > highestScore then
                highestScore = v
                highest = k
                isDraw = false
            else
                isDraw = k
            end
        end
    end
    return highest, highestScore, isDraw
end
EnterZone = function(zone, job)
    local _source = source
    if
        not Territories or type(Territories) ~= "table" or not Territories[zone] or type(Territories[zone]) ~= "table" or
            not Territories[zone].players
     then
        return
    end
    Territories[zone].players[_source] = job
end
LeaveZone = function(zone, job)
    local _source = source
    if
        not Territories or type(Territories) ~= "table" or not Territories[zone] or type(Territories[zone]) ~= "table" or
            not Territories[zone].players
     then
        return
    end
    Territories[zone].players[_source] = nil
end
GetPlayer = function(player)
    local xPlayer = QBCore.Functions.GetPlayer(player)
    return xPlayer
end
PlayerKilled = function(killer, zone)
    local _source = source
    local slayer = killer
    local xPlayerSource = GetPlayer(_source)
    local xPlayerTarget = GetPlayer(slayer)

    local sourceJob = xPlayerSource.getJob().name
    local slayerJob = xPlayerTarget.getJob().name
    local doSync = false
    local influencer = false
    if GangLookups and GangLookup[slayerJob] and GangLookup[sourceJob] then
        local v = Territories[zone]
        if v.control == sourceJob then
            v.influence = math.max(0, v.influence - 10)
            doSync = true
            influencer = v.control
        elseif v.control == slayerJob then
            v.influence = math.min(100, v.influence + 10)
            doSync = true
            influencer = v.control
        end
    elseif GangLookup[slayerJob] then
        local v = Territories[zone]
        if v.control == slayerJob then
            v.influence = math.min(100, v.influence + 5)
            doSync = true
            influencer = v.control
        end
    elseif GangLookup[sourceJob] then
        local v = Territories[zone]
        if v.control == sourceJob then
            v.influence = math.max(0, v.influence - 5)
            doSync = true
            influencer = v.control
        end
    end
    if doSync then
        TriggerClientEvent("Territories:Sync", -1, Territories)
    end
end
RegisterServerEvent("Territories:RewardPlayer")
AddEventHandler("Territories:RewardPlayer", function(roomId)
    RewardPlayer(roomId)
end)
RewardPlayer = function(action)
     local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
        if action.requireItem and action.requireRate > 0 then
            xPlayer.Functions.RemoveItem(action.requireItem, action.requireRate)
        elseif action.requireCash and action.requireCash > 0 then
            xPlayer.Functions.RemoveMoney("cash", action.requireCash)
        end
        if action.rewardItem and action.rewardRate then
            local canContinue = true
            local giveCount = (action.rewardRate or 1)
                local itemData = xPlayer.Functions.GetItemByName(action.rewardItem)
                    xPlayer.Functions.AddItem(action.rewardItem, giveCount)
        elseif action.rewardCash and action.rewardCash > 0 then
            xPlayer.Functions.AddMoney("cash",action.rewardCash)
        end
end
SoldDrugs = function(drug, count, zone)
    local _source = source
    local _source = source
    local xPlayer = GetPlayer(_source)
    local item = xPlayer.Functions.GetItemByName(drug)
    if item.amount < count then
        count = item.amount
        print(
            "Someone is cheating: " ..
                _source .. ", did not have the same amount of items in inventory as expected. Probably trying to dupe."
        )
    end
    xPlayer.Functions.RemoveItem(drug, count)
    if
        Territories and type(Territories) == "table" and Territories[zone] and type(Territories[zone]) == "table" and
            Territories[zone].influence
     then
        Territories[zone].influence = math.min(100, Territories[zone].influence + 1)
        TriggerClientEvent("Territories:Sync", -1, Territories)
    end
        local payout = math.floor(DrugPrices[drug] * count)
        local accounts = xPlayer.PlayerData.money.cash
        xPlayer.Functions.AddMoney("cash", payout)
        return
end
vDist = function(v1, v2)
    if not v1 or not v2 or not v1.x or not v2.x or not v1.z or not v2.z then
        return 0
    end
    return math.sqrt(
        ((v1.x - v2.x) * (v1.x - v2.x)) + ((v1.y - v2.y) * (v1.y - v2.y)) + ((v1.z - v2.z) * (v1.z - v2.z))
    )
end
Handcuffed = function(target)
    local _source = source
    local xPlySource = GetPlayer(_source)
    local xPlyTarget = GetPlayer(target)
    local jobSource = xPlySource.PlayerData.job.name
    
    if Config and type(Config) == "table" and jobSource and PoliceLookup and type(PoliceLookup) == "table" and PoliceLookup[tostring(jobSource)] == true  then
       
        local jobTarget = xPlyTarget.PlayerData.gang.name
        TriggerClientEvent("QBCore:Notify",source,jobTarget)
     --[[    if not jobTarget then
            return
        end
        if not GangLookup or type(GangLookup) ~= "table" then
            return
        end ]]
        if GangLookup[jobTarget] then
            TriggerClientEvent("Territories:GotCuffed", target)
        end
    elseif
        Config and type(Config) == "table" and jobSource and PoliceLookup and type(PoliceLookup) == "table" and
            xPlySource.job2 and
            xPlySource.job2.name and
            PoliceLookup[tostring(xPlySource.job2.name)] == true
     then
        local jobTarget = xPlyTarget.PlayerData.gang.name
        if not jobTarget then
            return
        end
        if not GangLookup or type(GangLookup) ~= "table" then
            return
        end
        if GangLookup[jobTarget] then
            TriggerClientEvent("Territories:GotCuffed", target)
        else
            if xPlyTarget.job2 and xPlyTarget.job2.name and GangLookup[xPlyTarget.job2.name] then
                TriggerClientEvent("Territories:GotCuffed", target)
            end
        end
    end
end
CuffSuccess = function(zone)
    local _source = source
    local xPlySource = GetPlayer(_source)
    local jobSource = xPlySource.PlayerData.job.name
    local v = Territories[zone]
    if not v or type(v) ~= "table" or not v.control or not v.influence then
        return
    end
    if v.control == sourceJob or xPlySource.job2 and xPlySource.job2.name and xPlySource.job2.name == v.control then
        v.influence = math.max(0, v.influence - 10)
        TriggerClientEvent("Territories:Sync", -1, Territories)
    elseif PoliceLookup and type(PoliceLookup) == "table" and PoliceLookup[v.control] then
        v.influence = math.min(100, v.influence + 10)
        TriggerClientEvent("Territories:Sync", -1, Territories)
    end
end
PlayerLogin = function()
    local _source = source
    if InventoryChecked then
        TriggerClientEvent("Territories:StartRet", _source, (InventoryChecked == 2 and true or false), Territories)
        return
    end
    local xPlayer = GetPlayer(_source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local inventoryLookup = {}
    local reqItems = {}
 --[[    if not inventory or type(inventory) ~= "table" then
        return
    end ]]
    for k, v in pairs(inventory) do
        inventoryLookup[v.name] = true
    end
    if not Territories or type(Territories) ~= "table" then
        return
    end
    for k, v in pairs(Territories) do
        if not v or type(v) ~= "table" or not v.actions then
            return false
        end
        for k, v in pairs(v.actions) do
            if v and type(v) == "table" and v.requireItem then
                table.insert(reqItems, v.requireItem)
            end
            if v and type(v) == "table" and v.rewardItem then
                table.insert(reqItems, v.rewardItem)
            end
        end
    end
    for k, v in pairs(DrugPrices) do
        table.insert(reqItems, k)
    end
    for k, v in pairs(reqItems) do
        if not inventoryLookup or not inventoryLookup[v] then
            error("Could not find inventory item: " .. tostring(v))
            InventoryChecked = 1
            TriggerClientEvent("Territories:StartRet", _source, false, Territories)
            return
        end
    end
    InventoryChecked = 2
    TriggerClientEvent("Territories:StartRet", _source, true, Territories)
end
Reported = function(pos)
    TriggerClientEvent("Territories:PlayerReported", -1, pos)
end
