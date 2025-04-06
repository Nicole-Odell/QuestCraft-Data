# They will only sell horse armor in kingdoms
$execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:22},sell:{id:leather_horse_armor,count:1,components:{dyed_color:$(dyed_color)}},maxUses:99999}
$data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:12},sell:{id:leather_helmet,count:1,components:{dyed_color:$(dyed_color)}},maxUses:99999}
$data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:18},sell:{id:leather_chestplate,count:1,components:{dyed_color:$(dyed_color)}},maxUses:99999}
$data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:leather_leggings,count:1,components:{dyed_color:$(dyed_color)}},maxUses:99999}
$data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:10},sell:{id:leather_boots,count:1,components:{dyed_color:$(dyed_color)}},maxUses:99999}

# They will still dyed horse armor in other POI types
$data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},buyB:{id:leather_horse_armor,count:1,components:{enchantments:{}}},sell:{id:leather_horse_armor,count:1,components:{dyed_color:$(dyed_color)}},maxUses:99999}
$data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:3},buyB:{id:leather_helmet,count:1,components:{enchantments:{}}},sell:{id:leather_helmet,count:1,components:{dyed_color:$(dyed_color)}},maxUses:99999}
$data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:5},buyB:{id:leather_chestplate,count:1,components:{enchantments:{}}},sell:{id:leather_chestplate,count:1,components:{dyed_color:$(dyed_color)}},maxUses:99999}
$data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:4},buyB:{id:leather_leggings,count:1,components:{enchantments:{}}},sell:{id:leather_leggings,count:1,components:{dyed_color:$(dyed_color)}},maxUses:99999}
$data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},buyB:{id:leather_boots,count:1,components:{enchantments:{}}},sell:{id:leather_boots,count:1,components:{dyed_color:$(dyed_color)}},maxUses:99999}