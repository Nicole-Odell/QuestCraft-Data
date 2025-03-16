execute as @a[scores={vigor_aspect.charge=1..}] run function questcraft:spell_charge_tick_vigor
execute as @a[scores={blood_aspect.charge=1..}] run function questcraft:spell_charge_tick_blood
execute as @a[scores={soul_aspect.charge=1..}] run function questcraft:spell_charge_tick_soul
execute as @a[scores={void_aspect.charge=1..}] run function questcraft:spell_charge_tick_void

execute as @a[scores={isMage=1}] run function questcraft:spell_casting_display

execute as @a[scores={isMage=1}] run function questcraft:mage_soul_meter_display