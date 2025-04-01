# Retrieve the name then remove it from the list of available names
$data modify storage questcraft:args structure_name set from storage questcraft:poi_data poiTypes.$(structure_type).names.$(structure_type_subtype)[$(structure_name_id)]
$data remove storage questcraft:poi_data poiTypes.$(structure_type).names.$(structure_type_subtype)[$(structure_name_id)]

# Summon a marker for the center of the POI, with its CustomName set to the structure name
function questcraft:poi_mark_center_finish_sub2 with storage questcraft:args
