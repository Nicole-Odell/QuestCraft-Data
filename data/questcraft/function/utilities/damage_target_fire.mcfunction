$damage @s $(damage) on_fire
$data modify entity @s Fire set value $(fireTime)

$tell @a[tag=admin] did damage $(damage) with $(fireTime)t of fire