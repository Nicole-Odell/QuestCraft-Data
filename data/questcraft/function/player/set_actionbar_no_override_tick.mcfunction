scoreboard players remove @s actionbarNoOverrideTime 1

# If the time has run out, remove the tag
execute if score @s actionbarNoOverrideTime matches 0 run tag @s remove actionbar_no_override