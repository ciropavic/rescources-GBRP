QBCore = nil
local PlayerData = {}
local pedspawned = false

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(Player)
    PlayerData =  QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
     PlayerJob = job
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.Pedlocation) do
			local pos = GetEntityCoords(PlayerPedId())	
			local dist = #(v.Cords - pos)
			
			if dist < 40 and pedspawned == false then
				TriggerEvent('spawn:ped',v.Cords,v.h)
				pedspawned = true
			end
			if dist >= 35 then
				pedspawned = false
				DeletePed(npc)
			end
		end
	end
end)

RegisterNetEvent('spawn:ped')
AddEventHandler('spawn:ped',function(coords,heading)
	local hash = GetHashKey('ig_trafficwarden')
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    pedspawned = true
	npc = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b") 
	while not TaskPlayAnim(npc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
	Wait(1000)
	end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent('dox:garage')
AddEventHandler('dox:garage', function(pd)
    local vehicle = pd.vehicle
    local coords = { ['x'] = 449.31, ['y'] = -1024.9, ['z'] = 28.59, ['h'] = 1.41}
    

    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "police" then
            if vehicle == 'pol2sw' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)            
            elseif  vehicle == 'polmitsout' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle ==  'polbikem' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'polbmwestaterpu1' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'bmw330d22' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'polbmwx566' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'polbmwx570' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'polandcruiserum' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'pollandseg' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'polm135ium' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'polaudis6um' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
             elseif vehicle == 'poltransitcarrier' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'polv70rpu' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'polbmw330um' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'polxc90rpuairport' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'polfordestaterpu' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'poltransitred' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif vehicle == 'poltransitpt' then 
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            end
        else 
            QBCore.Functions.Notify('You are not a cop.', 'error')
            
        end
    end)    
end)

RegisterNetEvent('dox:storecar')
AddEventHandler('dox:storecar', function()
    local Player = QBCore.Functions.GetPlayerData()

    QBCore.Functions.Notify('Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)



RegisterNetEvent('garage:menu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "👮 | Police Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Police Car TSG",
            txt = "Police BMW SUV",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'pol2sw',
                    
                }
            }
        },
        {
            id = 3,
            header = "Police TSG",
            txt = "Police BMW Estate",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polbmwestaterpu1',
                    
                }
            }
        },
        {
            id = 4,
            header = "Police TSG",
            txt = "Police Mitsubishi SUV",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polmitsout',
                    
                }
            }
        },
        {
            id = 5,
            header = "Police TSG",
            txt = "Police Sprinter",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'poltransitcarrier',
                    
                }
            }
        },
        {
            id = 6,
            header = "Police TSG",
            txt = "Police Ford Van",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'poltransitpt',
                    
                }
            }
        },
        {
            id = 7,
            header = "Police MO8",
            txt = "Police Volvo 70",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polv70rpu',
                    
                }
            }
        },
        {
            id = 8,
            header = "Police MO8",
            txt = "Police Ford Estate",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polfordestaterpu',
                    
                }
            }
        },
        {
            id = 9,
            header = "Police MO8",
            txt = "Police 330D 2022",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'bmw330d22',
                    
                }
            }
        },
        {
            id = 10,
            header = "Police MO8",
            txt = "Police Bike Marked",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polbikem',
                    
                }
            }
        },
        {
            id = 11,
            header = "Police BCU",
            txt = "Police BMW X5 Grey Version",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polbmwx566',
                    
                }
            }
        },
        {
            id = 12,
            header = "Police BCU",
            txt = "Police Volvo Grey Version",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polxc90rpuairport',
                    
                }
            }
        },
        {
            id = 13,
            header = "Police SCO19",
            txt = "Police BMW X5 2020",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polbmwx570',
                    
                }
            }
        },
        {
            id = 14,
            header = "Police SCO19",
            txt = "Police Range Rover 2019",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'pollandseg',
                    
                }
            }
        },
        {
            id = 15,
            header = "Police Command",
            txt = "Police Audi A6 2015",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polaudis6um',
                    
                }
            }
        },
        {
            id = 16,
            header = "Police Command",
            txt = "Police BMW 2019",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polbmw330um',
                    
                }
            }
        },
        {
            id = 17,
            header = "Police Command",
            txt = "Police BMW I135",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polm135ium',
                    
                }
            }
        },
        {
            id = 18,
            header = "Police Koala Only",
            txt = "Police Transit Red",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'poltransitred',
                    
                }
            }
        },
        
    })
end)

--- EMS Garage

RegisterNetEvent('ambulance:garage')
AddEventHandler('ambulance:garage', function(pd)
    local vehicle = pd.vehicle
    local coords = { ['x'] = 317.57, ['y'] = -578.52, ['z'] = 28.8, ['h'] = 250.01}
    

    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "ambulance" then
            if vehicle == 'hart3' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)    
            elseif  vehicle == 'hart1' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)        
            elseif  vehicle == 'las3' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)   
            elseif  vehicle == 'rrv2' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)   
            elseif  vehicle == 'hems1' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)  
            elseif  vehicle == 'lasbike' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif  vehicle == 'lasbike' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif  vehicle == 'las7' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif  vehicle == 'hart2' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            elseif  vehicle == 'las6' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            end
        else 
            QBCore.Functions.Notify('You are not an EMS', 'error')
            
        end
    end)    
end)

RegisterNetEvent('dox:storecar')
AddEventHandler('dox:storecar', function()
    local Player = QBCore.Functions.GetPlayerData()

    QBCore.Functions.Notify('Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)



RegisterNetEvent('garage:ambulance', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "🚑 | Ambulance Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Junior Paramedic",
            txt = "Nissan SUV",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'hart3',
                    
                }
            }
        },
        {
            id = 3,
            header = "Junior Paramedic",
            txt = "Volkswagen Van",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'hart1',
                    
                }
            }
        },
        {
            id = 4,
            header = "Paramedic",
            txt = "Mercedes Sprinter",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'las3',
                    
                }
            }
        },
        {
            id = 4,
            header = "Paramedic",
            txt = "Mercedes SUV",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'rrv2',
                    
                }
            }
        },
        {
            id = 5,
            header = "Doctor",
            txt = "Volkswagen SUV",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'las7',
                    
                }
            }
        },
        {
            id = 6,
            header = "Doctor",
            txt = "Mercedes Sprinter Doctor Version",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'hart2',
                    
                }
            }
        },
        {
            id = 6,
            header = "Search And Rescue",
            txt = "Red Skoda",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'hems1',
                    
                }
            }
        },
        {
            id = 7,
            header = "Search And Rescue",
            txt = "Green Response Bike",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'lasbike',
                    
                }
            }
        },
        {
            id = 8,
            header = "Search And Rescue",
            txt = "Mercedes shed on wheels",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'las5',
                    
                }
            }
        },
        {
            id = 9,
            header = "CMO // High Command",
            txt = "Mercedes Sprinter Special Version",
            params = {
                event = "ambulance:garage",
                args = {
                    vehicle = 'las6',
                    
                }
            }
        },
        {
            id = 10,
            header = "Store Vehicle",
            txt = "Store Vehicle Inside Garage",
            params = {
                event = "dox:storecar",
                args = {
                    
                }
            }
        },
        
    })
end)


