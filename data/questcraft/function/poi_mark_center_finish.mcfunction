# Summon a marker for the center of the POI
$summon armor_stand $(poiCenterX) $(poiCenterY) $(poiCenterZ) {NoGravity:1b,Glowing:1b,Tags:["poi_marker","poi_marker_$(structure_type)"]}
function questcraft:debug_print_coords_force with storage questcraft:args