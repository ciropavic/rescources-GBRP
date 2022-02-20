--[[ local CircleZone = CircleZone:Create(vector3(569.32, 2796.66, 42.02), 2.0, {
    name="huntingsales",
    useZ = true,
    debugPoly=true,
}) ]]

local pinkcage = PolyZone:Create({
    vector2(328.41662597656, -189.42219543457),
    vector2(347.90512084961, -196.81504821777),
    vector2(336.11190795898, -227.95924377441),
    vector2(306.11798095703, -216.42715454102),
    vector2(314.41293334961, -194.19380187988),
    vector2(324.84567260742, -198.19834899902)
}, {
    name="pink_cage",
    minZ=51.0,
    maxZ=62.0,
    debugGrid=false,
    gridDivisions=25
})