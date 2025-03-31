# We will start searching by summoning markers this distance away, then tping them inwards by the search resolution
scoreboard players set _poi_search_distance var 160
scoreboard players set _poi_search_resolution var 10
execute store result storage questcraft:args poi_search_distance int 1 run scoreboard players get _poi_search_distance var
execute store result storage questcraft:args poi_search_resolution int 1 run scoreboard players get _poi_search_resolution var

# Get the expected name of the predicate from the structure type
$data modify storage questcraft:args structure_predicate set value "questcraft:is_in_poi_$(structure_type)"

# These function as our out parameters, so we don't clear them.
# It's up the caller to do so when they are done with them.
data modify storage questcraft:args poiCenterX set value 0
data modify storage questcraft:args poiCenterY set value 0
data modify storage questcraft:args poiCenterZ set value 0
function questcraft:poi_triangulate_center_sub with storage questcraft:args

scoreboard players reset _poi_search_distance var
scoreboard players reset _poi_search_resolution var

data remove storage questcraft:args structure_predicate
data remove storage questcraft:args poi_search_distance
data remove storage questcraft:args poi_search_resolution