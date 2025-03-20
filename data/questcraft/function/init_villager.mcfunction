# Give them enough Xp to become master
data modify entity @s Xp set value 250
# Give them a dummy trade which can be used to level them up
data modify entity @s Offers.Recipes insert 0 value {buy:{id:emerald,count:1},sell:{id:emerald,count:1},maxUses:99999}

tag @s add villager_init