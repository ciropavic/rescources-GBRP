Config = {}

Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {
	-- Barber Shops
	{
		model = `s_f_m_fembarber`, -- Model name as a hash.
		coords = vector4(-34.42, -151.15, 57.09, 180.0), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'female' -- The gender of the ped, used for the CreatePed native.
	},

	{
		model = `s_f_m_fembarber`,
		coords = vector4(-279.89, 6227.61, 31.71, 50.0), -- Paleto Bay
		gender = 'female'
	},

	{
		model = `s_f_m_fembarber`,
		coords = vector4(1933.71, 3730.42, 32.85, 210.0), -- Sandy Shores
		gender = 'female'
	},

	{
		model = `s_f_m_fembarber`,
		coords = vector4(-817.19, -183.30, 37.57, 130.0), -- Mad Wayne Thunder Drive
		gender = 'female'
	},

	{
		model = `s_f_m_fembarber`,
		coords = vector4(-1283.62, -1119.24, 7.00, 110.0), -- Magellan Ave
		gender = 'female'
	},

	{
		model = `s_f_m_fembarber`,
		coords = vector4(137.61, -1709.78, 29.30, 320.0), -- Carson Ave
		gender = 'female'
	},

	---Weapon Shop
	{
        model = `csb_cletus`,
        coords = vector4(810.2194, -2158.98, 29.618, 359.3),
        gender = 'male'
    },
    {
        model = `csb_cletus`,
        coords = vector4(-662.380, -933.614, 21.829, 185.4),
        gender = 'male'
    },
    {
        model = `csb_cletus`,
        coords = vector4(22.51769, -1105.51, 29.796, 162.6),
        gender = 'male'
    },
    {
        model = `csb_cletus`,
        coords = vector4(842.4871, -1035.26, 28.194, 1.786),
        gender = 'male'
    },
    {
        model = `csb_cletus`,
        coords = vector4(2568.018, 292.6341, 108.73, 0.458),
        gender = 'male'
    },
    {
        model = `csb_cletus`,
        coords = vector4(1692.197, 3760.827, 34.705, 228.1),
        gender = 'male'
    },
    {
        model = `csb_cletus`,
        coords = vector4(-1119.01, 2699.684, 18.554, 226.3),
        gender = 'male'
    },
    {
        model = `csb_cletus`,
        coords = vector4(-331.578, 6084.966, 31.454, 224.9),
        gender = 'male'
    },

	-- Clothing Stores
	{
		model = `s_f_y_shop_low`,
		coords = vector4(5.77, 6511.34, 31.88, 42.87), -- Paleto Bay
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(1695.00, 4817.49, 42.06, 360.0), -- Grapeseed
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(126.91, -224.29, 54.56, 90.0), -- Hawick Ave
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(-709.06, -151.46, 37.42, 120.0), -- Portola Drive
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(-1448.41, -237.54, 49.81, 60.0), -- Cougar Ave
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(-165.24, -303.62, 39.73, 260.0), -- Las Lagunas Blvd
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(-1194.10, -767.09, 17.32, 220.0), -- North Rockford Drive
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(427.03, -806.03, 29.49, 87.01), -- Sinner Streetv
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(-823.35, -1072.48, 11.33, 206.07), -- South Rockford Drive
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(73.96, -1392.74, 29.38, 267.43), -- Innocence Blvd
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(613.04, 2762.49, 42.09, 280.0), -- Grapeseed
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(1201.97, 2710.80, 38.22, 100.0), -- Harmony
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(-1097.96, 2714.62, 19.11, 140.0), -- Route 68
		gender = 'female'
	},

	{
		model = `s_f_y_shop_low`,
		coords = vector4(-3169.38, 1043.18, 20.86, 50.0), -- Great Ocean Highway
		gender = 'female'
	},

	--Tool Shop 
	{
		model = `mp_m_waremech_01`,
		coords = vector4(46.72, -1749.74, 29.63, 50.54), --Groove street
		gender = 'male'
	},

	{
		model = `mp_m_waremech_01`,
		coords = vector4(-422.08, 6136.9, 31.88, 221.87), --Pelito
		gender = 'male'
	},

	{
		model = `mp_m_waremech_01`,
		coords = vector4(2747.34, 3473.11, 55.67, 250.8), --High Way
		gender = 'male'
	},

	--CORAL
	
	{
		model = `hc_gunman`,
		coords = vector4(-1686.63, -1072.47, 13.15, 48.87), 
		gender = 'male'
	},

	--24/7 Shop 
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1727.66, 6414.93, 35.04, 237.85), --SHOP 1
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`, 
		coords = vector4(24.42, -1347.55, 29.5, 267.56), --SHOP 2
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(2678.42, 3279.2, 55.24, 327.01), --SHOP 3 
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-3241.69, 999.96, 12.83, 350.45), --SHOP 4
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1960.28, 3739.7, 32.34, 293.35), --SHOP 6
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1697.35, 4923.46, 42.06, 325.13), --SHOP 5  
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(2557.69, 380.71, 108.62, 358.89), --SHOP 7
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(548.99, 2671.78, 42.16, 94.61), --SHOP 8
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(372.39, 325.95, 103.57, 252.08), --SHOP 9
		gender = 'male' 
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-3038.53, 584.63, 7.91, 9.02), --SHOP 10
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`, 
		coords = vector4(160.01, 6641.36, 31.7, 230.8), ---SHOP 11
		gender = 'male',
	},
	
	{
		model = `cs_old_man1a`, 
		coords = vector4(-1170.64, -1570.76, 4.66, 120.21), ---SHOP 11
		gender = 'male',
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-47.35, -1758.73, 29.42, 47.69), --Gas store 1
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-706.14, -914.53, 19.22, 88.38), --Gas store 2 
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1164.84, -323.67, 69.21, 95.46), --Gas store 3
		gender = 'male'
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1819.49, 793.46, 138.09, 129.62), --Gas store 4
		gender = 'male'
	},


	--Police Dep
	{
		model = `mp_m_fibsec_01`,
		coords = vector4(475.54, -1014.1, 26.27, 2.4), -- Finger Print
		gender = 'male'
	},
	--- Garages 
	{
		model = `cs_taostranslator`,
		coords = vector4(-293.4, -986.72, 31.15, 71.27), ---Garage Altas
		scenario = "WORLD_HUMAN_AA_SMOKE"
	},

	{
		model = `cs_taostranslator`,
		coords = vector4(214.9191, -809.707, 30.851, 250.1), ---Garage Legion
		scenario = "WORLD_HUMAN_AA_SMOKE"
	},

	{
		model = `cs_taostranslator`,
		coords = vector4(-796.749, -2024.82, 8.9853, 144.8), ---Garage Airport
		scenario = "WORLD_HUMAN_AA_SMOKE"
	},

	{
		model = `cs_taostranslator`,
		coords = vector4(157.1589, -3240.06, 7.15, 273.2), ---Garage DUMBO
		scenario = "WORLD_HUMAN_AA_SMOKE"
	},

	{
		model = `cs_taostranslator`,
		coords = vector4(-1184.99, -1508.50, 4.4797, 34.85), ---Garage Beach
		scenario = "WORLD_HUMAN_AA_SMOKE"
	},

	{
		model = `cs_taostranslator`,
		coords = vector4(-339.357, 267.2638, 85.683, 289.1), ---Garage Beach
		scenario = "WORLD_HUMAN_AA_SMOKE"
	},

	{
		model = `cs_taostranslator`,
		coords = vector4(1140.538, 2664.083, 38.160, 88.80), ---Garage Hotel parking sandy
		scenario = "WORLD_HUMAN_AA_SMOKE"
	},
	{
		model = `cs_taostranslator`,
		coords = vector4(83.91631, 6420.867, 31.860, 312.6), ---Garage Pelito
		scenario = "WORLD_HUMAN_AA_SMOKE"
	},



	---- Hospital----
	{
		model = `cs_magenta`,
		coords = vector4(311.55, -594.1, 43.28, 336.39), ---Hospital Checkin
		gender = 'female',
	},

	{
		model = `s_f_y_scrubs_01`,
		coords = vector4(298.7, -599.67, 43.28, 340.23), ---Hospital Checkin
		gender = 'female',
	},

	{
		model = `csb_prolsec`, 
		coords = vector4(317.37, -582.22, 28.8, 341.26), ---Hospital Garage   vector3(317.37, -582.22, 28.8)
		gender = 'male',
	},

	{
		model = `ig_hunter`, 
		coords = vector4(-679.75, 5839.04, 17.33, 227.57), ---Hunting 
		gender = 'male',
	},

	{
		model = `a_f_y_business_01`, 
		coords = vector4(-552.96, -192.1, 38.22, 209.58), ---City Hall 1
		gender = 'male',
	},

	{
		model = `cs_joeminuteman`, 
		coords = vector4(-193.34, -1162.38, 23.67, 271.48), ---Impound
		gender = 'male',
		scenario = "WORLD_HUMAN_AA_SMOKE"
	},


	
}
