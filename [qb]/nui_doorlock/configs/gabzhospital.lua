

-- surgerrooma
table.insert(Config.DoorList, {
	lockpick = false,
	locked = true,
	audioRemote = false,
	maxDistance = 2.5,
	slides = false,
	doors = {
		{objHash = -1700911976, objHeading = 340.00003051758, objCoords = vector3(314.4241, -572.2216, 43.43391)},
		{objHash = -434783486, objHeading = 340.00003051758, objCoords = vector3(312.0051, -571.3412, 43.43391)}
 },
	authorizedJobs = { ['ambulance']=0 },        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})