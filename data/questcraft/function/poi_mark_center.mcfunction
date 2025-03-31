$data modify storage questcraft:args structure_type set value $(structure_type)

# Initial triangulation to populate poiCenter x y and z
execute at @s run function questcraft:poi_triangulate_center with storage questcraft:args

# Triangulate 4 more times to find the approximate center of the structure,
# using the new poiCenter x y and z as the new starting point each time 
function questcraft:poi_mark_center_step with storage questcraft:args
function questcraft:poi_mark_center_step with storage questcraft:args
function questcraft:poi_mark_center_step with storage questcraft:args
function questcraft:poi_mark_center_step with storage questcraft:args

# Mark the center
function questcraft:poi_mark_center_finish with storage questcraft:args


data remove storage questcraft:args structure_type
# Clear our out parameters from poi_triangulate_center
data remove storage questcraft:args poiCenterX
data remove storage questcraft:args poiCenterY
data remove storage questcraft:args poiCenterZ