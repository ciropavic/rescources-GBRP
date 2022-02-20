QBCore.Functions.CreateUseableItem("radio", function(source, item)
    TriggerClientEvent('qb-radio:use', source)
end)

QBCore.Functions.CreateUseableItem("pd_radio", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local Job = Player.PlayerData.job.name
    if Job == "police" then
    TriggerClientEvent('qb-radio:use', source)
else
    TriggerClientEvent('QBCore:Notify', source, "You're not a cop!", "error")
end
end)

QBCore.Functions.CreateCallback('qb-radio:server:GetItem', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then
        local RadioItem = Player.Functions.GetItemByName(item)
        if RadioItem ~= nil and not Player.PlayerData.metadata["isdead"] and
            not Player.PlayerData.metadata["inlaststand"] then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)