# Set their name so they are easier to find
data modify entity @s CustomName set value '[{"text":"✨ "},{"translate":"entity.minecraft.villager.cleric"}]'
data modify entity @s CustomNameVisible set value true

# Clerics will allow players to pay the tithe and donate sacret writs, to receive a blessing of power
data modify entity @s Offers.Recipes append value {buy:{id:music_disc_11,count:1,components:{custom_model_data:2,custom_name:'{"bold":true,"italic":true,"color":"gold","text":"Sacred Writ"}',lore:['{"text":"Bring this to a cleric and pay the tithe"}','{"text":"to receive a Blessing of Divine Power"}']}},buyB:{id:emerald,count:12},sell:{id:music_disc_11,count:1,components:{custom_model_data:3,custom_name:'{"bold":true,"italic":true,"color":"gold","text":"Blessing of Divine Power"}',lore:['{"color":"yellow","text":"A promise of great power from the gods."}','{"color":"yellow","text":"Sleep to meditate and enchance your abilities!"}']}},maxUses:1}

# Clerics will always sell potion base (nether wart), pre-made awkward potions, and alchemic fire (blaze powder)
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:nether_wart,count:1,components:{custom_model_data:1,custom_name:'{"text":"Potion Base"}',lore:['{"text":"Used for brewing awkward potions"}']}},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:4},sell:{id:potion,count:3,components:{max_stack_size:16,potion_contents:{potion:"awkward"}}},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:blaze_powder,count:1,components:{custom_model_data:1,custom_name:'{"text":"Alchemic Fire"}',lore:['{"text":"Used as fuel for brewing potions,"}','{"text":"and as an ingredient for strength potions"}']}},maxUses:99999}

# Clerics in kingdoms have a chance for a rare potion ingredient
scoreboard players set _random_val var 0
execute if score _currentPoiType var matches 2 run execute store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:12}
execute if score _random_val var matches 9 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:pufferfish,count:1},maxUses:1}
execute if score _random_val var matches 10 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:12},sell:{id:magma_cream,count:1},maxUses:1}
execute if score _random_val var matches 11 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:rabbit_foot,count:1},maxUses:1}
execute if score _random_val var matches 12 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:10},sell:{id:phantom_membrane,count:1},maxUses:1}

# Clerics will always sell potion modifying ingredients
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:gunpowder,count:3},maxUses:8}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:redstone,count:8},maxUses:8}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:glowstone_dust,count:4},maxUses:8}

# Biome-specific trades

# desert
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:golden_carrot,count:1},maxUses:99999}

# jungle
# Nothing special

# plains
# Nothing special

# savanna
# Nothing special

# snow
# Nothing special

# swamp
execute if score _villager_type var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:slime_ball,count:4},maxUses:99999}

# taiga
# Nothing special

# Clerics will always sell basic potion ingredients
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:fermented_spider_eye,count:2},maxUses:4}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:glistering_melon_slice,count:1},maxUses:4}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:sugar,count:1},maxUses:4}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:spider_eye,count:3},maxUses:4}

# Clerics in kingdoms will always sell ghast tears
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:ghast_tear,count:1},maxUses:4}


# Clerics will always buy all monster parts and brewing ingredients
data modify entity @s Offers.Recipes append value {buy:{id:rotten_flesh,count:24},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:bone,count:12},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:gunpowder,count:6},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:spider_eye,count:6},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:fermented_spider_eye,count:4},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:ender_eye,count:1},sell:{id:emerald,count:12},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:ender_pearl,count:1},sell:{id:emerald,count:6},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:slime_ball,count:4},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:breeze_rod,count:1},sell:{id:emerald,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:pufferfish,count:1},sell:{id:emerald,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:magma_cream,count:1},sell:{id:emerald,count:6},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:rabbit_foot,count:1},sell:{id:emerald,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:ink_sac,count:4},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:glow_ink_sac,count:3},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:nautilus_shell,count:1},sell:{id:emerald,count:8},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:phantom_membrane,count:1},sell:{id:emerald,count:5},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:ghast_tear,count:1},sell:{id:emerald,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:blaze_rod,count:1},sell:{id:emerald,count:6},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:blaze_powder,count:2},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:nether_wart,count:1},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:redstone,count:16},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:glowstone_dust,count:8},sell:{id:emerald,count:1},maxUses:99999}

scoreboard players reset _random_val var