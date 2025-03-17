execute as @a[tag=spell_levitating] run execute if entity @s[predicate=questcraft:has_ending_levitation] run tag @s add spell_levitating_descending
execute as @a[tag=spell_levitating_descending] run tag @s remove spell_levitating

execute as @a[tag=spell_levitating_descending] run effect clear @s levitation
execute as @a[tag=spell_levitating_descending] run effect give @s slow_falling 3 0 false
execute as @a[tag=spell_levitating_descending] run tag @s remove spell_levitating_descending