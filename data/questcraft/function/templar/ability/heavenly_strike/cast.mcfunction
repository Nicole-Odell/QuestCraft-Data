# Set the heavenly strike max duration
scoreboard players operation @s heavenlyStrikeFloatTime = _globals heavenlyStrikeFloatTime
tag @s add templar_crouch_jump_heavenly_strike_ready

# Track that we are awaiting the heavenly strike confirmation
scoreboard players set @s templar.isAbilityPrimed 1

# Launch the player into the air with a breeze wind charge
execute at @s anchored feet run summon breeze_wind_charge ~ ~ ~ {Motion:[0.0,-1.0,0.0]}
execute at @s run tp @s ~ ~0.15 ~