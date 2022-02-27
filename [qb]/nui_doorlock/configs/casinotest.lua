

-- elevatordoor1
table.insert(Config.DoorList, {
	locked = true,
	doors = {
		{objHash = 1500925016, objHeading = 180.0, objCoords = vector3(1012.006, 30.3173, 62.35284)},
		{objHash = -1485906437, objHeading = 0.095167860388756, objCoords = vector3(1015.758, 31.13544, 63.40408)}
 },
	maxDistance = 2.5,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['dev']=0 },
	audioRemote = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})