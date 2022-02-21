QB = {}
QBCustom = {}

QB.VehicleShops = {
    [1] = {
        -- Vehicle Shop options
        ["ShopName"] = "pdm", -- Name to get in the shared.lua
        ["ShopLabel"] = "Premium Deluxe Motorsport", -- Blip name
        ["Categories"] = {
            ["sports"]  = "Sports",
            ["sportsclassics"] = "Sports Classics",
            ["super"]   = "Super",
            ["drift"]   = "Drift",
            ["sedans"]  = "Sedans",
            ["coupes"]  = "Coupes",
            ["suvs"]    = "SUVs",
            ["offroad"] = "Offroad",
            ["muscle"] = "Muscle",
            ["compacts"] = "Compacts",
            ["motorcycles"] = "Motorcycles",
            ["vans"] = "Vans",
        },
        ["TestDriveTimeLimit"] = 3, -- Time in minutes until the vehicle gets deleted
        ["Location"] = vector3(-56.71, -1096.6, 25.44), -- Blip Location
        ["ReturnLocation"] = vector3(-768.15, -233.1, 37.07), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ["VehicleSpawn"] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location when vehicle is bought
        ["OwnedJob"] = "cardealer" , -- false or a job inside a string like "cardealer"
        ["ShowroomVehicles"] = {
            [1] = {
                coords = vector4(-45.65, -1093.66, 25.44, 69.5),
                defaultVehicle = 'bjxl', -- The vehicle that needs to be there on restart
                chosenVehicle = 'bjxl', -- Keep this the same as defaultvehicle
                inUse = false, -- When changing vehicle this gets set to true, don't change
                buying = false, -- When buying a vehicle from an owned job this gets set to true, don't change
            },
            [2] = {
                coords = vector4(-48.27, -1101.86, 25.44, 294.5),
                defaultVehicle = 'blista',
                chosenVehicle = 'blista',
                inUse = false,
                buying = false,
            },
            [3] = {
                coords = vector4(-39.6, -1096.01, 25.44, 66.5),
                defaultVehicle = 'faggio',
                chosenVehicle = 'faggio',
                inUse = false,
                buying = false,
            },
            [4] = {
                coords = vector4(-51.21, -1096.77, 25.44, 254.5),
                defaultVehicle = 'blista2',
                chosenVehicle = 'blista2',
                inUse = false,
                buying = false,
            },
            [5] = {
                coords = vector4(-40.18, -1104.13, 25.44, 338.5),
                defaultVehicle = 'carbonizzare',
                chosenVehicle = 'carbonizzare',
                inUse = false,
                buying = false,
            },
            [6] = {
                coords = vector4(-43.31, -1099.02, 25.44, 52.5),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati',
                inUse = false,
                buying = false,
            },
            [7] = {
                coords = vector4(-50.66, -1093.05, 25.44, 222.5),
                defaultVehicle = 'cavalcade2',
                chosenVehicle = 'cavalcade2',
                inUse = false,
                buying = false,
            },
            [8] = {
                coords = vector4(-44.28, -1102.47, 25.44, 298.5),
                defaultVehicle = 'intruder',
                chosenVehicle = 'intruder',
                inUse = false,
                buying = false,
            },
        },
        -- Non-changeable options (Don't touch these)
        ["opened"] = false,
        ["currentmenu"] = "main",
        ["lastmenu"] = nil,
        ["currentpos"] = nil,
        ["selectedbutton"] = 0,
        ["marker"] = { r = 0, g = 155, b = 255, a = 250, type = 1 },
        ["menu"] = {
            ["x"] = 0.14,
            ["y"] = 0.15,
            ["width"] = 0.12,
            ["height"] = 0.03,
            ["buttons"] = 10,
            ["from"] = 1,
            ["to"] = 10,
            ["scale"] = 0.29,
            ["font"] = 0,
            ["main"] = {
                ["title"] = "CATEGORIES",
                ["Name"] = "main",
                ["buttons"] = {
                    {name = "Categories", description = ""},
                }
            },
            ["vehicles"] = {
                ["title"] = "VEHICLES",
                ["name"] = "vehicles",
                ["buttons"] = {}
            },
        },

    },
    [2] = {
        -- Vehicle Shop options
        ["ShopName"] = "luxury", -- Name to get in the shared.lua
        ["ShopLabel"] = "BB Tuners", -- Blip name
        ["Categories"] = {
            ["super"]  = "Super",
            ["sports"]  = "Sports",
            ["tuner"]  = "Tuner",
        },
        ["TestDriveTimeLimit"] = 1, -- Time in minutes until the vehicle gets deleted
        ["Location"] = vector3(139.33, -3029.75, 7.04), -- Blip Location
        ["ReturnLocation"] = vector3(163.86, -3046.3, 5.93), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ["VehicleSpawn"] = vector4(163.86, -3046.3, 5.93, 265.64), -- Spawn location when vehicle is bought
        ["OwnedJob"] = "cardealer", -- false or a job inside a string like "cardealer"
        ["ShowroomVehicles"] = {
            [1] = {
                coords = vector4(126.49, -3047.11, 5.04, 272.02),
                defaultVehicle = 'rr14', -- The vehicle that needs to be there on restart
                chosenVehicle = 'rr14', -- Keep this the same as defaultvehicle
                inUse = false, -- When changing vehicle this gets set to true, don't change
                buying = false, -- When buying a vehicle from an owned job this gets set to true, don't change
            }, 
            [2] = {
                coords = vector4(145.15, -3047.6, 5.04, 22.01),
                defaultVehicle = 'r8h',
                chosenVehicle = 'r8h',
                inUse = false,
                buying = false,
            }, 
            [3] = {
                coords = vector4(135.88, -3047.54, 5.04, 357.77),
                defaultVehicle = 'r32',
                chosenVehicle = 'r32',
                inUse = false,
                buying = false,
            }, 
            [4] = {
                coords = vector4(125.79, -3022.98, 5.04, 269.47),
                defaultVehicle = 'm4',
                chosenVehicle = 'm4',
                inUse = false,
                buying = false,
            },
        },
        -- Non-changeable options (Don't touch these)
        ["opened"] = false,
        ["currentmenu"] = "main",
        ["lastmenu"] = nil,
        ["currentpos"] = nil,
        ["selectedbutton"] = 0,
        ["marker"] = { r = 0, g = 155, b = 255, a = 250, type = 1 },
        ["menu"] = {
            ["x"] = 0.14,
            ["y"] = 0.15,
            ["width"] = 0.12,
            ["height"] = 0.03,
            ["buttons"] = 10,
            ["from"] = 1,
            ["to"] = 10,
            ["scale"] = 0.29,
            ["font"] = 0,
            ["main"] = {
                ["title"] = "CATEGORIES",
                ["Name"] = "main",
                ["buttons"] = {
                    {name = "Categories", description = ""},
                }
            },
            ["vehicles"] = {
                ["title"] = "VEHICLES",
                ["name"] = "vehicles",
                ["buttons"] = {}
            },
        },
    }, -- Add your next table under this comma
}

QB.GarageLabel = {
    ['maingarage'] = 'Motel Garage',
    ['themotorhotel']  = 'San Andreas Parking Counsel',
}

QB.Classes = {
    [0] = 'compacts',  
    [1] = 'sedans',  
    [2] = 'suvs',  
    [3] = 'coupes',  
    [4] = 'muscle',  
    [5] = 'sportsclassics ', 
    [6] = 'sports',  
    [7] = 'super', 
    [8] = 'motorcycles',  
    [9] = 'offroad', 
    [10] = 'industrial',  
    [11] = 'utility',  
    [12] = 'vans',  
    [13] = 'cycles',  
    [14] = 'boats',  
    [15] = 'helicopters',  
    [16] = 'planes',  
    [17] = 'service',  
    [18] = 'emergency',  
    [19] = 'military',  
    [20] = 'commercial',  
    [21] = 'trains',  
    [22] = 'drift',
    [22] = 'tuner',
}
