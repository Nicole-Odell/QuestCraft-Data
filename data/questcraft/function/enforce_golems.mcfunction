# Get the number of golems in the radius
$execute store result score _num_golems var run execute if entity @e[type=iron_golem,distance=..$(checkRange)]

# We are done if there are already enough golems
$execute if score _num_golems var matches $(maxGolems).. run return run scoreboard players reset _num_golems var

# If there aren't any villagers outside, we can't spawn any golems right now
$execute unless entity @e[type=villager,predicate=questcraft:is_exposed_to_sky,distance=..$(checkRange)] run return 1

# We want the passed value to be the max. Since ranges are inclusive, add one to make = to the max invalid
scoreboard players add _num_golems var 1

# Just iterate a few times, too lazy to write a whole step fn for this rn. Support up to 5 golems
$execute if score _num_golems var matches ..$(maxGolems) run summon iron_golem ~ ~ ~ {Tags:["enforcer_golem","enforcer_golem_new"],PersistenceRequired:1b}
scoreboard players add _num_golems var 1
$execute if score _num_golems var matches ..$(maxGolems) run summon iron_golem ~ ~ ~ {Tags:["enforcer_golem","enforcer_golem_new"],PersistenceRequired:1b}
scoreboard players add _num_golems var 1
$execute if score _num_golems var matches ..$(maxGolems) run summon iron_golem ~ ~ ~ {Tags:["enforcer_golem","enforcer_golem_new"],PersistenceRequired:1b}
scoreboard players add _num_golems var 1
$execute if score _num_golems var matches ..$(maxGolems) run summon iron_golem ~ ~ ~ {Tags:["enforcer_golem","enforcer_golem_new"],PersistenceRequired:1b}
scoreboard players add _num_golems var 1
$execute if score _num_golems var matches ..$(maxGolems) run summon iron_golem ~ ~ ~ {Tags:["enforcer_golem","enforcer_golem_new"],PersistenceRequired:1b}
scoreboard players add _num_golems var 1

# Spread the golems around, then tp them to the nearest villager that can see the sky to ensure they are on the ground
$spreadplayers ~ ~ $(spreadSeparation) $(spreadRange) false @e[type=iron_golem,tag=enforcer_golem_new,distance=..$(checkRange)]
$execute as @e[type=iron_golem,tag=enforcer_golem_new,distance=..$(checkRange)] at @s run tp @s @e[type=villager,predicate=questcraft:is_exposed_to_sky,distance=..$(spreadRange),limit=1,sort=nearest]

# If they ended up too close to another golem, try again
$execute as @e[type=iron_golem,tag=enforcer_golem_new,distance=..$(checkRange)] at @s if entity @e[type=iron_golem,distance=..$(spreadSeparation)] run tp @s @e[type=villager,predicate=questcraft:is_exposed_to_sky,distance=$(spreadSeparation)..$(spreadRange),limit=1,sort=nearest]

# If the destination is not enough room for the golem, tp them up as a backup
$execute as @e[type=iron_golem,tag=enforcer_golem_new,distance=..$(checkRange)] at @s if blocks ~-1 ~ ~-1 ~1 ~3 ~1 ~ 310 ~ all positioned over world_surface run tp @s ~ ~ ~

# Clear the new tag on the spawned golems
$tag @e[type=iron_golem,tag=enforcer_golem_new,distance=..$(checkRange)] remove enforcer_golem_new

scoreboard players reset _num_golems var
