# Determine if the spell buffer represents a valid spell

# Store the length of the spell since we need to check that too
execute store result score _spell_length var run data get storage questcraft:args spell

# This tracks whether any spell was successfully found based on the buffer
scoreboard players set _any_spell_matched var 0

# === Basic === #

# Transfuse Vigor: Converts the equivalent amount of another resource into 12 of food (4 hunger 8 saturation)
data modify storage questcraft:args spellToMatch set value [0]
data modify storage questcraft:args spellName set value "Minor Transfuse Vigor"
data modify storage questcraft:args spellCost set value 12
data modify storage questcraft:args spellFunction set value "questcraft:spell_vigor_minor_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Minor Transfuse Health: Converts the equivalent amount of another resource into 8 of health
data modify storage questcraft:args spellToMatch set value [1]
data modify storage questcraft:args spellName set value "Minor Transfuse Health"
data modify storage questcraft:args spellCost set value 8
data modify storage questcraft:args spellFunction set value "questcraft:spell_heal_minor_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Blood Bond: Binds an enemy's health to the caster, allowing them to draw from their and any other bonded enemy's combined health pool to cast spells.
data modify storage questcraft:args spellToMatch set value [2]
data modify storage questcraft:args spellName set value "Blood Bond"
data modify storage questcraft:args spellCost set value 2
data modify storage questcraft:args spellFunction set value "questcraft:spell_bloodbond_cast"
data modify storage questcraft:args spellCastedWithRaycast set value 1
data modify storage questcraft:args spellRaycastRange set value 14
$data modify storage questcraft:args spellCustomTargetFilter set value "type=#questcraft:is_attack_targetable,tag=!blood_bonded_$(mageId)"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args
data modify storage questcraft:args spellCastedWithRaycast set value 0

# Impact: Launches a volley of 10 magical spears that do significant damage to a single target
data modify storage questcraft:args spellToMatch set value [0,0]
data modify storage questcraft:args spellName set value "Mystic Spears"
data modify storage questcraft:args spellCost set value 4
data modify storage questcraft:args spellFunction set value "questcraft:spell_impact_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Firebolt: Fires a bolt of fire which penetrates enemies and melts ice it touches. When it hits a surface, it leaves a field of fire for a time.
data modify storage questcraft:args spellToMatch set value [0,1]
data modify storage questcraft:args spellName set value "Firebolt"
data modify storage questcraft:args spellCost set value 4
data modify storage questcraft:args spellFunction set value "questcraft:spell_firebolt_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Ice wind: Fires a burst of cold which applies freezing to enemies and freezes water (temporarily (like Frost Walker), unless in a frozen biome).
data modify storage questcraft:args spellToMatch set value [0,2]
data modify storage questcraft:args spellName set value "Icewind"
data modify storage questcraft:args spellCost set value 4
data modify storage questcraft:args spellFunction set value "questcraft:spell_icewind_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Major Transfuse Health: Converts the equivalent amount of another resource into 16 of health, and grants overheal if it goes past max
data modify storage questcraft:args spellToMatch set value [1,1]
data modify storage questcraft:args spellName set value "Major Transfuse Health"
data modify storage questcraft:args spellCost set value 16
data modify storage questcraft:args spellFunction set value "questcraft:spell_heal_major_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Ward: Deflects projectiles for a short time.
data modify storage questcraft:args spellToMatch set value [2,0]
data modify storage questcraft:args spellName set value "Ward"
data modify storage questcraft:args spellCost set value 8
data modify storage questcraft:args spellFunction set value "questcraft:spell_ward_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Inner Warmth: Raises the player's temperature by one level
data modify storage questcraft:args spellToMatch set value [2,1]
data modify storage questcraft:args spellName set value "Inner Warmth"
data modify storage questcraft:args spellCost set value 8
data modify storage questcraft:args spellFunction set value "questcraft:spell_innerwarmth_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Cooling Aura: Provides cool air to the player for a time
data modify storage questcraft:args spellToMatch set value [2,2]
data modify storage questcraft:args spellName set value "Cooling Aura"
data modify storage questcraft:args spellCost set value 10
data modify storage questcraft:args spellFunction set value "questcraft:spell_coolingaura_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args


# === Advanced === #

# Solar Ray: Lights all undead on fire nearby to the caster
data modify storage questcraft:args spellToMatch set value [0,1,2]
data modify storage questcraft:args spellName set value "Solar Ray"
data modify storage questcraft:args spellCost set value 10
data modify storage questcraft:args spellFunction set value "questcraft:spell_solarray_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# #$# Barrier: Enemies cannot enter a small radius around the caster or target for a short time
data modify storage questcraft:args spellToMatch set value [2,0,0]
data modify storage questcraft:args spellName set value "Barrier"
data modify storage questcraft:args spellCost set value 10
data modify storage questcraft:args spellFunction set value "questcraft:spell_barrier_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# #$# Gathering Hail: Collects all projectiles fired at the player for a short time then sends them all flying in a direction
data modify storage questcraft:args spellToMatch set value [2,0,1]
data modify storage questcraft:args spellCost set value 10
data modify storage questcraft:args spellName set value "Gathering Hail"
data modify storage questcraft:args spellFunction set value "questcraft:spell_gatheringhail_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Levitate Self: Applies levitation effect to caster for a time, then slow falling after it ends
data modify storage questcraft:args spellToMatch set value [2,0,2]
data modify storage questcraft:args spellCost set value 8
data modify storage questcraft:args spellName set value "Levitate Self"
data modify storage questcraft:args spellFunction set value "questcraft:spell_levitate_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Bumble Dry: Dries you off at the cost of your sight for a time
data modify storage questcraft:args spellToMatch set value [2,1,0]
data modify storage questcraft:args spellName set value "Bumble Dry"
data modify storage questcraft:args spellCost set value 10
data modify storage questcraft:args spellFunction set value "questcraft:spell_bumbledry_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Clears all active effects, good and bad
data modify storage questcraft:args spellToMatch set value [2,2,2]
data modify storage questcraft:args spellName set value "Cleanse"
data modify storage questcraft:args spellCost set value 10
data modify storage questcraft:args spellFunction set value "questcraft:spell_cleanse_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Magic Might: Grants the caster increased melee damage and damage resistance for a short time

# Gather Flesh: Pulls all enemy mobs near to target to the target, grouping them up

# Transmute Flesh: Turns an enemy mob into another with the same relative health for a short time (doesn't work on all mobs)

# Cursed Revival: Turns an undead into a villager, who dies of wither shortly after

# Blink Self: Teleports caster to a location but gives blindness for a short time

# Summon Sacrifice: summons a mob in front of you that can't move or attack you to function as a shield, which dies after a short time. All nearby mobs will target that mob if possible?

# Sacrifice Sight: Blinds the player but let's them see all mobs nearby for a short time

# Cyclonic Tunnel: Creates a tunnel of wind to cross gaps, which fades after a time. Works by launching entities through it, granting levitation while inside.

# Sacred Spring: Creates a water source block at the target location which disappears after 30 seconds. Regeneration is granted to any entity in water with a range of the source block while active


# === Master === # 

# Hyper Beam: Long range Beam attack that destroys blocks and does massive damage
data modify storage questcraft:args spellToMatch set value [0,2,1,2]
data modify storage questcraft:args spellCost set value 100
data modify storage questcraft:args spellName set value "Hyper Beam"
data modify storage questcraft:args spellFunction set value "questcraft:spell_hyperbeam_cast"
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args

# Banish Soul: Teleports a mob to the same location in the end

# Wither Bloom: pulse that applies wither to all enemies and yourself

# Temporal Bargain: Slows time server-wide, but gives the caster extra speed and haste to compensate
# data modify storage questcraft:args spellToMatch set value [2,0,0,2]
# data modify storage questcraft:args spellCost set value 50
# data modify storage questcraft:args spellName set value "Temporal bargain"
# data modify storage questcraft:args spellFunction set value "questcraft:spell_timebargain_cast"
# execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_cast_if_match with storage questcraft:args


# Fail the spell cast if we didn't match any spells
execute unless score _any_spell_matched var matches 1 run function questcraft:spell_casting_fail_spell_not_found with storage questcraft:args

# Reset state used for casting
data remove storage questcraft:args mageId
data remove storage questcraft:args castSource
data remove storage questcraft:args spell
data remove storage questcraft:args spellToMatch
data remove storage questcraft:args spellCost
data remove storage questcraft:args spellName
data remove storage questcraft:args spellFunction
data remove storage questcraft:args spellCastedWithRaycast
data remove storage questcraft:args spellRaycastRange
data remove storage questcraft:args spellCustomTargetFilter

scoreboard players reset _spell_length var
scoreboard players reset _spell_matched var
scoreboard players reset _any_spell_matched var