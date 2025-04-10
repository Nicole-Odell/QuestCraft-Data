# Set their name so they are easier to find
data modify entity @s CustomName set value '[{"text":"📕 "},{"translate":"entity.minecraft.villager.librarian"}]'
data modify entity @s CustomNameVisible set value true

# Biome-specific trades

# desert - chance of thorns. Guaranteed one in desert kingdoms
scoreboard players set _random_val var 0
execute if score _villager_type var matches 0 store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:99}
execute if score _villager_type var matches 0 if score _currentPoiType var matches 2 if score _random_val var matches ..49 run scoreboard players add _random_val var 50
execute if score _random_val var matches 50..74 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:enchanted_book,count:1,components:{enchantments:{thorns:1}}},maxUses:4}
execute if score _random_val var matches 75..89 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{thorns:2}}},maxUses:2}
execute if score _random_val var matches 90..99 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:22},sell:{id:enchanted_book,count:1,components:{enchantments:{thorns:3}}},maxUses:1}

# jungle - chance of thorns. Guaranteed one in jungle kingdoms
scoreboard players set _random_val var 0
execute if score _villager_type var matches 1 store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:99}
execute if score _villager_type var matches 1 if score _currentPoiType var matches 2 if score _random_val var matches ..49 run scoreboard players add _random_val var 50
execute if score _random_val var matches 50..74 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:enchanted_book,count:1,components:{enchantments:{thorns:1}}},maxUses:4}
execute if score _random_val var matches 75..89 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{thorns:2}}},maxUses:2}
execute if score _random_val var matches 90..99 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:22},sell:{id:enchanted_book,count:1,components:{enchantments:{thorns:3}}},maxUses:1}

# plains
# Nothing special

# savanna
# Nothing special

# snow - increased chance of fire prot armor. Guaranteed one in snowy kingdoms
scoreboard players set _random_val var 0
execute if score _villager_type var matches 4 if score _villager_type var matches 4 run execute store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:79}
execute if score _villager_type var matches 4 if score _villager_type var matches 4 if score _currentPoiType var matches 2 if score _random_val var matches ..24 run scoreboard players add _random_val var 25
execute if score _random_val var matches 25..49 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{fire_protection:1}}},maxUses:8}
execute if score _random_val var matches 50..64 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:enchanted_book,count:1,components:{enchantments:{fire_protection:2}}},maxUses:4}
execute if score _random_val var matches 65..74 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:enchanted_book,count:1,components:{enchantments:{fire_protection:3}}},maxUses:2}
execute if score _random_val var matches 75..79 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},sell:{id:enchanted_book,count:1,components:{enchantments:{fire_protection:4}}},maxUses:1}
# snow - chance of frost walker. Guaranteed one in snowy kingdoms
scoreboard players set _random_val var 0
execute if score _villager_type var matches 4 store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:64}
execute if score _villager_type var matches 4 if score _currentPoiType var matches 2 if score _random_val var matches ..24 run scoreboard players add _random_val var 25
execute if score _random_val var matches 25..49 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:12},sell:{id:enchanted_book,count:1,components:{enchantments:{frost_walker:1}}},maxUses:4}
execute if score _random_val var matches 50..64 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:20},sell:{id:enchanted_book,count:1,components:{enchantments:{frost_walker:2}}},maxUses:1}

# swamp
# Nothing special

# taiga 
# Nothing special


# Librarians will sell 0-1 enchanted books for each category. Librarians in kingdoms will always have at least 1 in each category

# Armor Basic
execute store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:329}
execute if score _currentPoiType var matches 2 if score _random_val var matches ..164 run scoreboard players add _random_val var 165

execute if score _random_val var matches 165..189 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{protection:1}}},maxUses:8}
execute if score _random_val var matches 190..204 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:26},sell:{id:enchanted_book,count:1,components:{enchantments:{protection:2}}},maxUses:4}
execute if score _random_val var matches 205..214 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:46},sell:{id:enchanted_book,count:1,components:{enchantments:{protection:3}}},maxUses:2}
execute if score _random_val var matches 215..219 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:52},sell:{id:enchanted_book,count:1,components:{enchantments:{protection:4}}},maxUses:1}

execute if score _random_val var matches 220..244 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:enchanted_book,count:1,components:{enchantments:{blast_protection:1}}},maxUses:8}
execute if score _random_val var matches 245..259 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{blast_protection:2}}},maxUses:4}
execute if score _random_val var matches 260..269 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:26},sell:{id:enchanted_book,count:1,components:{enchantments:{blast_protection:3}}},maxUses:2}
execute if score _random_val var matches 270..274 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:36},sell:{id:enchanted_book,count:1,components:{enchantments:{blast_protection:4}}},maxUses:1}

execute if score _random_val var matches 275..299 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:10},sell:{id:enchanted_book,count:1,components:{enchantments:{projectile_protection:1}}},maxUses:8}
execute if score _random_val var matches 300..314 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:22},sell:{id:enchanted_book,count:1,components:{enchantments:{projectile_protection:2}}},maxUses:4}
execute if score _random_val var matches 315..324 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:36},sell:{id:enchanted_book,count:1,components:{enchantments:{projectile_protection:3}}},maxUses:2}
execute if score _random_val var matches 325..329 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:enchanted_book,count:1,components:{enchantments:{projectile_protection:4}}},maxUses:1}

scoreboard players set _random_val var 0
# Don't re-roll fire prot for snowy, since we already did above
execute unless score _villager_type var matches 4 run execute store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:105}
execute unless score _villager_type var matches 4 if score _currentPoiType var matches 2 if score _random_val var matches ..49 run scoreboard players add _random_val var 50
execute if score _random_val var matches 50..74 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{fire_protection:1}}},maxUses:8}
execute if score _random_val var matches 75..89 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:enchanted_book,count:1,components:{enchantments:{fire_protection:2}}},maxUses:4}
execute if score _random_val var matches 90..99 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:enchanted_book,count:1,components:{enchantments:{fire_protection:3}}},maxUses:2}
execute if score _random_val var matches 100..105 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},sell:{id:enchanted_book,count:1,components:{enchantments:{fire_protection:4}}},maxUses:1}


# Sword basic
execute store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:539}
execute if score _currentPoiType var matches 2 if score _random_val var matches ..269 run scoreboard players add _random_val var 270
execute if score _random_val var matches 270..304 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:10},sell:{id:enchanted_book,count:1,components:{enchantments:{sharpness:1}}},maxUses:12}
execute if score _random_val var matches 305..329 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:18},sell:{id:enchanted_book,count:1,components:{enchantments:{sharpness:2}}},maxUses:8}
execute if score _random_val var matches 330..344 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:enchanted_book,count:1,components:{enchantments:{sharpness:3}}},maxUses:4}
execute if score _random_val var matches 345..354 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:enchanted_book,count:1,components:{enchantments:{sharpness:4}}},maxUses:2}
execute if score _random_val var matches 355..359 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},sell:{id:enchanted_book,count:1,components:{enchantments:{sharpness:5}}},maxUses:1}

execute if score _random_val var matches 360..394 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:10},sell:{id:enchanted_book,count:1,components:{enchantments:{bane_of_arthropods:1}}},maxUses:12}
execute if score _random_val var matches 395..419 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:18},sell:{id:enchanted_book,count:1,components:{enchantments:{bane_of_arthropods:2}}},maxUses:8}
execute if score _random_val var matches 420..434 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:enchanted_book,count:1,components:{enchantments:{bane_of_arthropods:3}}},maxUses:4}
execute if score _random_val var matches 435..444 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:enchanted_book,count:1,components:{enchantments:{bane_of_arthropods:4}}},maxUses:2}
execute if score _random_val var matches 445..449 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},sell:{id:enchanted_book,count:1,components:{enchantments:{bane_of_arthropods:5}}},maxUses:1}

execute if score _random_val var matches 450..484 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{smite:1}}},maxUses:12}
execute if score _random_val var matches 485..509 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:enchanted_book,count:1,components:{enchantments:{smite:2}}},maxUses:8}
execute if score _random_val var matches 510..524 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:36},sell:{id:enchanted_book,count:1,components:{enchantments:{smite:3}}},maxUses:4}
execute if score _random_val var matches 525..534 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:enchanted_book,count:1,components:{enchantments:{smite:4}}},maxUses:2}
execute if score _random_val var matches 535..539 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},buyB:{id:emerald,count:16},sell:{id:enchanted_book,count:1,components:{enchantments:{smite:5}}},maxUses:1}


# Sword Special
execute store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:359}
execute if score _currentPoiType var matches 2 if score _random_val var matches ..269 run scoreboard players add _random_val var 90
execute if score _random_val var matches 270..294 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:enchanted_book,count:1,components:{enchantments:{sweeping_edge:1}}},maxUses:4}
execute if score _random_val var matches 295..309 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{sweeping_edge:2}}},maxUses:2}
execute if score _random_val var matches 310..319 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:22},sell:{id:enchanted_book,count:1,components:{enchantments:{sweeping_edge:3}}},maxUses:1}

execute if score _random_val var matches 320..334 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{knockback:1}}},maxUses:4}
execute if score _random_val var matches 335..339 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:enchanted_book,count:1,components:{enchantments:{knockback:1}}},maxUses:1}

execute if score _random_val var matches 340..354 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{fire_aspect:1}}},maxUses:4}
execute if score _random_val var matches 355..359 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:26},sell:{id:enchanted_book,count:1,components:{enchantments:{fire_aspect:2}}},maxUses:1}


# Either bow or crossbow enchantments based on biome type, just like fletchers
# desert
execute if score _villager_type var matches 0 run function questcraft:villager/init_librarian_harsh_biome
# jungle
execute if score _villager_type var matches 1 run function questcraft:villager/init_librarian_normal_biome
# plains
execute if score _villager_type var matches 2 run function questcraft:villager/init_librarian_normal_biome
# savanna
execute if score _villager_type var matches 3 run function questcraft:villager/init_librarian_normal_biome
# snow
execute if score _villager_type var matches 4 run function questcraft:villager/init_librarian_harsh_biome
# swamp
execute if score _villager_type var matches 5 run function questcraft:villager/init_librarian_harsh_biome
# taiga 
execute if score _villager_type var matches 6 run function questcraft:villager/init_librarian_harsh_biome


# Tools
execute store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:179}
execute if score _currentPoiType var matches 2 if score _random_val var matches ..89 run scoreboard players add _random_val var 90
execute if score _random_val var matches 90..124 run data modify entity @s Offers.Recipes append value {buy:{id:emerald, count:10},sell:{id:enchanted_book,count:1,components:{enchantments:{efficiency:1}}},maxUses:12}
execute if score _random_val var matches 125..149 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:18},sell:{id:enchanted_book,count:1,components:{enchantments:{efficiency:2}}},maxUses:8}
execute if score _random_val var matches 150..164 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:enchanted_book,count:1,components:{enchantments:{efficiency:3}}},maxUses:4}
execute if score _random_val var matches 165..174 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:enchanted_book,count:1,components:{enchantments:{efficiency:4}}},maxUses:2}
execute if score _random_val var matches 175..179 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},sell:{id:enchanted_book,count:1,components:{enchantments:{efficiency:5}}},maxUses:1}


# Librarians will always sell regular books
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:book,count:1},maxUses:24}


# Librarians will always buy books, enchanted and normal, as well as paper
data modify entity @s Offers.Recipes append value {buy:{id:enchanted_book,count:1},sell:{id:emerald,count:6},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:book,count:1},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:paper,count:3},sell:{id:emerald,count:1},maxUses:99999}

# Treasure enchanted books are bought at a higher price
data modify entity @s Offers.Recipes append value {buy:{id:enchanted_book,count:1,components:{enchantments:{mending:1}}},sell:{id:emerald,count:28},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:enchanted_book,count:1,components:{enchantments:{infinity:1}}},sell:{id:emerald,count:18},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:enchanted_book,count:1,components:{enchantments:{fortune:1}}},sell:{id:emerald,count:8},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:enchanted_book,count:1,components:{enchantments:{fortune:2}}},sell:{id:emerald,count:12},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:enchanted_book,count:1,components:{enchantments:{fortune:3}}},sell:{id:emerald,count:20},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:enchanted_book,count:1,components:{enchantments:{looting:1}}},sell:{id:emerald,count:6},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:enchanted_book,count:1,components:{enchantments:{looting:2}}},sell:{id:emerald,count:10},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:enchanted_book,count:1,components:{enchantments:{looting:3}}},sell:{id:emerald,count:16},maxUses:99999}

scoreboard players reset _random_val var