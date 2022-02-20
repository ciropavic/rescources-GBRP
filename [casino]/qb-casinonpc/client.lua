-- Configure the coordinates for the bartenders.

local bouncers = {
  {type=4, hash=0x9fd4292d, x = 1092.8, y = 207.9, z = -50.0, a = 114.31},
  {type=4, hash=0x9fd4292d, x = 1088.51, y = 212.03, z = -50.0, a = 183.23},
  {type=4, hash=0x9fd4292d, x = 1100.8, y = 226.52, z = -49.99, a = 167.17},
  {type=4, hash=0x9fd4292d, x = 1126.7, y = 241.07, z = -51.44, a = 98.35},
  {type=4, hash=0x9fd4292d, x = 1136.27, y = 260.55, z = -52.44, a = 210.89},
}

local punters = {
  {type=4, hash=0x36DF2D5D, x = 1096.72, y = 215.88, z = -50.99, a = 317.26},
  {type=4, hash=0x36DF2D5D, x = 1108.11, y = 207.55, z = -50.44, a = 329.61},
  {type=4, hash=0x36DF2D5D, x = 1107.95, y = 209.18, z = -50.44, a = 190.33},
  {type=4, hash=0xC454BCBB, x = 1113.93, y = 211.38, z = -50.44, a = 103.73},
  {type=4, hash=0xB585B217, x = 1148.18, y = 267.02, z = -52.84, a = 353.16},
}

Citizen.CreateThread(function()
	Wait(1000)
	-- Load the ig_gustavo
	RequestModel(GetHashKey("ig_gustavo"))
		while not HasModelLoaded(GetHashKey("ig_gustavo")) do
		Wait(1)
	end
	
	-- Load the bartender modal (S_F_Y_ClubBar_01)
	RequestModel(GetHashKey("S_F_Y_ClubBar_01"))
		while not HasModelLoaded(GetHashKey("S_F_Y_ClubBar_01")) do
		Wait(1)
	end

	-- Load the cashier U_F_M_CasinoCash_01 | 0xBB0D72F5
	RequestModel(GetHashKey("U_F_M_CasinoCash_01"))
		while not HasModelLoaded(GetHashKey("U_F_M_CasinoCash_01")) do
		Wait(1)
	end

	-- Load the cashier U_F_M_Debbie_01 | 0xD575A46
	RequestModel(GetHashKey("U_F_M_Debbie_01"))
		while not HasModelLoaded(GetHashKey("U_F_M_Debbie_01")) do
		Wait(1)
	end

	-- Load the shop U_F_M_CasinoShop_01 | 0x1427D428
	RequestModel(GetHashKey("U_F_M_CasinoShop_01"))
		while not HasModelLoaded(GetHashKey("U_F_M_CasinoShop_01")) do
		Wait(1)
	end

	-- Load the ped modal (s_m_m_bouncer_01)
	RequestModel(GetHashKey("s_m_m_bouncer_01"))
		while not HasModelLoaded(GetHashKey("s_m_m_bouncer_01")) do
		Wait(1)
	end
	
	-- Load the ped modal (a_f_y_bevhills_04)
	RequestModel(GetHashKey("a_f_y_bevhills_04"))
		while not HasModelLoaded(GetHashKey("a_f_y_bevhills_04")) do
		Wait(1)
	end
	
	-- Load the ped modal (u_m_m_griff_01)
	RequestModel(GetHashKey("u_m_m_griff_01"))
		while not HasModelLoaded(GetHashKey("u_m_m_griff_01")) do
		Wait(1)
	end
	
	-- Load the bouncer animation (testing)
	RequestAnimDict("mini@strip_club@idles@bouncer@base")
		while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
		Wait(1)
	end

	-- Spawn the bartender to the coordinates S_F_Y_ClubBar_01 | 0xC126394B
	bartender =  CreatePed(5, 0xC126394B, 1110.33, 208.9, -50.44, 63.96, false, true)
	TaskSetBlockingOfNonTemporaryEvents (bartender, true)
	SetPedFleeAttributes (bartender, 0, 0)
	SetPedCombatAttributes (bartender, 17, 1)
	SetEntityInvincible (bartender, false)

	-- Spawn the cashier to the coordinates U_F_M_CasinoCash_01 | 0xBB0D72F5
	cashier =  CreatePed(5, 0xBB0D72F5, 1117.83, 220.11, -50.44, 84.8, false, true)
	TaskSetBlockingOfNonTemporaryEvents (cashier, true)
	SetPedFleeAttributes (cashier, 0, 0)
	SetPedCombatAttributes (cashier, 17, 1)
	SetEntityInvincible (cashier, false)

	-- Spawn the reception to the coordinates U_F_M_Debbie_01 | 0xD575A46
	reception =  CreatePed(5, 0xD575A46, 1087.94, 221.16, -50.2, 182.16, false, true)
	TaskSetBlockingOfNonTemporaryEvents (reception , true)
	SetPedFleeAttributes (reception , 0, 0)
	SetPedCombatAttributes (reception, 17, 1)
	SetEntityInvincible (reception, false)

	-- Spawn the shop to the coordinates U_F_M_CasinoShop_01 | 0x1427D428
	shop =  CreatePed(5, 0x1427D428, 1100.53, 195.59, -50.44, 313.67, false, true)
	TaskSetBlockingOfNonTemporaryEvents (shop, true)
	SetPedFleeAttributes (shop, 0, 0)
	SetPedCombatAttributes (shop, 17, 1)
	SetEntityInvincible (shop, false)

	-- Spawn the bouncers to the coordinates / uncomment as required
	--[[for _, item in pairs(bouncers) do
		ped =  CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
		GiveWeaponToPed(ped, 0x1B06D571, 2800, false, true)
		SetPedCombatAttributes(ped, 46, true)
		SetPedCombatAbility(ped, 2)
		SetPedFleeAttributes(ped, 0, 0)
		SetPedArmour(ped, 100)
		SetPedMaxHealth(ped, 100)
		SetPedRelationshipGroupHash(ped, GetHashKey("SECURITY_GUARD"))
		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GUARD_STAND_PATROL", 0, true)
		SetPedCanRagdoll(ped, false)
		SetPedDiesWhenInjured(ped, false)
		TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
		SetEntityInvincible(ped, false)
		SetEntityAsMissionEntity(ped)
	end--]]
	
	-- Spawn the punters around the casino / uncomment as required
	--[[for _, item in pairs(punters) do
		ped1 =  CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
		TaskSetBlockingOfNonTemporaryEvents (ped1, true)
		SetPedFleeAttributes (ped1, 0, 0)
		SetPedCombatAttributes (ped1, 17, 1)
		SetEntityInvincible (ped1, false)
		TaskStartScenarioInPlace(ped1, "WORLD_HUMAN_PARTYING", 0, true)
	end--]]
end)