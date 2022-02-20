CreateThread(function()
	while true do
        local WaitTime = 1200
        for k, v in pairs(Config.entry) do 
            local PlayerCoords = GetEntityCoords(PlayerPedId())
            if #(PlayerCoords - v) < 2.0 then
                WaitTime = 5
                DrawText3D(v.x, v.y, v.z, '~o~E~w~ - Enter Building')
                if IsControlJustReleased(0, 38) then
                    if Config.useItem then
                        TriggerServerEvent('qb-moneylaundering:enter:checkitem')
                    else
                        local Password = Input("What is the secret code?", "", 40)
                        if Password ~= nil then
                            if Password == Config.code then
                                Enter()
                            end
                        end
                    end
                end
            end
        end
        Wait(WaitTime)
	end
end)

CreateThread(function()
	while true do
        local WaitTime = 1200
        local PlayerCoords = GetEntityCoords(PlayerPedId())
        if #(PlayerCoords - vector3(1138.11, -3198.7, -39.67)) < 2.0 then
            WaitTime = 5
            DrawText3D(1138.11, -3198.7, -39.67, '~o~E~w~ - Leave Building')
            if IsControlJustReleased(0, 38) then
                Leave()
            end
        end
        Wait(WaitTime)
	end
end)

CreateThread(function()
    while true do
        local WaitTime = 600
        for k, v in pairs(Config.washingmachines) do 
            local PlayerCoords = GetEntityCoords(PlayerPedId())
            if #(PlayerCoords - Config.washingmachines[k].coords) < 0.7 then
                WaitTime = 5
                if not Config.washingmachines[k].inUse then
                    DrawText3D(Config.washingmachines[k].coords.x, Config.washingmachines[k].coords.y, Config.washingmachines[k].coords.z, '~o~E~w~ - Launder Money')
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent('qb-moneylaundering:launder:check', k)
                    end
                else
                    if k == 1 then
                        if GlobalState.washingmachine1 == '~o~E~w~ - Collect the cash' then
                            DrawText3D(Config.washingmachines[k].coords.x, Config.washingmachines[k].coords.y, Config.washingmachines[k].coords.z, GlobalState.washingmachine1)
                            if IsControlJustReleased(0, 38) then
                                Config.washingmachines[k].inUse = false 
                                TriggerServerEvent('qb-moneylaundering:launder:collect', k)
                            end
                        else
                            DrawText3D(Config.washingmachines[k].coords.x, Config.washingmachines[k].coords.y, Config.washingmachines[k].coords.z, GlobalState.washingmachine1)
                        end
                    elseif k == 2 then
                        if GlobalState.washingmachine2 == '~o~E~w~ - Collect the cash' then
                            DrawText3D(Config.washingmachines[k].coords.x, Config.washingmachines[k].coords.y, Config.washingmachines[k].coords.z, GlobalState.washingmachine2)
                            if IsControlJustReleased(0, 38) then
                                Config.washingmachines[k].inUse = false 
                                TriggerServerEvent('qb-moneylaundering:launder:collect', k)
                            end
                        else
                            DrawText3D(Config.washingmachines[k].coords.x, Config.washingmachines[k].coords.y, Config.washingmachines[k].coords.z, GlobalState.washingmachine2)
                        end
                    elseif k == 3 then
                        if GlobalState.washingmachine3 == '~o~E~w~ - Collect the cash' then
                            DrawText3D(Config.washingmachines[k].coords.x, Config.washingmachines[k].coords.y, Config.washingmachines[k].coords.z, GlobalState.washingmachine3)
                            if IsControlJustReleased(0, 38) then
                                Config.washingmachines[k].inUse = false 
                                TriggerServerEvent('qb-moneylaundering:launder:collect', k)
                            end
                        else
                            DrawText3D(Config.washingmachines[k].coords.x, Config.washingmachines[k].coords.y, Config.washingmachines[k].coords.z, GlobalState.washingmachine3)
                        end
                    else
                        if GlobalState.washingmachine4 == '~o~E~w~ - Collect the cash' then
                            DrawText3D(Config.washingmachines[k].coords.x, Config.washingmachines[k].coords.y, Config.washingmachines[k].coords.z, GlobalState.washingmachine4)
                            if IsControlJustReleased(0, 38) then
                                Config.washingmachines[k].inUse = false 
                                TriggerServerEvent('qb-moneylaundering:launder:collect', k)
                            end
                        else
                            DrawText3D(Config.washingmachines[k].coords.x, Config.washingmachines[k].coords.y, Config.washingmachines[k].coords.z, GlobalState.washingmachine4)
                        end
                    end
                end
            end
        end
        Wait(WaitTime)
    end
end)


-- EVENTS
RegisterNetEvent('qb-moneylaundering:enter:confirm', function()
    Enter()
end)

RegisterNetEvent('qb-moneylaundering:launder:confirm', function(k)
    LoadAnimDict("anim_casino_a@amb@casino@games@arcadecabinet@maleleft") 
    TaskPlayAnim(PlayerPedId(), "anim_casino_a@amb@casino@games@arcadecabinet@maleleft", "win", 5.0, 1.0, -1, 16, 1, 0, 0, 0)
    Config.washingmachines[k].inUse = true
    TriggerServerEvent('qb-moneylaundering:launder:machine', k)
end)


-- FUNCTIONS
function DrawText3D(x, y, z, text)
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

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(7)
    end    
end

function Enter()
    Inside = true
    LoadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    DoScreenFadeOut(500)
    Wait(1000)
    ClearPedTasks(PlayerPedId())
    SetEntityCoords(PlayerPedId(), vector3(1138.11, -3198.7, -39.67))
	DoScreenFadeIn(500)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
end

function Leave()
    Inside = false
    LoadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    DoScreenFadeOut(500)
    Wait(1000)
    ClearPedTasks(PlayerPedId())
    for k, v in pairs(Config.entry) do
        SetEntityCoords(PlayerPedId(), v)
    end
	DoScreenFadeIn(500)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
end

function Input(Titel, Placeholder, MaxLenght)
	AddTextEntry('FMMC_KEY_TIP1', Titel)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", Placeholder, "", "", "", MaxLenght)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Wait(500)
		blockinput = false
		return result --Returns the result
	else
		Wait(500)
		blockinput = false
		return nil
	end
end