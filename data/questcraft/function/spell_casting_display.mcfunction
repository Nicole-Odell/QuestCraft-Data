# Gather the args to pass
execute store result storage questcraft:args id int 1 run scoreboard players get @s mageId
data modify storage questcraft:args index set value 0

# We will gather the information needed display the spell buffer.
# The character that represents aspects is set here.
data modify storage questcraft:args colors set value {char:"░"}

# Recurse to iterate across the spell buffer and build the list of colors
execute store success score _spell_display_build_succeeded var run function questcraft:spell_casting_display_build_r with storage questcraft:args

# Get the number of aspects that were in the buffer (the final index value, which is the last valid index +1)
execute store result score _spell_display_buffer_content_length var run data get storage questcraft:args index

# If we succeeded, display the title.
# Because MC hates us and we can't do string concatenation or interpret NBT data as an equivalent raw JSON string, we have to hard-code this.
execute if score _spell_display_build_succeeded var matches 1 if score _spell_display_buffer_content_length var matches 1 run function questcraft:spell_casting_display_apply_1 with storage questcraft:args colors
execute if score _spell_display_build_succeeded var matches 1 if score _spell_display_buffer_content_length var matches 2 run function questcraft:spell_casting_display_apply_2 with storage questcraft:args colors
execute if score _spell_display_build_succeeded var matches 1 if score _spell_display_buffer_content_length var matches 3 run function questcraft:spell_casting_display_apply_3 with storage questcraft:args colors
execute if score _spell_display_build_succeeded var matches 1 if score _spell_display_buffer_content_length var matches 4 run function questcraft:spell_casting_display_apply_4 with storage questcraft:args colors
execute if score _spell_display_build_succeeded var matches 1 if score _spell_display_buffer_content_length var matches 5 run function questcraft:spell_casting_display_apply_5 with storage questcraft:args colors
execute if score _spell_display_build_succeeded var matches 1 if score _spell_display_buffer_content_length var matches 6 run function questcraft:spell_casting_display_apply_6 with storage questcraft:args colors

data remove storage questcraft:args id
data remove storage questcraft:args index
data remove storage questcraft:args colors

scoreboard players reset _spell_display_build_succeeded var
scoreboard players reset _spell_display_buffer_content_length var