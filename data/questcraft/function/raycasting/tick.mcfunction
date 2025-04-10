# Find any relevant block displays or entities, then split for performance
execute as @e[type=block_display,tag=raycast_block_display] run function questcraft:raycasting/tick_marking_block
execute as @e[tag=raycast_targetted_entity] run function questcraft:raycasting/tick_marking_entity