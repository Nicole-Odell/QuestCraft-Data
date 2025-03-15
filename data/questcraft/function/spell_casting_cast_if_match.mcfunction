# Check for a match
$execute store result score _spell_matched var run execute if data storage questcraft:args {spell:$(spellToMatch)}
# Record that we matched a spell
execute if score _spell_matched var matches 1 run scoreboard players set _any_spell_matched var 1

# Cast the spell if we have enough power
execute if score _spell_matched var matches 1 run execute store success score _spell_cast_possible var run function questcraft:spell_casting_cast_if_enough_power with storage questcraft:args

scoreboard players reset _spell_matched var