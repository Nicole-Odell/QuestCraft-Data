# Determine the damage dealt by the templar's sword, as well as any special effects

# Base sword
execute if items entity @s weapon.mainhand minecraft:wooden_sword run scoreboard players set @s templar.swordDamage 4
execute if items entity @s weapon.mainhand minecraft:stone_sword run scoreboard players set @s templar.swordDamage 5
execute if items entity @s weapon.mainhand minecraft:iron_sword run scoreboard players set @s templar.swordDamage 6
execute if items entity @s weapon.mainhand minecraft:golden_sword run scoreboard players set @s templar.swordDamage 4
execute if items entity @s weapon.mainhand minecraft:diamond_sword run scoreboard players set @s templar.swordDamage 7
execute if items entity @s weapon.mainhand minecraft:netherite_sword run scoreboard players set @s templar.swordDamage 8

# Handle enchantments
execute store result score _sharpness_level var run data get entity @s SelectedItem.components.minecraft:enchantments.levels."minecraft:sharpness"
execute store result score _bane_of_arthropods_level var run data get entity @s SelectedItem.components.minecraft:enchantments.levels."minecraft:bane_of_arthropods"
execute store result score _smite_level var run data get entity @s SelectedItem.components.minecraft:enchantments.levels."minecraft:smite"
execute store result score _fire_aspect_level var run data get entity @s SelectedItem.components.minecraft:enchantments.levels."minecraft:fire_aspect"

# Sharpness damage calculation - 2(0.5 * level + 0.5) / 2 -> (2 * level + 1) / 2
scoreboard players operation _sharpness_damage var = _sharpness_level var
scoreboard players set _c_2 var 2
scoreboard players operation _sharpness_damage var *= _c_2 var
scoreboard players add _sharpness_damage var 1
scoreboard players operation _sharpness_damage var /= _c_2 var
# Add the sharpness damage to the sword
scoreboard players operation @s templar.swordDamage += _sharpness_damage var

# Calculate extra smite damage 4(1.25 * level) / 4 -> (5 * level) / 4
scoreboard players operation @s templar.swordUndeadDamage = _smite_level var
scoreboard players set _c_5 var 5
scoreboard players operation @s templar.swordUndeadDamage *= _c_5 var
scoreboard players set _c_4 var 4
scoreboard players operation @s templar.swordUndeadDamage /= _c_4 var
# Add the base damage for easier logic later 
scoreboard players operation @s templar.swordUndeadDamage += @s templar.swordDamage

# Calculate extra bane of arthropods damage. Same math as smite
scoreboard players operation @s templar.swordArthropodDamage = _bane_of_arthropods_level var
scoreboard players operation @s templar.swordArthropodDamage *= _c_5 var
scoreboard players operation @s templar.swordArthropodDamage /= _c_4 var
# Add the base damage for easier logic later 
scoreboard players operation @s templar.swordArthropodDamage += @s templar.swordDamage

# Calculate fire aspect fire time (80 fire ticks per level)
scoreboard players operation @s templar.swordFireTime = _fire_aspect_level var
scoreboard players set _c_80 var 80
scoreboard players operation @s templar.swordFireTime *= _c_80 var

scoreboard players reset _sharpness_level var
scoreboard players reset _sharpness_damage var
scoreboard players reset _bane_of_arthropods_level var
scoreboard players reset _smite_level var
scoreboard players reset _fire_aspect_level var
scoreboard players reset _c_2 var
scoreboard players reset _c_4 var
scoreboard players reset _c_5 var
scoreboard players reset _c_80 var