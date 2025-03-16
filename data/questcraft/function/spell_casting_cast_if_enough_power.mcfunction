# Store the castSource as a score
$scoreboard players set _cast_source var $(castSource)

# Store the Spell cost as a score
$scoreboard players set _spell_cost var $(spellCost)

# Determine how much the spell would cost to cast with the source
scoreboard players set _spell_cost_with_source var 0
execute if score _cast_source var matches 0 run scoreboard players operation _spell_cost_with_source var = _spell_cost var
execute if score _cast_source var matches 0 run scoreboard players operation _spell_cost_with_source var /= _globals spellCastingFoodPower
execute if score _cast_source var matches 1 run scoreboard players operation _spell_cost_with_source var = _spell_cost var
execute if score _cast_source var matches 1 run scoreboard players operation _spell_cost_with_source var /= _globals spellCastingBloodPower
execute if score _cast_source var matches 2 run scoreboard players operation _spell_cost_with_source var = _spell_cost var
execute if score _cast_source var matches 2 run scoreboard players operation _spell_cost_with_source var /= _globals spellCastingSoulPower

# Determine if we have enough of the source's power to proceed
execute if score _cast_source var matches 0 run execute store result score _caster_power_with_source var run scoreboard players get @s food
# Account for saturation if source is food
execute if score _cast_source var matches 0 run execute store result score _caster_food_saturation_power var run data get entity @s foodSaturationLevel
execute if score _cast_source var matches 0 run scoreboard players operation _caster_food_saturation_power var *= _globals spellCastingFoodPower
execute if score _cast_source var matches 0 run scoreboard players operation _caster_power_with_source var += _caster_food_saturation_power var

execute if score _cast_source var matches 1 run execute store result score _caster_power_with_source var run scoreboard players get @s health
execute if score _cast_source var matches 2 run execute store result score _caster_power_with_source var run scoreboard players get @s soulPower.current

# We can cast with all of our power for hunger or soul, but not for health (otherwise we will die)
execute if score _cast_source var matches 0 run execute store result score _cast_possible var run execute if score _caster_power_with_source var >= _spell_cost_with_source var
execute if score _cast_source var matches 1 run execute store result score _cast_possible var run execute if score _caster_power_with_source var > _spell_cost_with_source var
execute if score _cast_source var matches 2 run execute store result score _cast_possible var run execute if score _caster_power_with_source var >= _spell_cost_with_source var

# If not enough power, fail to cast
execute if score _cast_possible var matches 0 run function questcraft:spell_casting_fail_not_enough_power

# If enough power, apply the cost to the source
execute if score _cast_source var matches 0 run execute if score _cast_possible var matches 1 run function questcraft:spell_casting_deduct_cost_food
execute if score _cast_source var matches 1 run execute if score _cast_possible var matches 1 run function questcraft:spell_casting_deduct_cost_health
execute if score _cast_source var matches 2 run execute if score _cast_possible var matches 1 run function questcraft:spell_casting_deduct_cost_soul

# If enough power, execute the spell function
$execute if score _cast_possible var matches 1 run function $(spellFunction) with storage questcraft:args

# Spell cast successfully
execute if score _cast_possible var matches 1 run function questcraft:spell_casting_finish with storage questcraft:args

scoreboard players reset _cast_source var
scoreboard players reset _spell_cost var
scoreboard players reset _spell_cost_with_source var
scoreboard players reset _caster_power_with_source var
scoreboard players reset _caster_food_saturation_power var
scoreboard players reset _cast_possible var