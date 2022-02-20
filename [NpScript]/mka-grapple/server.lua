RegisterServerEvent("mka-grapple:createRope")
AddEventHandler("mka-grapple:createRope", function(grappleId, dest)
    local src = source
    TriggerClientEvent("mka-grapple:ropeCreated", -1, src, grappleId, dest)
end)

RegisterServerEvent("mka-grapple:destroyRope")
AddEventHandler("mka-grapple:destroyRope", function(grappleId)
    local src = source
    TriggerClientEvent("mka-grapple:ropeDestroyed:" .. grappleId, src)
end)