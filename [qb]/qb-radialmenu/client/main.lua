local inRadialMenu = false

RegisterCommand('radialmenu', function()
    openRadial(true)
    SetCursorLocation(0.5, 0.5)
end)

RegisterKeyMapping('radialmenu', 'Open Radial Menu', 'keyboard', 'F1')

function setupSubItems()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["isdead"] then
            if PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" then
                Config.MenuItems[4].items = {
                    [1] = {
                        id = 'emergencybutton2',
                        title = 'Emergencybutton',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:SendPoliceEmergencyAlert',
                        shouldClose = true,
                    },
                }
            end
        else
            if Config.JobInteractions[PlayerData.job.name] ~= nil and next(Config.JobInteractions[PlayerData.job.name]) ~= nil then
                Config.MenuItems[4].items = Config.JobInteractions[PlayerData.job.name]
            else 
                Config.MenuItems[4].items = {}
            end
        end
    end)
end

function openRadial(bool)    
    setupSubItems()

    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        radial = bool,
        items = Config.MenuItems
    })
    inRadialMenu = bool
end

function closeRadial(bool)    
    SetNuiFocus(false, false)
    inRadialMenu = bool
end

function getNearestVeh()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

RegisterNUICallback('closeRadial', function()
    closeRadial(false)
end)

RegisterNUICallback('selectItem', function(data)
    local itemData = data.itemData

    if itemData.type == 'client' then
        TriggerEvent(itemData.event, itemData)
    elseif itemData.type == 'server' then
        TriggerServerEvent(itemData.event, itemData)
    end
end)

RegisterNetEvent('qb-radialmenu:client:noPlayers')
AddEventHandler('qb-radialmenu:client:noPlayers', function(data)
    QBCore.Functions.Notify('There arent any people close', 'error', 2500)
end)

RegisterNetEvent('qb-radialmenu:client:giveidkaart')
AddEventHandler('qb-radialmenu:client:giveidkaart', function(data)
    -- ??
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
