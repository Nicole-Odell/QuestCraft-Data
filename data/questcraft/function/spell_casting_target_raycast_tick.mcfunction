# Store the mageId in args for macro use
execute store result storage questcraft:args mageId int 1 run scoreboard players get @s mageId

# Show the casting message
function questcraft:spell_casting_target_raycast_display with storage questcraft:args

# Continue to do the raycast for this tick
function questcraft:spell_casting_target_raycast_tick_sub with storage questcraft:args
