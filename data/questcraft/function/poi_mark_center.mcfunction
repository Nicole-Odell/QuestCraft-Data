$data modify storage questcraft:args structure_type set value $(structure_type)

# Initial triangulation to populate poiCenter x y and z
execute at @s run function questcraft:poi_triangulate_center with storage questcraft:args

# Triangulate 4 more times to find the approximate center of the structure,
# using the new poiCenter x y and z as the new starting point each time 
function questcraft:poi_mark_center_step with storage questcraft:args
function questcraft:poi_mark_center_step with storage questcraft:args
function questcraft:poi_mark_center_step with storage questcraft:args
function questcraft:poi_mark_center_step with storage questcraft:args

execute store result score _poiCenterX var run data get storage questcraft:args poiCenterX
execute store result score _poiCenterZ var run data get storage questcraft:args poiCenterZ

# Mark the center, unless we failed to find it
execute unless score _poiCenterX var matches 0 unless score _poiCenterZ var matches 0 run function questcraft:poi_mark_center_finish with storage questcraft:args

scoreboard players reset _poiCenterX var
scoreboard players reset _poiCenterZ var

# Clear our out parameters from poi_triangulate_center
data remove storage questcraft:args poiCenterX
data remove storage questcraft:args poiCenterY
data remove storage questcraft:args poiCenterZ