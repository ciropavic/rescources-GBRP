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

local validHuntingZones = nil
local animals = nil
local baitDistanceInUnits = nil
local spawnDistanceRadius = nil

local baitLocation = nil
local baitLastPlaced = 0
local targetedEntity = nil

local animalList = {
    { name = "Boar", hash = `a_c_boar` },
    { name = "Cat", hash = `a_c_cat_01` },
    { name = "Chicken", hash = `a_c_chickenhawk` },
    { name = "Chimp", hash = `a_c_chimp` },
    { name = "Chop", hash = `a_c_chop` },
    { name = "Cormorant", hash = `a_c_cormorant` },
    { name = "Cow", hash = `a_c_cow` },
    { name = "Coyote", hash = `a_c_coyote` },
    { name = "Crow", hash = `a_c_crow` },
    { name = "Deer", hash = `a_c_deer` },
    { name = "Hen", hash = `a_c_hen` },
    { name = "Husky", hash = `a_c_husky` },
    { name = "Mountain-Lion", hash = `a_c_mtlion` },
    { name = "Pig", hash = `a_c_pig` },
    { name = "Pigeon", hash = `a_c_pigeon` },
    { name = "Poodle", hash = `a_c_poodle` },
    { name = "Pug", hash = `a_c_pug` },
    { name = "Rabbit", hash = `a_c_rabbit_01` },
    { name = "Rat", hash = `a_c_rat` },
    { name = "Retriever", hash = `a_c_retriever` },
    { name = "Chimp", hash = `a_c_rhesus` },
    { name = "Rottweiler", hash = `a_c_rottweiler` },
    { name = "Seagull", hash = `a_c_seagull` },
    { name = "Shepherd", hash = `a_c_shepherd` },
    { name = "Westy", hash = `a_c_westy` },
    { name = "Panther", hash = `a_c_panther` },
}

DecorRegister("HuntingMySpawn", 2)
DecorRegister("HuntingIllegal", 2)

Citizen.CreateThread(function()
    Citizen.Wait(10)
    QBCore.Functions.TriggerCallback("np-hunting:getSettings", function(result)
        animals = result.animals
        baitDistanceInUnits = result.baitDistanceInUnits
        spawnDistanceRadius = result.spawnDistanceRadius
        validHuntingZones = result.validHuntingZones
    end)
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
        local huntingShop = GetDistanceBetweenCoords(pos, -678.10, 5838.64, 17.33, true)
        local huntingSales = GetDistanceBetweenCoords(pos, 569.32, 2796.66, 42.02, true)

        if huntingShop <= 5 then
            inRange = true
            DrawMarker(2, -678.10, 5838.64, 17.33, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if huntingShop < 1 then
                DrawText3Ds(-678.10, 5838.64, 17.33, "[E] Hunting Shop")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("np-hunting:huntingShop")
                end
            end
        end
        
        if huntingSales <= 5 then
            inRange = true
            DrawMarker(2, 569.32, 2796.66, 42.02, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if huntingSales < 1 then
                DrawText3Ds(569.32, 2796.66, 42.02, "[E] Sell Animal Pelt")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("np-hunting:huntingSales")
                end
            end
        end

        if not inRange then
            Citizen.Wait(1500)
        end
        Citizen.Wait(5)
    end
end)

local huntingShop = {
    ['huntingRifle'] = {
        name = 'Hunting Rifle $250',
        txt = "1x",
        event = "np-hunting:huntingRifle"
    },
    ['huntingAmmo'] = {
        name = 'Hunting Ammo $100',
        txt = "1x",
        event = "np-hunting:huntingAmmo"
    },
    ['huntingKnife'] = {
        name = 'Hunting Knife $80',
        txt = "1x",
        event = "np-hunting:huntingKnife"
    },
    ['huntingBait'] = {
        name = 'Animal Bait $50',
        txt = "1x",
        event = "np-hunting:animalBait"
    },
}

RegisterNetEvent('np-hunting:huntingShop', function()
    local dataMenu = {}
    for _, pData in pairs(huntingShop) do
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

RegisterNetEvent("np-hunting:huntingRifle")
AddEventHandler("np-hunting:huntingRifle", function()
    TriggerServerEvent("np-hunting:buyItems", "huntingrifle")
end)

RegisterNetEvent("np-hunting:huntingAmmo")
AddEventHandler("np-hunting:huntingAmmo", function()
    TriggerServerEvent("np-hunting:buyItems", "huntingammo")
end)

RegisterNetEvent("np-hunting:huntingKnife")
AddEventHandler("np-hunting:huntingKnife", function()
    TriggerServerEvent("np-hunting:buyItems", "huntingknife")
end)

RegisterNetEvent("np-hunting:animalBait")
AddEventHandler("np-hunting:animalBait", function()
    TriggerServerEvent("np-hunting:buyItems", "huntingbait")
end)

AddEventHandler("np:target:changed", function(pEntity)
    targetedEntity = pEntity
end)

local function isValidZone()
    return validHuntingZones[GetNameOfZone(GetEntityCoords(PlayerPedId()))] == true
end

local function getSpawnLoc()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local spawnCoords = nil
    while spawnCoords == nil do
        local spawnX = math.random(-spawnDistanceRadius, spawnDistanceRadius)
        local spawnY = math.random(-spawnDistanceRadius, spawnDistanceRadius)
        local spawnZ = baitLocation.z
        local vec = vector3(baitLocation.x + spawnX, baitLocation.y + spawnY, spawnZ)
        if #(playerCoords - vec) > spawnDistanceRadius then
            spawnCoords = vec
        end
    end
    local worked, groundZ, normal = GetGroundZAndNormalFor_3dCoord(spawnCoords.x, spawnCoords.y, 1023.9)
    spawnCoords = vector3(spawnCoords.x, spawnCoords.y, groundZ)
    return spawnCoords
end

local function spawnAnimal(loc)
    local chance = math.random()
    local foundAnimal = false

    for _, animal in pairs(animals) do
        if foundAnimal == false and animal.chance > chance then
            foundAnimal = animal
        end
    end

    local modelName = foundAnimal.model
    RequestModel(modelName)
    while not HasModelLoaded(modelName) do
        Citizen.Wait(0)
    end
    local spawnLoc = getSpawnLoc()
    local spawnedAnimal = CreatePed(28, foundAnimal.hash, spawnLoc, true, true, true)
    DecorSetBool(spawnedAnimal, "HuntingMySpawn", true)
    DecorSetBool(spawnedAnimal, "HuntingIllegal", foundAnimal.illegal)
    if foundAnimal.illegal and math.random() < 0.4 then
        local plyPos = GetEntityCoords(PlayerPedId())
        TriggerServerEvent('dispatch:svNotify', {
            dispatchCode = "10-45",
            origin = {
            x = plyPos.x,
            y = plyPos.y,
            z = plyPos.z,
            },
        })
    end
    SetModelAsNoLongerNeeded(modelName)
    TaskGoStraightToCoord(spawnedAnimal, loc, 1.0, -1, 0.0, 0.0)
    Citizen.CreateThread(function()
        local finished = false
        while not IsPedDeadOrDying(spawnedAnimal) and not finished do
            local spawnedAnimalCoords = GetEntityCoords(spawnedAnimal)
            if #(loc - spawnedAnimalCoords) < 0.5 then
                ClearPedTasks(spawnedAnimal)
                Citizen.Wait(1500)
                TaskStartScenarioInPlace(spawnedAnimal, "WORLD_DEER_GRAZING", 0, true)
                Citizen.SetTimeout(7500, function()
                    finished = true
                end)
            end
            if #(spawnedAnimalCoords - GetEntityCoords(PlayerPedId())) < 15.0 then
                ClearPedTasks(spawnedAnimal)
                TaskSmartFleePed(spawnedAnimal, PlayerPedId(), 600.0, -1)
                finished = true
            end
            Citizen.Wait(1000)
        end
        if not IsPedDeadOrDying(spawnedAnimal) then
            TaskSmartFleePed(spawnedAnimal, PlayerPedId(), 600.0, -1)
        end
    end)
end

local function baitDown()
    Citizen.CreateThread(function()
        while baitLocation ~= nil do
            local coords = GetEntityCoords(PlayerPedId())
            if #(baitLocation - coords) > baitDistanceInUnits then
                if math.random() < 0.05 then
                    spawnAnimal(baitLocation)
                    baitLocation = nil
                end
            end
            Citizen.Wait(8000)
        end
    end)
end

RegisterNetEvent("np-hunting:itemUsed")
AddEventHandler('np-hunting:itemUsed', function(pItemId, pItemInfo)
    if pItemId == "huntingbait" then
        if not isValidZone() then
            QBCore.Functions.Notify("You can't hunt here...", 'error')
            return
        end
        if baitLastPlaced ~= 0 and GetGameTimer() < (baitLastPlaced + (60000 * 10)) then -- 10 minutes
            QBCore.Functions.Notify("Your nose can't take it yet...", 'error')
            return
        end
        baitLocation = nil

        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
        QBCore.Functions.Progressbar("place_bait", "Placing Bait", 15000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = '',
            anim = '',
            flags = 0,
        }, {}, {}, function() -- Done
            baitLastPlaced = GetGameTimer()
            baitLocation = GetEntityCoords(PlayerPedId())
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify("Wew, pungenty...", 'success')
            TriggerServerEvent("np-hunting:removeItem", "huntingbait")
            baitDown()
        end, function() -- Cancel    
            baitLocation = nil
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify("Placement Cancelled", 'error')
            return
        end)
    end
    if (pItemId == 'huntingknife') then 
        if GetPedType(targetedEntity) ~= 28 or not IsPedDeadOrDying(targetedEntity) then
            QBCore.Functions.Notify("No animal found", 'error')
            return
        end
        local myAnimal = targetedEntity
        TaskTurnPedToFaceEntity(PlayerPedId(), myAnimal, -1)
        Citizen.Wait(1500)
        ClearPedTasksImmediately(PlayerPedId())

        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
        QBCore.Functions.Progressbar("place_bait", "Preparing Animal", 3000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = '',
            anim = '',
            flags = 0,
        }, {}, {}, function() -- Done
            local animalName = GetAnimalName(myAnimal)
            ClearPedTasks(PlayerPedId())
            ClearPedSecondaryTask(PlayerPedId())
            local mySpawn = DecorExistOn(myAnimal, "HuntingMySpawn") and DecorGetBool(myAnimal, "HuntingMySpawn")
            local illegalSpawn = DecorExistOn(myAnimal, "HuntingIllegal") and DecorGetBool(myAnimal, "HuntingIllegal")

            QBCore.Functions.TriggerCallback("np-hunting:getSkinnedItem", function() end, NetworkGetNetworkIdFromEntity(myAnimal), mySpawn, illegalSpawn, animalName)
        end, function() -- Cancel    
            ClearPedTasksImmediately(PlayerPedId())
            QBCore.Functions.Notify("Preparing Cancelled", 'error')
            return
        end)
    end
end)

function GetAnimalName(myAnimal)
    local animalHash = GetEntityModel(myAnimal)
    local animalDNA = "Unknown-Animal"
    for i,v in ipairs(animalList) do
        if v.hash == animalHash then
            animalDNA = v.name
        end
    end
    return animalDNA
end