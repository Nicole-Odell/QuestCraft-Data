# Track whether we have found a discrepancy and should fail the match
scoreboard players set _spell_matched var 1

# Check that the length matches
execute store result score _spell_match_length var run data get storage questcraft:args spellToMatch
execute unless score _spell_length var = _spell_match_length var run scoreboard players set _spell_matched var 0

# Reset and return early if the length didn't match
execute if score _spell_matched var matches 0 run scoreboard players reset _spell_match_length var
execute if score _spell_matched var matches 0 run return fail

# MC refuses to match lists based on their order and instead just does it by their content (ignoring order or count), 
# so we must manually go through the buffer and check each index for a match. 
# We know the length matches already, so we just have to check every index based on the spell length, up to the maximum buffer size (6).
# Could make this iterative with recursion but thats a lot of work, and it's unlikely we will want a buffer larger than 6

# For each index: get the aspect value for the spell and the spell we are matching against, then set _spell_matched to 0 if they *don't* match.
# Then at the end if its still 1 we have a match
execute if score _spell_length var matches 1.. run execute store result score _spell_next_aspect var run data get storage questcraft:args spell[0]
execute if score _spell_length var matches 1.. run execute store result score _spell_match_next_aspect var run data get storage questcraft:args spellToMatch[0]
execute if score _spell_length var matches 1.. unless score _spell_next_aspect var = _spell_match_next_aspect var run scoreboard players set _spell_matched var 0

execute if score _spell_length var matches 2.. run execute store result score _spell_next_aspect var run data get storage questcraft:args spell[1]
execute if score _spell_length var matches 2.. run execute store result score _spell_match_next_aspect var run data get storage questcraft:args spellToMatch[1]
execute if score _spell_length var matches 2.. unless score _spell_next_aspect var = _spell_match_next_aspect var run scoreboard players set _spell_matched var 0

execute if score _spell_length var matches 3.. run execute store result score _spell_next_aspect var run data get storage questcraft:args spell[2]
execute if score _spell_length var matches 3.. run execute store result score _spell_match_next_aspect var run data get storage questcraft:args spellToMatch[2]
execute if score _spell_length var matches 3.. unless score _spell_next_aspect var = _spell_match_next_aspect var run scoreboard players set _spell_matched var 0

execute if score _spell_length var matches 4.. run execute store result score _spell_next_aspect var run data get storage questcraft:args spell[3]
execute if score _spell_length var matches 4.. run execute store result score _spell_match_next_aspect var run data get storage questcraft:args spellToMatch[3]
execute if score _spell_length var matches 4.. unless score _spell_next_aspect var = _spell_match_next_aspect var run scoreboard players set _spell_matched var 0

execute if score _spell_length var matches 5.. run execute store result score _spell_next_aspect var run data get storage questcraft:args spell[4]
execute if score _spell_length var matches 5.. run execute store result score _spell_match_next_aspect var run data get storage questcraft:args spellToMatch[4]
execute if score _spell_length var matches 5.. unless score _spell_next_aspect var = _spell_match_next_aspect var run scoreboard players set _spell_matched var 0

execute if score _spell_length var matches 6 run execute store result score _spell_next_aspect var run data get storage questcraft:args spell[5]
execute if score _spell_length var matches 6 run execute store result score _spell_match_next_aspect var run data get storage questcraft:args spellToMatch[5]
execute if score _spell_length var matches 6 unless score _spell_next_aspect var = _spell_match_next_aspect var run scoreboard players set _spell_matched var 0

# Record that we matched a spell
execute if score _spell_matched var matches 1 run scoreboard players set _any_spell_matched var 1

# Cast the spell if we have enough power
execute if score _spell_matched var matches 1 run execute store success score _spell_cast_possible var run function questcraft:spell_casting_cast_if_enough_power with storage questcraft:args

scoreboard players reset _spell_match_length var
scoreboard players reset _spell_next_aspect var
scoreboard players reset _spell_match_next_aspect var