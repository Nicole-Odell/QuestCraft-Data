# Get the number of aspects in the buffer, and add the new one if it's not already full
$execute store result score _spell_build_buffer_content_length var run data get storage questcraft:mage_data mages[$(mageId)].spell
$execute if score _spell_build_buffer_content_length var < @s spellBufferSize run data modify storage questcraft:mage_data mages[$(mageId)].spell append value $(aspect)
scoreboard players reset _spell_build_buffer_content_length var