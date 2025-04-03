execute as @a[tag=is_mage,scores={vigor_aspect.charge=1..}] run function questcraft:spell_charge_tick_vigor
execute as @a[tag=is_mage,scores={blood_aspect.charge=1..}] run function questcraft:spell_charge_tick_blood
execute as @a[tag=is_mage,scores={soul_aspect.charge=1..}] run function questcraft:spell_charge_tick_soul
execute as @a[tag=is_mage,scores={void_aspect.charge=1..}] run function questcraft:spell_charge_tick_void

execute as @a[tag=is_mage] run function questcraft:spell_casting_display
execute as @a[tag=is_mage] run function questcraft:mage_soul_meter_display
execute as @a[tag=is_mage,scores={isCastingPrimed=1}] run function questcraft:spell_casting_target_raycast_tick

function questcraft:spells_tick_effects