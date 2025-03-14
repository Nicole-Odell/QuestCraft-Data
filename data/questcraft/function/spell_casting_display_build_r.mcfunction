# Get the length of the spell buffer
$execute store result score _local_spellcastdisplay var run data get storage questcraft:mage_data mages[$(id)].spell

# Return fail if the buffer is empty
execute if score _local_spellcastdisplay var matches 0 run return fail

# Return (end the recursion) if we have reached the end of the buffer
$execute if score _local_spellcastdisplay var matches $(index) run return 0

# Get the next aspect from the buffer and add its color to the colors
$execute store result score _local_spellcastdisplay var run data get storage questcraft:mage_data mages[$(id)].spell[$(index)]
$execute if score _local_spellcastdisplay var matches 0 run data modify storage questcraft:args colors merge value {$(index):"green"}
$execute if score _local_spellcastdisplay var matches 1 run data modify storage questcraft:args colors merge value {$(index):"red"}
$execute if score _local_spellcastdisplay var matches 2 run data modify storage questcraft:args colors merge value {$(index):"aqua"}
$execute if score _local_spellcastdisplay var matches 3 run data modify storage questcraft:args colors merge value {$(index):"dark_purple"}

# Increment the index for the recursion
execute store result score _local_spellcastdisplay var run data get storage questcraft:args index
scoreboard players add _local_spellcastdisplay var 1
execute store result storage questcraft:args index int 1 run scoreboard players get _local_spellcastdisplay var
scoreboard players reset _local_spellcastdisplay var

# Recurse to add the next element from the buffer
function questcraft:spell_casting_display_build_r with storage questcraft:args

return 0