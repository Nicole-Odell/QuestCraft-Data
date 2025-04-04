# Don't trigger the targeting if they don't have the charge for it.
# Play a sound to indicate
execute if score @s zeal.current < _globals templar.holdClickAbilityCost run playsound block.redstone_torch.burnout player @s ~ ~1 ~ 1 2 1
execute if score @s zeal.current < _globals templar.holdClickAbilityCost run stopsound @s player entity.warden.sonic_charge
execute if score @s zeal.current < _globals templar.holdClickAbilityCost run return fail

tag @s add templar_right_click_hold_ready

playsound entity.player.levelup player @s ~ ~1 ~ 0.5 1.9 0.5