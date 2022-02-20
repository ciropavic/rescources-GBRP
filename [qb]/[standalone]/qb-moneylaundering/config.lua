Config = {}

Config.entry = {
    vector3(-643.34, -1227.92, 11.55)
}

-- Set to true if you want players to enter using an item, otherwise players need to gues the code
Config.useItem = true
Config.item = 'lockpick' -- The name of the item in the shared.lua
Config.code = 'moneywash' -- Can only be 40 characters long

Config.washingmachines = {
    [1] = {
        coords = vector3(1126.88, -3194.28, -40.4),
        inUse = false,
        worth = nil
    },
    [2] = {
        coords = vector3(1125.53, -3194.24, -40.4),
        inUse = false,
        worth = nil
    },
    [3] = {
        coords = vector3(1123.75, -3194.27, -40.4),
        inUse = false,
        worth = nil
    },
    [4] = {
        coords = vector3(1122.35, -3194.44, -40.4),
        inUse = false,
        worth = nil
    }
}

Config.timer = 5 -- seconds
Config.percentage = { -- % that gets lost when laundering
    min = 5,
    max = 20
}