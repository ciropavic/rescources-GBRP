QBCore = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

local huntingSales = {
    ['huntingCarcass1'] = {
        name = 'Animal Pelt ⭐',
        txt = "1x",
        event = "np-hunting:huntingCarcass1"
    },
    ['huntingCarcass2'] = {
        name = 'Animal Pelt ⭐⭐',
        txt = "1x",
        event = "np-hunting:huntingCarcass2"
    },
    ['huntingCarcass3'] = {
        name = 'Animal Pelt ⭐⭐⭐',
        txt = "1x",
        event = "np-hunting:huntingCarcass3"
    },
}

RegisterNetEvent('np-hunting:huntingSales', function()
    local dataMenu = {}
    for _, pData in pairs(huntingSales) do
        table.insert(dataMenu, {
            id = #dataMenu + 1,
            header = pData.name,
            txt = pData.txt,
            params = {
                event = pData.event
            }
        })
    end
    TriggerEvent('nh-context:sendMenu', dataMenu)
end)

RegisterNetEvent("np-hunting:huntingCarcass1")
AddEventHandler("np-hunting:huntingCarcass1", function()
    QBCore.Functions.TriggerCallback('np-hunting:getItems', function(result)
        if result then
            TriggerServerEvent("np-hunting:sellCarcass", "huntingcarcass1")
        else
            QBCore.Functions.Notify("You dont have this item !", "error")
        end    
    end, "huntingcarcass1")        
end)

RegisterNetEvent("np-hunting:huntingCarcass2")
AddEventHandler("np-hunting:huntingCarcass2", function()
    QBCore.Functions.TriggerCallback('np-hunting:getItems', function(result)
        if result then
            TriggerServerEvent("np-hunting:sellCarcass", "huntingcarcass2")
        else
            QBCore.Functions.Notify("You dont have this item !", "error")
        end    
    end, "huntingcarcass2")   
end)

RegisterNetEvent("np-hunting:huntingCarcass3")
AddEventHandler("np-hunting:huntingCarcass3", function()
    QBCore.Functions.TriggerCallback('np-hunting:getItems', function(result)
        if result then
            TriggerServerEvent("np-hunting:sellCarcass", "huntingcarcass3")
        else
            QBCore.Functions.Notify("You dont have this item !", "error")
        end    
    end, "huntingcarcass3")   
end)