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

local hasActivePins = false
local currentLane = 0
local totalThrown = 0
local totalDowned = 0
local lastBall = 0
local lanes = Config.BowlingLanes
local inBowlingZone = false
local uselane = 0
local lastusebowlingticket = 0

local function canUseLane(pLaneId)
    if pLaneId == uselane then
        return true
    end
    return false
end

Citizen.CreateThread(function()
    for k, v in pairs(lanes) do
        if (not v.enabled) then goto continueBox end

        exports["np-polyzone"]:AddBoxZone("np-bowling:lane_"..k, v.pos, 1.8, 2.0, {
            heading=0,
            minZ=23.85,
            maxZ=27.85
        })

        ::continueBox::
    end

    exports["np-polyzone"]:AddBoxZone("bowling_alley", vector3(743.95, -774.54, 26.34), 16.8, 30.4, {
        heading=0,
        minZ=23.85,
        maxZ=28.85
    })

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

Citizen.CreateThread(function()
    while true do 
        local inRange = false
        local pos = GetEntityCoords(PlayerPedId())
        local accessBowling = GetDistanceBetweenCoords(pos,  754.98, -775.21, 26.34, true)
        local numLane12 = GetDistanceBetweenCoords(pos,   747.73, -780.87, 27.22, true)
        local numLane34 = GetDistanceBetweenCoords(pos,  747.63, -776.71, 27.22 , true)
        local numLane56 = GetDistanceBetweenCoords(pos,  747.69, -772.55, 27.02 , true)
        local numLane8 = GetDistanceBetweenCoords(pos,  747.61, -768.29, 27.22 , true)

        if accessBowling <= 5 then
            inRange = true
            DrawMarker(2,754.98, -775.21, 26.34, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if accessBowling < 1 then
                DrawText3Ds(754.98, -775.21, 26.34, "[E] Buy Access Bowling")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("np-bowling:purchaseMenu")
                end
            end
            
        end

        if numLane12 <= 2 then
            inRange = true
            if numLane12 < 1 then
                DrawText3Ds(747.73, -780.87, 27.22-0.9, "[E] Spawn Pins Bowling")
                if IsControlJustReleased(0, 38) then
                    local lane1 = canUseLane(1)
                    local lane2 = canUseLane(2)
                    if lane1 then
                        TriggerEvent("np-bowling:setupPins", 1)
                    end

                    if lane2 then
                        TriggerEvent("np-bowling:setupPins", 2)
                    end
                end
            end
        end

        if numLane34 <= 2 then
            inRange = true
            if numLane34 < 1 then
                DrawText3Ds(747.63, -776.71, 27.22-0.9, "[E] Spawn Pins Bowling")
                if IsControlJustReleased(0, 38) then
                    local lane3 = canUseLane(3)
                    local lane4 = canUseLane(4)
                    if lane3 then
                        TriggerEvent("np-bowling:setupPins", 3)
                    end

                    if lane4 then
                        TriggerEvent("np-bowling:setupPins", 4)
                    end
                end
            end
        end

        if numLane56 <= 2 then
            inRange = true
            if numLane56 < 1 then
                DrawText3Ds(747.69, -772.55, 27.02-0.9, "[E] Spawn Pins Bowling")
                if IsControlJustReleased(0, 38) then
                    local lane5 = canUseLane(5)
                    local lane6 = canUseLane(6)
                    if lane5 then
                        TriggerEvent("np-bowling:setupPins", 5)
                    end

                    if lane6 then
                        TriggerEvent("np-bowling:setupPins", 6)
                    end
                end
            end
        end

        if numLane8 <= 2 then
            inRange = true
            if numLane8 < 1 then
                DrawText3Ds( 747.61, -768.29, 27.22 -0.9, "[E] Spawn Pins Bowling")
                if IsControlJustReleased(0, 38) then
                    local numLane8 = canUseLane(8)
                    if numLane8 then
                        TriggerEvent("np-bowling:setupPins",8 )
                    end
                end
            end
        end
        if not inRange then
            Citizen.Wait(1500)
        end
        Citizen.Wait(5)
    end
end)

local function drawStatusHUD(state, pValues)
    local title = "Bowling - Lane #" .. currentLane
    local values = {}
  
    table.insert(values, "Throws: " .. totalThrown)
    table.insert(values, "Downed: " .. totalDowned)

    if (pValues) then
        for k, v in pairs(pValues) do
        table.insert(values, v)
        end
    end
    
    SendNUIMessage({
        app = "status-hud",
        show = false,
        data = {
            show = state,
            title = title,
            values = values
        },
    })
end

AddEventHandler('np-bowling:setupPins', function(pLane)
    local thistime = GetCloudTimeAsInt()
    if (thistime - lastusebowlingticket ) <= 240 then
        local lane = pLane

        if (not lanes[lane]) then return end
        if (hasActivePins) then return end
    
        hasActivePins = true
        currentLane = lane
    
        drawStatusHUD(true)
    
        createPins(lanes[lane].pins)
    end
end)

local function canUseBall()
    return (lastBall == 0 or lastBall + 6000 < GetGameTimer()) and (inBowlingZone)
end

local function resetBowling()
    removePins()
    hasActivePins = false
    drawStatusHUD(false)
end

local gameState = {}
gameState[1] = {
    onState = function()
        if (totalDowned >= 10) then
            QBCore.Functions.Notify('Strike!', 'success')
            drawStatusHUD(true, {"Strike!"})

            Citizen.Wait(1500)

            resetBowling()
            totalDowned = 0
            totalThrown = 0
        elseif (totalDowned < 10) then
            removeDownedPins()
            drawStatusHUD(true, {"Throw again!"})
        end
    end
}
gameState[2] = {
    onState = function()
        if (totalDowned >= 10) then
            QBCore.Functions.Notify('Spare!', 'success')
            drawStatusHUD(true, {"Spare!"})

            Citizen.Wait(500)

            resetBowling()
        elseif (totalDowned < 10) then
            QBCore.Functions.Notify('You downed ' .. totalDowned .. ' pins!', 'success')

            Citizen.Wait(1500)

            resetBowling()
        end

        totalDowned = 0
        totalThrown = 0
    end
}

RegisterNetEvent("np-bowling:itemUsed")
AddEventHandler('np-bowling:itemUsed', function(pItemId,pItemInfo)
    if pItemId == "bowlingreceipt" then
        uselane = pItemInfo.info.lane
        lastusebowlingticket = GetCloudTimeAsInt()
        TriggerServerEvent("np-bowling:removeTicket")
    end
    if (pItemId == 'bowlingball') then 
        if (IsPedInAnyVehicle(PlayerPedId(), true)) then return end

        -- Cooldown
        if (not canUseBall()) then return end

        startBowling(false, function(ballObject)
            lastBall = GetGameTimer()
            
            if (hasActivePins) then
                totalThrown = totalThrown + 1

                local isRolling = true
                local timeOut = false

                while (isRolling and not timeOut) do
                    Citizen.Wait(100)

                    local ballPos = GetEntityCoords(ballObject)
                    
                    if (lastBall == 0 or lastBall + 10000 < GetGameTimer()) then
                        timeOut = true
                    end 

                    if (ballPos.x < 730.0) then
                        -- Finish line baby
                        isRolling = false
                    end
                end

                Citizen.Wait(5000)

                totalDowned = getPinsDownedCount()

                if (timeOut) then
                    drawStatusHUD(true, {"Time's up!"})
                    timeOut = false
                end

                if (gameState[totalThrown]) then
                    gameState[totalThrown].onState()
                end

                removeBowlingBall()
            end
        end)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    drawStatusHUD(false)
end)

AddEventHandler("np-polyzone:enter", function(zone, data)
    if zone ~= "bowling_alley" then return end

    inBowlingZone = true
end)

AddEventHandler("np-polyzone:exit", function(zone, data)
    if zone ~= "bowling_alley" then return end

    inBowlingZone = false

    if (hasActivePins) then
        resetBowling()
        totalDowned = 0
        totalThrown = 0
    end
end)

RegisterNetEvent('np-bowling:purchaseMenu', function()
    local datamenu = {}
    for _,pData in pairs(Config.BowlingVendor) do
        table.insert( datamenu,{
            id = #datamenu + 1,
            header = pData.name,
            txt = "$"..pData.price.."",
            params = {
                event = pData.event
            }
        })
    end
    TriggerEvent('nh-context:sendMenu', datamenu)
end)

RegisterNetEvent("np-bowling:buyBalls",function()
    TriggerServerEvent("np-bowling:buyBallAccess")
end)

RegisterNetEvent("np-bowling:client:buyLaneAccess",function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "< Go Back",
            txt = "",
            params = {
                event = "np-bowling:purchaseMenu"
            }
        },
        {
            id = 2,
            header = "Lane #1",
            txt = "",
            params = {
                event = "np-bowling:buyLanes",
                args = {
                    id = 1,
                }
                
            }
        },
        {
            id = 3,
            header = "Lane #2",
            txt = "",
            params = {
                event = "np-bowling:buyLanes",
                args = {
                    id = 2,
                }
               
            }
        },
        {
            id = 4,
            header = "Lane #3",
            txt = "",
            params = {
                event = "np-bowling:buyLanes",
                args = {
                    id = 3,
                }
                
                
            }
        },
        {
            id = 5,
            header = "Lane #4",
            txt = "",
            params = {
                event = "np-bowling:buyLanes",
                args = {
                    id = 4,
                }
            }
        },
        {
            id = 6,
            header = "Lane #5",
            txt = "",
            params = {
                event = "np-bowling:buyLanes",
                args = {
                    id = 5,
                }
            }
        },
        {
            id = 7,
            header = "Lane #6",
            txt = "",
            params = {
                event = "np-bowling:buyLanes",
                args = {
                    id = 6,
                }
            }
        },
        {
            id = 8,
            header = "Lane #8",
            txt = "",
            params = {
                event = "np-bowling:buyLanes",
                args = {
                    id = 8,
                }
            }
        },
    })
end)

RegisterNetEvent("np-bowling:buyLanes", function(data)
    TriggerServerEvent("np-bowling:buyLaneAccess", data.id)
end)