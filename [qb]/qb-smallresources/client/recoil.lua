local recoils = {
	[453432689] = 2.0, -- PISTOL
	[3219281620] = 2.3, -- PISTOL MK2
	[1593441988] = 2.0, -- COMBAT PISTOL
	[584646201] = 2.5, -- AP PISTOL
	[-1716589765] = 2.0, -- PISTOL .50
	[324215364] = 2.5, -- MICRO SMG
	[736523883] = 1.0, -- SMG
	[2024373456] = 0.1, -- SMG MK2
	[-270015777] = 1.3, -- ASSAULT SMG
	[-1074790547] = 1.9, -- ASSAULT RIFLE
	[961495388] = 0.2, -- ASSAULT RIFLE MK2
	[-2084633992] = 1.7, -- CARBINE RIFLE
	[4208062921] = 0.1, -- CARBINE RIFLE MK2
	[-1357824103] = 0.1, -- ADVANCED RIFLE
	[-1660422300] = 0.1, -- MG
	[2144741730] = 0.1, -- COMBAT MG
	[3686625920] = 0.1, -- COMBAT MG MK2
	[487013001] = 0.4, -- PUMP SHOTGUN
	[1432025498] = 0.35, -- PUMP SHOTGUN MK2
	[-1654528753] = 0.2, -- BULLPUP SHOTGUN
	[911657153] = 0.1, -- STUN GUN
	[100416529] = 0.5, -- SNIPER RIFLE
	[205991906] = 0.7, -- HEAVY SNIPER
	[177293209] = 0.6, -- HEAVY SNIPER MK2
	[856002082] = 1.2, -- REMOTE SNIPER
	[-1568386805] = 1.0, -- GRENADE LAUNCHER
	[1305664598] = 1.0, -- GRENADE LAUNCHER SMOKE
	[-1312131151] = 0.0, -- RPG
	[1752584910] = 0.0, -- STINGER
	[1119849093] = 0.01, -- MINIGUN
	[-1076751822] = 0.2, -- SNS PISTOL
	[1627465347] = 0.1, -- GUSENBERG
	[-1063057011] = 0.2, -- SPECIAL CARBINE
	[-1768145561] = 0.15, -- SPECIAL CARBINE MK2
	[-771403250] = 2.1, -- HEAVY PISTOL
	[2132975508] = 3.7, -- BULLPUP RIFLE
	[-2066285827] = 0.15, -- BULLPUP RIFLE MK2
	[137902532] = 2.2, -- VINTAGE PISTOL
	[-1466123874] = 0.7, -- MUSKET
	[984333226] = 0.2, -- HEAVY SHOTGUN
	[-952879014] = 0.3, -- MARKSMAN RIFLE
	[1785463520] = 0.25, -- MARKSMAN RIFLE MK2
	[1672152130] = 0, -- HOMING LAUNCHER
	[1198879012] = 0.9, -- FLARE GUN
	[171789620] = 1.1, -- COMBAT PDW
	[-598887786] = 0.9, -- MARKSMAN PISTOL
	[1834241177] = 2.4, -- RAILGUN
	[-619010992] = 0.7, -- MACHINE PISTOL
	[-1045183535] = 2.6, -- REVOLVER
	[-879347409] = 0.6, -- REVOLVER MK2
	[-275439685] = 0.7, -- DOUBLE BARREL SHOTGUN
	[1649403952] = 0.3, -- COMPACT RIFLE
	[317205821] = 1.3, -- AUTO SHOTGUN
	[125959754] = 0.5, -- COMPACT LAUNCHER
	[-1121678507] = 0.5, -- MINI SMG
	[-487013001] = 0.9, --PUMP Shotgun
	[-494615257] = 1.3, --SK12
	[2017895192] = 1.2, -- SawnOffShotgun
}

Citizen.CreateThread(
	function()
		while true do
			local ped = PlayerPedId()
			if IsPedShooting(ped) and not IsPedDoingDriveby(ped) then
				local _, wep = GetCurrentPedWeapon(ped)
				_, cAmmo = GetAmmoInClip(ped, wep)
				if recoils[wep] and recoils[wep] ~= 0 then
					tv = 0
					if GetFollowPedCamViewMode() ~= 4 then
						repeat
							Wait(0)
							p = GetGameplayCamRelativePitch()
							SetGameplayCamRelativePitch(p + 0.1, 0.2)
							tv = tv + 0.1
						until tv >= recoils[wep]
					else
						repeat
							Wait(0)
							p = GetGameplayCamRelativePitch()
							if recoils[wep] > 0.1 then
								SetGameplayCamRelativePitch(p + 0.6, 1.2)
								tv = tv + 0.6
							else
								SetGameplayCamRelativePitch(p + 0.016, 0.333)
								tv = tv + 0.1
							end
						until tv >= recoils[wep]
					end
				end
			end

			Citizen.Wait(0)
		end
	end
)

--Melee
SetWeaponDamageModifierThisFrame(0x92A27487, 0.17) -- weapon_dragger
SetWeaponDamageModifierThisFrame(0x958A4A8F, 0.11) -- weapon_bat
SetWeaponDamageModifierThisFrame(0xA2719263, 0.08) -- weapon_unarmed
SetWeaponDamageModifierThisFrame(0x678B81B1, 0.10) -- weapon_nightstick
SetWeaponDamageModifierThisFrame(0x19044EE0, 0.15) -- weapon_wrench
SetWeaponDamageModifierThisFrame(0x4E875F73, 0.13) -- weapon_hammer
SetWeaponDamageModifierThisFrame(0x94117305, 0.08) -- weapon_poolcue
SetWeaponDamageModifierThisFrame(0x99B507EA, 0.17) -- weapon_knife
SetWeaponDamageModifierThisFrame(0xF9DCBF2D, 0.20) -- weapon_hatchet

--Pistols
SetWeaponDamageModifierThisFrame(0x1B06D571, 0.53) -- weapon_pistol
SetWeaponDamageModifierThisFrame(0xBFE256D4, 0.59) -- weapon_pistol mk2
SetWeaponDamageModifierThisFrame(0x5EF9FEC4, 0.55) -- weapon_combatpistol
SetWeaponDamageModifierThisFrame(0x22D8FE39, 0.55) -- weapon_APPistol
SetWeaponDamageModifierThisFrame(0x99AEEB3B, 0.69) -- weapon_pistol50
--SetWeaponDamageModifierThisFrame(0xBFD21232, 0.65) -- weapon_snspistol
--SetWeaponDamageModifierThisFrame(0x88374054, 0.35) -- weapon_snspistol_mk2
SetWeaponDamageModifierThisFrame(0xD205520E, 0.57) -- weapon_heavypistol
SetWeaponDamageModifierThisFrame(0x83839C4, 0.56) -- weapon_vintagepistol
SetWeaponDamageModifierThisFrame(0xC1B3C3D1, 0.32) -- weapon_revolver
--SetWeaponDamageModifierThisFrame(0xCB96392F, 0.32) -- weapon_revolver_mk2
SetWeaponDamageModifierThisFrame(0xBFD21232, 0.55) -- weapon_snspistol

--smgs
SetWeaponDamageModifierThisFrame(0x13532244, 0.67) -- Micro SMG
SetWeaponDamageModifierThisFrame(0x2BE6766B, 0.73) -- weapon_smg
SetWeaponDamageModifierThisFrame(0xEFE7E2DF, 0.68) -- weapon_assaultsmg
SetWeaponDamageModifierThisFrame(0x0A3D4D34, 0.45) -- weapon_combatpdw
SetWeaponDamageModifierThisFrame(0xDB1AA450, 0.50) -- weapon_machinepistol
SetWeaponDamageModifierThisFrame(0xBD248B55, 0.63) -- weapon_minismg

--Short Gun
SetWeaponDamageModifierThisFrame(0xBD248B55, 0.60) -- weapon_pumpshotgun
SetWeaponDamageModifierThisFrame(0x7846A318, 0.50) -- weapon_sawnoffshotgun
SetWeaponDamageModifierThisFrame(0xE284C527, 0.40) -- weapon_assaultshotgun
SetWeaponDamageModifierThisFrame(0x12E82D3D, 0.43) -- weapon_autoshotgun



--Assault rifles

SetWeaponDamageModifierThisFrame(0xBFEFFF6D, 0.70) -- Assault rifle - 12 shots
SetWeaponDamageModifierThisFrame(0x83BF0278, 0.50) -- weapon_carbinerifle
SetWeaponDamageModifierThisFrame(0xAF113F99, 0.49) -- weapon_advancedrifle
SetWeaponDamageModifierThisFrame(0xC0A3098D, 0.50) -- weapon_specialcarbine
SetWeaponDamageModifierThisFrame(0x7F229F94, 0.50) -- weapon_bullpuprifle
SetWeaponDamageModifierThisFrame(0x624FE830, 0.45) -- weapon_compactrifle
