GlobalState.washingmachine1 = 'Already Washing: '
GlobalState.washingmachine2 = 'Already Washing: '
GlobalState.washingmachine3 = 'Already Washing: '
GlobalState.washingmachine4 = 'Already Washing: '
local Amount = nil

RegisterNetEvent('qb-moneylaundering:enter:checkitem', function()
    local src = source
    if HasItem(src) then
        TriggerClientEvent('qb-moneylaundering:enter:confirm', src)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the required item to enter', 'error', 3000)
    end
end)

RegisterNetEvent('qb-moneylaundering:launder:check', function(k)
    local src = source
    if HasBills(src) then
        TriggerClientEvent('qb-moneylaundering:launder:confirm', src, k)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You don\'t have any cash to launder on you', 'error', 3000)
    end
end)

RegisterNetEvent('qb-moneylaundering:launder:machine', function(k)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Item = Player.Functions.GetItemByName('markedbills')
    Config.washingmachines[k].worth = Item.info.worth
    Player.Functions.RemoveItem('markedbills', 1)
    local timer = Config.timer
    while timer > 0 do
        timer = timer - 1
        if k == 1 then
            GlobalState.washingmachine1 = 'Already Washing: '..timer
        elseif k == 2 then 
            GlobalState.washingmachine2 = 'Already Washing: '..timer
        elseif k == 3 then
            GlobalState.washingmachine3 = 'Already Washing: '..timer
        else
            GlobalState.washingmachine4 = 'Already Washing: '..timer
        end
        Wait(1000)
    end
    if timer == 0 then
        if k == 1 then
            GlobalState.washingmachine1 = '~o~E~w~ - Collect the cash'
        elseif k == 2 then 
            GlobalState.washingmachine2 = '~o~E~w~ - Collect the cash'
        elseif k == 3 then
            GlobalState.washingmachine3 = '~o~E~w~ - Collect the cash'
        else
            GlobalState.washingmachine4 = '~o~E~w~ - Collect the cash'
        end
    end        
end)

RegisterNetEvent('qb-moneylaundering:launder:collect', function(k)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Subtract = math.percent(math.random(Config.percentage.min, Config.percentage.max), Config.washingmachines[k].worth)
    local Reward = Config.washingmachines[k].worth - Subtract
    Player.Functions.AddMoney('cash', Reward, "washed-money")
    Config.washingmachines[k].inUse = false
    Config.washingmachines[k].worth = 0
end)


-- FUNCTIONS
function HasItem(src)
    local Has = false
    local Player = QBCore.Functions.GetPlayer(src)
    local Item = Player.Functions.GetItemByName(Config.item)
    if Item ~= nil then
        Has = true
    end
    return Has
end

function HasBills(src)
    local Has = false
    local Player = QBCore.Functions.GetPlayer(src)
    local Item = Player.Functions.GetItemByName('markedbills')
    if Item ~= nil then
        Has = true
    end
    return Has
end

function math.percent(percent, value)
    if tonumber(percent) and tonumber(value) then
        return (value*percent)/100
    end
    return false
end