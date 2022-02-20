local Config, Players, Types, Entities, Models, Zones, Bones, PlayerData = {}, {}, {}, {}, {}, {}, {}, {}
Types[1], Types[2], Types[3] = {}, {}, {}

-- This is the vehicle bones table, this is needed to verify if the vehicle bone exists when checking them, here is a list of vehicle bones you can use, all of them are included in this table: https://wiki.rage.mp/index.php?title=Vehicle_Bones
Config.VehicleBones = {'chassis', 'chassis_lowlod', 'chassis_dummy', 'seat_dside_f', 'seat_dside_r', 'seat_dside_r1', 'seat_dside_r2', 'seat_dside_r3', 'seat_dside_r4', 'seat_dside_r5', 'seat_dside_r6', 'seat_dside_r7', 'seat_pside_f', 'seat_pside_r', 'seat_pside_r1', 'seat_pside_r2', 'seat_pside_r3', 'seat_pside_r4', 'seat_pside_r5', 'seat_pside_r6', 'seat_pside_r7', 'window_lf1', 'window_lf2', 'window_lf3', 'window_rf1', 'window_rf2', 'window_rf3', 'window_lr1', 'window_lr2', 'window_lr3', 'window_rr1', 'window_rr2', 'window_rr3', 'door_dside_f', 'door_dside_r', 'door_pside_f', 'door_pside_r', 'handle_dside_f', 'handle_dside_r', 'handle_pside_f', 'handle_pside_r', 'wheel_lf', 'wheel_rf', 'wheel_lm1', 'wheel_rm1', 'wheel_lm2', 'wheel_rm2', 'wheel_lm3', 'wheel_rm3', 'wheel_lr', 'wheel_rr', 'suspension_lf', 'suspension_rf', 'suspension_lm', 'suspension_rm', 'suspension_lr', 'suspension_rr', 'spring_rf', 'spring_lf', 'spring_rr', 'spring_lr', 'transmission_f', 'transmission_m', 'transmission_r', 'hub_lf', 'hub_rf', 'hub_lm1', 'hub_rm1', 'hub_lm2', 'hub_rm2', 'hub_lm3', 'hub_rm3', 'hub_lr', 'hub_rr', 'windscreen', 'windscreen_r', 'window_lf', 'window_rf', 'window_lr', 'window_rr', 'window_lm', 'window_rm', 'bodyshell', 'bumper_f', 'bumper_r', 'wing_rf', 'wing_lf', 'bonnet', 'boot', 'exhaust', 'exhaust_2', 'exhaust_3', 'exhaust_4', 'exhaust_5', 'exhaust_6', 'exhaust_7', 'exhaust_8', 'exhaust_9', 'exhaust_10', 'exhaust_11', 'exhaust_12', 'exhaust_13', 'exhaust_14', 'exhaust_15', 'exhaust_16', 'engine', 'overheat', 'overheat_2', 'petrolcap', 'petrolcap', 'petroltank', 'petroltank_l', 'petroltank_r', 'steering', 'hbgrip_l', 'hbgrip_r', 'headlight_l', 'headlight_r', 'taillight_l', 'taillight_r', 'indicator_lf', 'indicator_rf', 'indicator_lr', 'indicator_rr', 'brakelight_l', 'brakelight_r', 'brakelight_m', 'reversinglight_l', 'reversinglight_r', 'extralight_1', 'extralight_2', 'extralight_3', 'extralight_4', 'numberplate', 'interiorlight', 'siren1', 'siren2', 'siren3', 'siren4', 'siren5', 'siren6', 'siren7', 'siren8', 'siren9', 'siren10', 'siren11', 'siren12', 'siren13', 'siren14', 'siren15', 'siren16', 'siren17', 'siren18', 'siren19', 'siren20', 'siren_glass1', 'siren_glass2', 'siren_glass3', 'siren_glass4', 'siren_glass5', 'siren_glass6', 'siren_glass7', 'siren_glass8', 'siren_glass9', 'siren_glass10', 'siren_glass11', 'siren_glass12', 'siren_glass13', 'siren_glass14', 'siren_glass15', 'siren_glass16', 'siren_glass17', 'siren_glass18', 'siren_glass19', 'siren_glass20', 'spoiler', 'struts', 'misc_a', 'misc_b', 'misc_c', 'misc_d', 'misc_e', 'misc_f', 'misc_g', 'misc_h', 'misc_i', 'misc_j', 'misc_k', 'misc_l', 'misc_m', 'misc_n', 'misc_o', 'misc_p', 'misc_q', 'misc_r', 'misc_s', 'misc_t', 'misc_u', 'misc_v', 'misc_w', 'misc_x', 'misc_y', 'misc_z', 'misc_1', 'misc_2', 'weapon_1a', 'weapon_1b', 'weapon_1c', 'weapon_1d', 'weapon_1a_rot', 'weapon_1b_rot', 'weapon_1c_rot', 'weapon_1d_rot', 'weapon_2a', 'weapon_2b', 'weapon_2c', 'weapon_2d', 'weapon_2a_rot', 'weapon_2b_rot', 'weapon_2c_rot', 'weapon_2d_rot', 'weapon_3a', 'weapon_3b', 'weapon_3c', 'weapon_3d', 'weapon_3a_rot', 'weapon_3b_rot', 'weapon_3c_rot', 'weapon_3d_rot', 'weapon_4a', 'weapon_4b', 'weapon_4c', 'weapon_4d', 'weapon_4a_rot', 'weapon_4b_rot', 'weapon_4c_rot', 'weapon_4d_rot', 'turret_1base', 'turret_1barrel', 'turret_2base', 'turret_2barrel', 'turret_3base', 'turret_3barrel', 'ammobelt', 'searchlight_base', 'searchlight_light', 'attach_female', 'roof', 'roof2', 'soft_1', 'soft_2', 'soft_3', 'soft_4', 'soft_5', 'soft_6', 'soft_7', 'soft_8', 'soft_9', 'soft_10', 'soft_11', 'soft_12', 'soft_13', 'forks', 'mast', 'carriage', 'fork_l', 'fork_r', 'forks_attach', 'frame_1', 'frame_2', 'frame_3', 'frame_pickup_1', 'frame_pickup_2', 'frame_pickup_3', 'frame_pickup_4', 'freight_cont', 'freight_bogey', 'freightgrain_slidedoor', 'door_hatch_r', 'door_hatch_l', 'tow_arm', 'tow_mount_a', 'tow_mount_b', 'tipper', 'combine_reel', 'combine_auger', 'slipstream_l', 'slipstream_r', 'arm_1', 'arm_2', 'arm_3', 'arm_4', 'scoop', 'boom', 'stick', 'bucket', 'shovel_2', 'shovel_3', 'Lookat_UpprPiston_head', 'Lookat_LowrPiston_boom', 'Boom_Driver', 'cutter_driver', 'vehicle_blocker', 'extra_1', 'extra_2', 'extra_3', 'extra_4', 'extra_5', 'extra_6', 'extra_7', 'extra_8', 'extra_9', 'extra_ten', 'extra_11', 'extra_12', 'break_extra_1', 'break_extra_2', 'break_extra_3', 'break_extra_4', 'break_extra_5', 'break_extra_6', 'break_extra_7', 'break_extra_8', 'break_extra_9', 'break_extra_10', 'mod_col_1', 'mod_col_2', 'mod_col_3', 'mod_col_4', 'mod_col_5', 'handlebars', 'forks_u', 'forks_l', 'wheel_f', 'swingarm', 'wheel_r', 'crank', 'pedal_r', 'pedal_l', 'static_prop', 'moving_prop', 'static_prop2', 'moving_prop2', 'rudder', 'rudder2', 'wheel_rf1_dummy', 'wheel_rf2_dummy', 'wheel_rf3_dummy', 'wheel_rb1_dummy', 'wheel_rb2_dummy', 'wheel_rb3_dummy', 'wheel_lf1_dummy', 'wheel_lf2_dummy', 'wheel_lf3_dummy', 'wheel_lb1_dummy', 'wheel_lb2_dummy', 'wheel_lb3_dummy', 'bogie_front', 'bogie_rear', 'rotor_main', 'rotor_rear', 'rotor_main_2', 'rotor_rear_2', 'elevators', 'tail', 'outriggers_l', 'outriggers_r', 'rope_attach_a', 'rope_attach_b', 'prop_1', 'prop_2', 'elevator_l', 'elevator_r', 'rudder_l', 'rudder_r', 'prop_3', 'prop_4', 'prop_5', 'prop_6', 'prop_7', 'prop_8', 'rudder_2', 'aileron_l', 'aileron_r', 'airbrake_l', 'airbrake_r', 'wing_l', 'wing_r', 'wing_lr', 'wing_rr', 'engine_l', 'engine_r', 'nozzles_f', 'nozzles_r', 'afterburner', 'wingtip_1', 'wingtip_2', 'gear_door_fl', 'gear_door_fr', 'gear_door_rl1', 'gear_door_rr1', 'gear_door_rl2', 'gear_door_rr2', 'gear_door_rml', 'gear_door_rmr', 'gear_f', 'gear_rl', 'gear_lm1', 'gear_rr', 'gear_rm1', 'gear_rm', 'prop_left', 'prop_right', 'legs', 'attach_male', 'draft_animal_attach_lr', 'draft_animal_attach_rr', 'draft_animal_attach_lm', 'draft_animal_attach_rm', 'draft_animal_attach_lf', 'draft_animal_attach_rf', 'wheelcover_l', 'wheelcover_r', 'barracks', 'pontoon_l', 'pontoon_r', 'no_ped_col_step_l', 'no_ped_col_strut_1_l', 'no_ped_col_strut_2_l', 'no_ped_col_step_r', 'no_ped_col_strut_1_r', 'no_ped_col_strut_2_r', 'light_cover', 'emissives', 'neon_l', 'neon_r', 'neon_f', 'neon_b', 'dashglow', 'doorlight_lf', 'doorlight_rf', 'doorlight_lr', 'doorlight_rr', 'unknown_id', 'dials', 'engineblock', 'bobble_head', 'bobble_base', 'bobble_hand', 'chassis_Control'}

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------
-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 3.0

-- Enable debug options and distance preview
Config.Debug = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = false

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the wiki and .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {

	["PoliceDuty"] = {
        name = "PoliceDuty",
        coords = vector3(441.7989, -982.0529, 30.67834),
        length = 0.45,
        width = 0.35,
        heading = 11.0,
        debugPoly = false,
        minZ = 30.77834,
        maxZ = 30.87834,
        options = {
            {
                type = "client",
                event = "Toggle:Duty",
                icon = "fas fa-clipboard",
                label = "Go On/Off duty",
                job = "police",
            },
        },
        distance = 1.5
    },

	["PoliceEvidence"] = { 
        name = "PoliceEvidence",
        coords = vector3(474.0, -995.34, 26.27),
        length = 4.6,
        width = 4.0,
        heading = 0,
        debugPoly = false,
        minZ = 24.92,
        maxZ = 27.72,
        options = {
            {
                type = "client",
                event = "evidenceLocker1",
                icon = "fas fa-dumpster",
                label = "Police Evidence 1", 
                job = "police",
            },
			{	
				type = "client",
				event = "evidenceLocker2",
				icon = "fas fa-dumpster",
				label = "Police Evidence 2",
				job = "police",
			 },
			 {	
				type = "client",
				event = "evidenceLocker3",
				icon = "fas fa-dumpster",
				label = "Police Evidence 3",
				job = "police",
			 },
			 {
				type = "client",
				event = "evidenceTrash",
				icon = "far fa-trash-alt",
				label = "Police Trash",
				job = "police",
			 },
        },
        distance = 2.5,
    },

	["PoliceArmory"] = {
        name = "PoliceArmory",
        coords = vector3(481.52, -994.76, 30.69),
        length = 0.4,
        width = 3.2,
        heading = 0,
        debugPoly = false,
        minZ = 28.49,
        maxZ = 32.49,
        options = {
            {
                type = "client",
                event = "police:armory",
                icon = "fas fa-boxes",
                label = "Open Police Armory",
                job = "police",
            },
        },
        distance = 2.5,
    },
	
	["PoliceStash"] = {
        name = "PoliceStash",
        coords = vector3(446.0, -996.8, 31.94),
        length = 0.9,
        width = 0.5,
        heading = 0,
        debugPoly = false,
        minZ = 28.49,
        maxZ = 32.49,
        options = {
            {
                type = "client",
                event = "police:personalstash",
                icon = "fad fa-boxes-alt",
                label = "Open Your Stash",
                job = "police",
            },
        },
        distance = 2.5,
    },

	["EMSArmory"] = {
        name = "EMSArmory",
        coords = vector3(306.47, -602.18, 43.88),
        length = 0.25,
        width = 1.75,
        heading = 159.41,
        debugPoly = false,
        minZ = 42.01,
        maxZ = 44.5,
        options = {
            {
                type = "client",
                event = "ems:armoury",
                icon = "fas fa-user-md",
                label = "Equipment Locker",
                job = "ambulance",
            },
        },
        distance = 2.5,
    },

	["EMSLift"] = {
        name = "EMSLift",
        coords = vector3(330.01, -602.68, 43.28),
        length = 0.2,
        width = 0.15,
        heading = 341,
        debugPoly = false,
        minZ=43.48,
  	maxZ=43.73,
        options = {
            {
                type = "client",
                event = "ambulance:menu",
                icon = "fas fa-user-md",
                label = "Take the Lift",
            },
        },
        distance = 2.5,
    },
	["EMSLift2"] = {
        name = "EMSLift2",
        coords = vector3(332.02, -597.21, 43.28),
        length = 0.2,
        width = 0.2,
        heading = 340,
        debugPoly = false,
        minZ=43.43,
  		maxZ=43.78,
        options = {
            {
                type = "client",
                event = "ambulance:menu",
                icon = "fas fa-user-md",
                label = "Take the Lift",
            },
        },
        distance = 2.5,
    },
	
	["EMSGLift"] = {
        name = "EMSGround",
        coords = vector3(339.77, -586.24, 28.8),
        length = 0.2,
        width = 0.2,
        heading = 70,
        debugPoly = false,
        minZ=29.0,
  		maxZ=29.3,
        options = {
            {
                type = "client",
                event = "ambulance:menu",
                icon = "fas fa-user-md",
                label = "Take the Lift",
            },
        },
        distance = 2.5,
    },
	["EMSGLift2"] = {
        name = "EMSGround2",
        coords = vector3(41.11, -582.52, 28.8),
        length = 0.2,
        width = 0.2,
        heading = 340,
        debugPoly = false,
        minZ=29.0,
  		maxZ=29.3,
        options = {
            {
                type = "client",
                event = "ambulance:menu",
                icon = "fas fa-user-md",
                label = "Take the Lift",
            },
        },
        distance = 2.5,
    },
	["EMSBLift1"] = {
        name = "EMSBase",
        coords = vector3(344.7, -584.71, 28.8),
        length = 0.2,
        width = 0.2,
        heading = 340,
        debugPoly = false,
        minZ=29.0,
  		maxZ=29.3,
        options = {
            {
                type = "client",
                event = "ambulance:menu",
                icon = "fas fa-user-md",
                label = "Take the Lift",
            },
        },
        distance = 2.5,
    },
	["EMSBLift2"] = {
        name = "EMSbase2",
        coords = vector3(346.02, -581.02, 28.8),
        length = 0.2,
        width = 0.2,
        heading = 340,
        debugPoly = false,
        minZ=28.95,
  		maxZ=29.3,
        options = {
            {
                type = "client",
                event = "ambulance:menu",
                icon = "fas fa-user-md",
                label = "Take the Lift",
            },
        },
        distance = 2.5,
    },
	["EMSRoof1"] = {
        name = "EMSRoof1",
        coords = vector3(338.11, -583.63, 74.16),
        length = 0.6,
        width = 2.6,
        heading = 70,
        debugPoly = false,
        minZ=73.46,
  		maxZ=75.25,
        options = {
            {
                type = "client",
                event = "ambulance:menu",
                icon = "fas fa-user-md",
                label = "Take the Lift",
            },
        },
        distance = 2.5,
    },

}

Config.PolyZones = {

}

Config.TargetBones = {

	["Vehicle"] = {
        bones = {
            "door_dside_f",
            "door_dside_r",
            "door_pside_f",
            "door_pside_r"
        },
        options = {
			{
				type = "client",
                event = "vehiclekeys:client:GiveKeys",
                icon = "fas fa-key",
                label = "GIVE KEYS",
			},
			{	
				type = "client",
                event = "police:client:PutPlayerInVehicle",
                icon = "fas fa-chevron-circle-left",
                label = "PLACE IN VEHICLE",
			 },
			 {
                type = "client",
                event = "police:client:SetPlayerOutVehicle",
                icon = "fas fa-chevron-circle-right",
                label = "TAKE OUT OF VEHICLE",
            },
            {
                type = "client",
                event = "police:client:ImpoundVehicle",
                icon = "fas fa-car",
                label = "IMPOUND VEHICLE",
                job = 'police',
            },
            {
                type = "client",
                event = "mechanic:client:ImpoundVehicle",
                icon = "fas fa-car",
                label = "IMPOUND VEHICLE",
                job = 'mechanic',
            },
            {
                type = "client",
                event = "CheckVehStatus",
                icon = "fas fa-wrench",
                label = "Examine Vehicle",
                job = 'mechanic',
            },
            {
                type = "client",
                event = "qb-vehiclefailure:client:RepairVehicleFull2",
                icon = "fas fa-wrench",
                label = "REPAIR VEHICLE",
                job = 'mechanic',
            },
            {
                type = "client",
                event = "qb-vehiclefailure:client:CleanVehicle2",
                icon = "fas fa-hand-sparkles",
                label = "CLEAN VEHICLE",
                job = 'mechanic',
            },
            {
                type = "client",
                event = "qb-trunk:client:GetIn",
                icon = "fas fa-user-secret",
                label = "GET IN TRUNK",
            },
            {
                type = "client",
                event = "LegacyFuel:client:fuel",
                icon = "fas fa-gas-pump",
                label = "Refuel Car",
                item = 'weapon_petrolcan',
            },
		},
		distance = 2.5,
	},

}

Config.TargetEntities = {

}

Config.EntityZones = {

}

Config.TargetModels = {
	["Flag"] = {
		models = {
			`prop_golfflag`,
		},
		options = {
			{
				type = "client",
				event = "np-paintball:game:pickupFlag",
				icon = "fab fa-circle",
				label = "Pickup Flag",
			},
		},
		distance = 2.5,
	},

	["ATM"] = {
		models = {
			`prop_atm_01`,
			`prop_atm_02`,
			`prop_atm_03`,
			`prop_fleeca_atm`,
		},
		options = {
			{
				type = "server",
				event = "qb-atms:server:tryATM",
				icon = "fab fa-cc-visa",
				label = "Use ATM",
			},
		},
		distance = 2.5,
	},
	["Beds"] = {
        models = {
            `v_med_bed1`
        },
        options = {
            {
                type = "client",
                event = "lie:bed",
                icon = "fas fa-bed",
                label = "LAY IN BED"
            },
        },
        distance = 4.0
    },

	["fuel"] = {
        models = {
            `prop_gas_pump_1d`,
            `prop_gas_pump_1a`,
            `prop_gas_pump_1b`,
            `prop_gas_pump_1c`,
            `prop_vintage_pump`,
            `prop_gas_pump_old2`,
            `prop_gas_pump_old3`
        },
        options = {
		    {
			type = "client",
			event = "LegacyFuel:client:fuelMenu",
			icon = "fas fa-gas-pump",
			label = "Refuel Car",
		    },
		    {
			type = "client",
			event = "LegacyFuel:client:buyJerryCanMenu",
			icon = "fas fa-burn",
			label = "Buy Jerry Can",
		    },
		    {
			type = "client",
			event = "LegacyFuel:client:refuelJerryCanMenu",
			icon = "fas fa-gas-pump",
			label = "Refuel Jerry Can",
			item = "weapon_petrolcan",
		    },
        },
        distance = 5.0
    },
	
	["Clothing"] = {
		models = {
			`s_f_y_shop_low`
		},
		options = {
			{
				type = "client",
				event = "qb-clothing:client:openclothes",
				icon = "fas fa-tshirt",
				label = "Open Clothing Store",
				
			},
		},
		distance = 3.5
	},
	
	["HairCut"] = {
		models = {
			`s_f_m_fembarber`
		},
		options = {
			{
				type = "client",
				event = "qb-clothing:client:openhair",
				icon = "fas fa-cut",
				label = "Take a hair cut!",
				
			},
		},
		distance = 3.5
	},

	
	--24/7 Shop & Hardware
	
	["Shops"] = {
		models = {
			`mp_m_shopkeep_01`
		},
		options = {
			{
				type = "client",
				event = "qb-shops:247clerk",
				icon = "fas fa-shopping-cart",
				label = "Store",
				
			},
		},
		distance = 3.5,
	},
	
	["HardwareShop"] = {
		models = {
			`mp_m_waremech_01`
		},
		options = {
			{
				type = "client",
				event = "qb-shops:247clerk",
				icon = "fas fa-shopping-cart",
				label = "Hardware Store",
				
			},
		},
		distance = 3.5,
	},
	
	["WeaponShop"] = {
		models = {
			`csb_cletus`
		},
		options = {
			{
				type = "client",
				event = "qb-shops:247clerk",
				icon = "fas fa-shopping-cart",
				label = "Weapon Shop",
				
			},
		},
		distance = 3.5,
	},

	["WeedShop"] = {
		models = {
			`cs_old_man1a`
		},
		options = {
			{
				type = "client",
				event = "qb-shops:247clerk",
				icon = "fas fa-shopping-cart",
				label = "Want some Weed?",
				
			},
		},
		distance = 2.5,
	},


	["Coralshop"] = {
		models = {
			`hc_gunman`
		},
		options = {
			{
				type = "client",
				event = "qb-shops:247clerk",
				icon = "fas fa-shopping-cart",
				label = "Sea World",
				
			},
		},
		distance = 3.5,
	},
		
	["PDGarage"] = {
		models = {
			`ig_trafficwarden`
		},
		options = {
			{
				event = "garage:menu",
				icon = "fas fa-shopping-cart",
				label = "Take out PD vehicle",
				job = "police",
				
			},
		},
		distance = 4.5,
	},
	
	
	["PDFingerPrint"] = {
		models = {
			`mp_m_fibsec_01`
		},
		options = {
			{
				type = "client",
				event = "police:server:showFingerprintId",
				icon = "fas fa-fingerprint",
				label = "Scan Finger",
				job = "police",
				
			},
		},
		distance = 3.5,
	},
	
	["Garages"] = {
		models = {
			`cs_taostranslator` 
		},
		options = {
			{
				type = "client",
				event = "GarageOUT",
				parameters = {},
				icon = "fas fa-car-side",
				label = "Garage",
			},
		},
		distance = 2.5
	},
	
	---- Hospital ------
	["HospitalCheckIN"] = {
		models = {
			`cs_magenta` 
		},
		options = {
			{
				type = "client",
				event = "HospitalCheckIn",
				parameters = {},
				icon = "fas fa-procedures",
				label = "Check In",
			},
		},
		distance = 2.5
	},
	["HospitalOnDuty"] = {
		models = {
			`cs_magenta` 
		},
		options = {
			{
				type = "client",
				event = "toggleEMSduty",
				parameters = {},
				icon = "fas fa-procedures",
				label = "Go on/off Duty",
				job = "ambulance"
			},
		},
		distance = 3.5
	},
	
	["EMSGarage"] = {
		models = {
			`csb_prolsec` 
		},
		options = {
			{
				type = "client",
				event = "garage:ambulance",
				parameters = {},
				icon = "fas fa-shopping-cart",
				label = "Ambulance Garage",
				job = "ambulance"
			},
		},
		distance = 3.5
	},

	["EMSStash"] = {
		models = {
			`s_f_y_scrubs_01` 
		},
		options = {
			{
				type = "client",
				event = "ems:personalstash",
				parameters = {},
				icon = "fas fa-shopping-cart",
				label = "EMS Personal Stash",
				job = "ambulance"
			},
		},
		distance = 3.5
	},
	
	["burgershotgarage"] = {
		models = {
			`ig_floyd`
		},
		options = {
			{
				type = "client",
				event = "garage:BurgerShotGarage",
				icon = "fas fa-car",
				label = "BurgerShot Garage",
				job = "burgershot",
			}
		},
		distance = 2.5,
	},
--- Hunting

	["hunting"] = {
		models = {
			`ig_hunter`
		},
		options = {
			{
                event = "qb-shops:247clerk",
                icon = "fas fa-shopping-cart",
                label = "Open Shop",
            },
            {
                event = "Dox-hunting:payammo",
                icon = "fas fa-circle",
                label = "Purchase Bullets $500",
            },
		},
		distance = 2.5,
	},

	["cityhall"] = {
        models = {
            `a_f_y_business_01`
        },
        options = {
            {
                type = "client",
                event = "cityhall",
                icon = "fas fa-address-book",
                label = "City Hall",
            },
        },
        distance = 2.5
    },

	["impound"] = {
        models = {
            `cs_joeminuteman`
        },
        options = {
            {
                type = "client",
                event = "Impound",
                icon = "fas fa-address-book",
                label = "Impound",
            },
        },
        distance = 2.5
    },

	
	

}

Config.GlobalPedOptions = {



}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {

	options = {
        {
            type = "client",
            event = "police:client:CuffPlayer",
            icon = "fas fa-circle",
            label = "Hard Cuff / Uncuff",
            item = 'handcuffs',
            job = "police", "ambulance"
        },
        {
            type = "client",
            event = "police:client:RobPlayer",
            icon = "fas fa-circle",
            label = "Rob Person"
        },
        {
            type = "client",
            event = "police:client:EscortPlayer",
            icon = "fas fa-circle",
            label = "Escort",
            job = "police", "ambulance"
        },
		{
            type = "client",
            event = "police:client:SearchPlayer",
            icon = "fas fa-circle",
            label = "Search Person",
			job = "police",
        },
		{
            type = "client",
            event = "qb-phone:client:GiveContactDetails",
            icon = "fas fa-circle",
            label = "Give Contact Details"
        },
		{
			id = 'stealplayer',
			title = 'Rob',
			icon = 'mask',
			type = 'client',
			event = 'police:client:RobPlayer',
			shouldClose = true
		},

    },
    distance = 2.5,

}

Config.Peds = {

	

}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------

if Config.EnableDefaultOptions then
	Config.ToggleDoor = function(vehicle, door)
		if GetVehicleDoorLockStatus(vehicle) ~= 2 then
			if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
				SetVehicleDoorShut(vehicle, door, false)
			else
				SetVehicleDoorOpen(vehicle, door, false)
			end
		end
	end
end

-------------------------------------------------------------------------------
-- Default options
-------------------------------------------------------------------------------

if Config.EnableDefaultOptions then
	Bones['seat_dside_f'] = {
		options = {
			{
				icon = "fas fa-door-open",
				label = "Toggle front Door",
				canInteract = function(entity)
					return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
				end,
				action = function(entity)
					Config.ToggleDoor(entity, 0)
				end
			},
		},
		distance = 1.2
	}

	Bones['seat_pside_f'] = {
		options = {
			{
				icon = "fas fa-door-open",
				label = "Toggle front Door",
				canInteract = function(entity)
					return GetEntityBoneIndexByName(entity, 'door_pside_f') ~= -1
				end,
				action = function(entity)
					Config.ToggleDoor(entity, 1)
				end
			},
		},
		distance = 1.2
	}

	Bones['seat_dside_r'] = {
		options = {
			{
				icon = "fas fa-door-open",
				label = "Toggle rear Door",
				canInteract = function(entity)
					return GetEntityBoneIndexByName(entity, 'door_dside_r') ~= -1
				end,
				action = function(entity)
					Config.ToggleDoor(entity, 2)
				end
			},
		},
		distance = 1.2
	}

	Bones['seat_pside_r'] = {
		options = {
			{
				icon = "fas fa-door-open",
				label = "Toggle rear Door",
				canInteract = function(entity)
					return GetEntityBoneIndexByName(entity, 'door_pside_r') ~= -1
				end,
				action = function(entity)
					Config.ToggleDoor(entity, 3)
				end
			},
		},
		distance = 1.2
	}

	Bones['bonnet'] = {
		options = {
			{
				icon = "fa-duotone fa-engine",
				label = "Toggle Hood",
				action = function(entity)
					Config.ToggleDoor(entity, 4)
				end
			},
		},
		distance = 0.9
	}
end

-------------------------------------------------------------------------------
return Config, Players, Types, Entities, Models, Zones, Bones, PlayerData
-------------------------------------------------------------------------------
