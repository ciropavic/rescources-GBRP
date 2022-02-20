local Commmand = "megaphone"

local usingMegaphone, hasSet = false, false
local attachedProp = 0

RegisterCommand("megaphone", function()
  usingMegaphone = not usingMegaphone
  if usingMegaphone then
    useMegaphone()
  else
    endanims()
  end
end)

function useMegaphone()
  local ped = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(ped)
  if usingMegaphone then
    local animDictionary, animName = "amb@world_human_mobile_film_shocking@female@base", "base"
    loadAnimDict(animDictionary)
    endanims()
    attachMegaphone()
    TaskPlayAnim(ped, animDictionary, animName, 1.0, 1.0, GetAnimDuration(animDictionary, animName), 49, 0, 0, 0, 0)
    Wait(100)
    while usingMegaphone and not IsEntityDead(ped) and (GetVehiclePedIsIn(ped) == 0) and IsEntityPlayingAnim(ped, "amb@world_human_mobile_film_shocking@female@base", "base", 3) do
      if not hasSet then
        TriggerServerEvent("megaphone:toggle", true)
        hasSet = true
      end
      Wait(0)
    end
    usingMegaphone = false
    hasSet = false
    TriggerServerEvent("megaphone:toggle", false)
    StopAnimTask(ped, animDictionary, animName, 3.0)
    removeAttachedProp()
  end
end

function loadAnimDict(dict)
  while ( not HasAnimDictLoaded( dict ) ) do
      RequestAnimDict( dict )
      Citizen.Wait( 5 )
  end
end

function endanims()
  local ped = GetPlayerPed(-1)
  ClearPedTasks(ped)
  removeAttachedProp()
end

function removeAttachedProp()
	if DoesEntityExist(attachedProp) then
		DeleteEntity(attachedProp)
		attachedProp = 0
	end
end

function attachMegaphone()
	removeAttachedProp()
	local attachModel = GetHashKey("prop_megaphone_01")
	SetCurrentPedWeapon(PlayerPedId(), 0xA2719263)
	RequestModel(attachModel)
	while not HasModelLoaded(attachModel) do
		Citizen.Wait(100)
	end
	attachedProp = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
	SetModelAsNoLongerNeeded(attachModel)
	AttachEntityToEntity(attachedProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.04, -0.01, 0.0, 22.0, -4.0, 87.0, 1, 1, 0, 0, 2, 1)
end