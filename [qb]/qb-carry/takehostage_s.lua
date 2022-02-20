
RegisterServerEvent('takehostage:sync')
AddEventHandler('takehostage:sync', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget,attachFlag)
	TriggerClientEvent('takehostage:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget,attachFlag)
	TriggerClientEvent('takehostage:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)

RegisterServerEvent('takehostage:stop')
AddEventHandler('takehostage:stop', function(targetSrc)
	TriggerClientEvent('takehostage:cl_stop', targetSrc)
end)
