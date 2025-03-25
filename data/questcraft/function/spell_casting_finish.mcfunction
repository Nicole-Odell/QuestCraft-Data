# Mark the player as not casting a raycast targetted spell
scoreboard players set @s isCastingPrimed 0

# Get the castSource as a score
execute store result score _cast_source var run data get storage questcraft:args castSource

# Set the color and cast text based on the aspect it was casted with
execute if score _cast_source var matches 0 run data modify storage questcraft:args castAspectName set value "Vigor"
execute if score _cast_source var matches 0 run data modify storage questcraft:args castColor set value "green"

execute if score _cast_source var matches 1 run data modify storage questcraft:args castAspectName set value "Blood"
execute if score _cast_source var matches 1 run data modify storage questcraft:args castColor set value "red"

execute if score _cast_source var matches 2 run data modify storage questcraft:args castAspectName set value "Soul"
execute if score _cast_source var matches 2 run data modify storage questcraft:args castColor set value "aqua"

execute if score _cast_source var matches 3 run data modify storage questcraft:args castAspectName set value "Void"
execute if score _cast_source var matches 3 run data modify storage questcraft:args castColor set value "dark_purple"

# Show the cast message
function questcraft:spell_casting_finish_display with storage questcraft:args

data remove storage questcraft:args castAspectName
data remove storage questcraft:args castColor

scoreboard players reset _cast_source

# Clear the spell buffer now that we have casted the spell
$data modify storage questcraft:mage_data mages[$(mageId)].spell set value []