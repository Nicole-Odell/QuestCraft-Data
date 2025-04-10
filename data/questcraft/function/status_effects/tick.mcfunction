# Frozen
execute as @a[tag=status_frozen] at @s run function questcraft:status_effects/frozen_tick
execute as @e[type=#questcraft:is_attack_targetable,tag=status_frozen] at @s run function questcraft:status_effects/frozen_tick