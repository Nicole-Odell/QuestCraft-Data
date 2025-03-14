# Get the number of aspects in the buffer, and add the new one if it's not already full
$execute store result score _local_SpellBuild var run data get storage questcraft:mage_data mages[$(id)].spell
$execute if score _local_SpellBuild var < @s spellBufferSize run data modify storage questcraft:mage_data mages[$(id)].spell append value $(aspect)
scoreboard players reset _local_SpellBuild var