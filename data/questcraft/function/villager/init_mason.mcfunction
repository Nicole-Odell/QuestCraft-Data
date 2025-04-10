# Set their name so they are easier to find
# Masons function more like general contstruction and carpentry vendors, and are renamed as such
data modify entity @s CustomName set value '[{"text":"🔧 "},{"text":"Carpenter"}]'
data modify entity @s CustomNameVisible set value true

# Biome-specific trades

# desert
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:acacia_boat,count:1},maxUses:99999}
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:acacia_chest_boat,count:1},maxUses:99999}

# jungle
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:bamboo_raft,count:1},maxUses:99999}
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:bamboo_chest_raft,count:1},maxUses:99999}

# savanna
execute if score _villager_type var matches 3 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:acacia_boat,count:1},maxUses:99999}
execute if score _villager_type var matches 3 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:acacia_chest_boat,count:1},maxUses:99999}

# plains
execute if score _villager_type var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:oak_boat,count:1},maxUses:99999}
execute if score _villager_type var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:oak_chest_boat,count:1},maxUses:99999}

# snow
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:spruce_boat,count:1},maxUses:99999}
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:spruce_chest_boat,count:1},maxUses:99999}

# swamp
execute if score _villager_type var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:mangrove_boat,count:1},maxUses:99999}
execute if score _villager_type var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:mangrove_chest_boat,count:1},maxUses:99999}

# taiga
execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:spruce_boat,count:1},maxUses:99999}
execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:spruce_chest_boat,count:1},maxUses:99999}

# Carpenters will always sell beds of a random color
function questcraft:villager/init_mason_beds

# Carpenters will always sell chests and beds, as well as minerals
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:chest,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:quartz,count:3},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:amethyst_shard,count:3},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:lapis_lazuli,count:1},maxUses:99999}

# Carpenters will always buy minerals and inorganic building materials, as well as logs
data modify entity @s Offers.Recipes append value {buy:{id:decorated_pot,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:flower_pot,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:brick,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:clay_ball,count:10},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:prismarine_shard,count:6},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:prismarine_crystals,count:4},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:quartz,count:6},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:amethyst_shard,count:6},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:lapis_lazuli,count:2},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:dark_oak_log,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:oak_log,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:acacia_log,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:birch_log,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:jungle_log,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:spruce_log,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:mangrove_log,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:cherry_log,count:8},sell:{id:emerald,count:1},maxUses:99999}