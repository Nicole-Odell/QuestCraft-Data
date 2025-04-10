execute store result score _bonded_entity_health var run data get entity @s Health 1
scoreboard players operation _blood_bond_power var += _bonded_entity_health var
scoreboard players reset _bonded_entity_health var