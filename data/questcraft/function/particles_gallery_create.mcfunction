# Set default settings
function questcraft:particles_gallery_reset

# Clear the area for controls
fill ~-3 ~ ~ ~11 ~5 ~-8 air replace

# Clear old labels and delta display
kill @e[type=armor_stand,tag=particle_gallery]
kill @e[type=block_display,tag=particle_gallery]

# Create the main toggle
setblock ~-3 ~1 ~ minecraft:lever[face=floor,facing=south] replace
setblock ~-3 ~ ~ minecraft:repeating_command_block{Command:"execute positioned ~3 ~1 ~ run function questcraft:particles_gallery"} replace

# Create the labels for the controls
summon minecraft:armor_stand ~1 ~ ~-3 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery","particle_gallery_speed"]}
summon minecraft:armor_stand ~1 ~ ~-5 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery","particle_gallery_count"]}

summon minecraft:armor_stand ~9 ~1 ~-3 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery","particle_gallery_color_r"]}
summon minecraft:armor_stand ~9 ~1 ~-5 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery","particle_gallery_color_g"]}
summon minecraft:armor_stand ~9 ~1 ~-7 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery","particle_gallery_color_b"]}

summon minecraft:armor_stand ~5 ~0.5 ~-4 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery","particle_gallery_delta"]}

# Create the block display for the delta
summon block_display ~5 ~3 ~-4 {Tags:["particle_gallery","particle_gallery_delta"],width:1f,height:1f,interpolation_duration:10,brightness:{sky:15,block:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]},block_state:{Name:"minecraft:glass"}}
setblock ~5 ~1 ~-4 minecraft:glass

# Create controls command blocks

# Reset
setblock ~-2 ~ ~-4 minecraft:command_block{Command:"function questcraft:particles_gallery_reset"} replace
setblock ~-2 ~1 ~-4 minecraft:polished_blackstone_button[face=floor,facing=north] replace

# Speed
setblock ~ ~ ~-3 minecraft:command_block{Command:"execute unless score _globals particlesGallerySpeed matches 0 run scoreboard players remove _globals particlesGallerySpeed 5"} replace
setblock ~ ~1 ~-3 minecraft:lever[face=floor,facing=south] replace
setblock ~2 ~ ~-3 minecraft:command_block{Command:"scoreboard players add _globals particlesGallerySpeed 5"} replace
setblock ~2 ~1 ~-3 minecraft:lever[face=floor,facing=south] replace

# Count
setblock ~ ~ ~-5 minecraft:command_block{Command:"execute unless score _globals particlesGalleryCount matches 0 run scoreboard players remove _globals particlesGalleryCount 1"} replace
setblock ~ ~1 ~-5 minecraft:lever[face=floor,facing=south] replace
setblock ~2 ~ ~-5 minecraft:command_block{Command:"scoreboard players add _globals particlesGalleryCount 1"} replace
setblock ~2 ~1 ~-5 minecraft:lever[face=floor,facing=south] replace

# Delta
setblock ~4 ~ ~-4 minecraft:command_block{Command:"execute unless score _globals particlesGalleryDeltaX matches 0 run scoreboard players remove _globals particlesGalleryDeltaX 5"} replace
setblock ~4 ~1 ~-4 minecraft:lever[face=floor,facing=south] replace
setblock ~6 ~ ~-4 minecraft:command_block{Command:"scoreboard players add _globals particlesGalleryDeltaX 5"} replace
setblock ~6 ~1 ~-4 minecraft:lever[face=floor,facing=south] replace

setblock ~5 ~ ~-5 minecraft:command_block{Command:"execute unless score _globals particlesGalleryDeltaZ matches 0 run scoreboard players remove _globals particlesGalleryDeltaZ 5"} replace
setblock ~5 ~1 ~-5 minecraft:lever[face=floor,facing=south] replace
setblock ~5 ~ ~-3 minecraft:command_block{Command:"scoreboard players add _globals particlesGalleryDeltaZ 5"} replace
setblock ~5 ~1 ~-3 minecraft:lever[face=floor,facing=south] replace

setblock ~4 ~ ~-6 minecraft:command_block{Command:"execute unless score _globals particlesGalleryDeltaY matches 0 run scoreboard players remove _globals particlesGalleryDeltaY 5"} replace
setblock ~4 ~1 ~-6 minecraft:lever[face=floor,facing=south] replace
setblock ~6 ~ ~-6 minecraft:command_block{Command:"scoreboard players add _globals particlesGalleryDeltaY 5"} replace
setblock ~6 ~1 ~-6 minecraft:lever[face=floor,facing=south] replace

# Color
setblock ~8 ~ ~-3 minecraft:command_block{Command:"execute unless score _globals particlesGalleryColorR matches 0 run scoreboard players remove _globals particlesGalleryColorR 10"} replace
setblock ~8 ~1 ~-3 minecraft:lever[face=floor,facing=south] replace
setblock ~10 ~ ~-3 minecraft:command_block{Command:"execute unless score _globals particlesGalleryColorR matches 1000 run scoreboard players add _globals particlesGalleryColorR 10"} replace
setblock ~10 ~1 ~-3 minecraft:lever[face=floor,facing=south] replace

setblock ~8 ~ ~-5 minecraft:command_block{Command:"execute unless score _globals particlesGalleryColorG matches 0 run scoreboard players remove _globals particlesGalleryColorG 10"} replace
setblock ~8 ~1 ~-5 minecraft:lever[face=floor,facing=south] replace
setblock ~10 ~ ~-5 minecraft:command_block{Command:"execute unless score _globals particlesGalleryColorG matches 1000 run scoreboard players add _globals particlesGalleryColorG 10"} replace
setblock ~10 ~1 ~-5 minecraft:lever[face=floor,facing=south] replace

setblock ~8 ~ ~-7 minecraft:command_block{Command:"execute unless score _globals particlesGalleryColorB matches 0 run scoreboard players remove _globals particlesGalleryColorB 10"} replace
setblock ~8 ~1 ~-7 minecraft:lever[face=floor,facing=south] replace
setblock ~10 ~ ~-7 minecraft:command_block{Command:"execute unless score _globals particlesGalleryColorB matches 1000 run scoreboard players add _globals particlesGalleryColorB 10"} replace
setblock ~10 ~1 ~-7 minecraft:lever[face=floor,facing=south] replace

# Create the pedestals for all the effects
setblock ~ ~ ~ minecraft:glass replace
setblock ~2 ~ ~ minecraft:glass replace
setblock ~4 ~ ~ minecraft:glass replace
setblock ~6 ~ ~ minecraft:glass replace
setblock ~8 ~ ~ minecraft:glass replace
setblock ~10 ~ ~ minecraft:glass replace
setblock ~12 ~ ~ minecraft:glass replace
setblock ~14 ~ ~ minecraft:glass replace
setblock ~16 ~ ~ minecraft:glass replace
setblock ~18 ~ ~ minecraft:glass replace
setblock ~20 ~ ~ minecraft:glass replace
setblock ~22 ~ ~ minecraft:glass replace
setblock ~24 ~ ~ minecraft:glass replace
setblock ~26 ~ ~ minecraft:glass replace
setblock ~28 ~ ~ minecraft:glass replace
setblock ~30 ~ ~ minecraft:glass replace
setblock ~32 ~ ~ minecraft:glass replace
setblock ~34 ~ ~ minecraft:glass replace
setblock ~36 ~ ~ minecraft:glass replace
setblock ~38 ~ ~ minecraft:glass replace
setblock ~40 ~ ~ minecraft:glass replace
setblock ~42 ~ ~ minecraft:glass replace
setblock ~44 ~ ~ minecraft:glass replace
setblock ~46 ~ ~ minecraft:glass replace
setblock ~48 ~ ~ minecraft:white_stained_glass replace
setblock ~50 ~ ~ minecraft:white_stained_glass replace
setblock ~52 ~ ~ minecraft:glass replace
setblock ~54 ~ ~ minecraft:glass replace
setblock ~56 ~ ~ minecraft:glass replace
setblock ~58 ~ ~ minecraft:glass replace
setblock ~60 ~ ~ minecraft:glass replace
setblock ~62 ~ ~ minecraft:glass replace
setblock ~64 ~ ~ minecraft:glass replace
setblock ~66 ~ ~ minecraft:glass replace
setblock ~68 ~ ~ minecraft:glass replace
setblock ~70 ~ ~ minecraft:white_stained_glass replace
setblock ~72 ~ ~ minecraft:glass replace
setblock ~74 ~ ~ minecraft:glass replace
setblock ~76 ~ ~ minecraft:glass replace
setblock ~78 ~ ~ minecraft:glass replace
setblock ~80 ~ ~ minecraft:glass replace
setblock ~82 ~ ~ minecraft:glass replace
setblock ~84 ~ ~ minecraft:glass replace
setblock ~86 ~ ~ minecraft:glass replace
setblock ~88 ~ ~ minecraft:glass replace
setblock ~90 ~ ~ minecraft:glass replace
setblock ~92 ~ ~ minecraft:glass replace
setblock ~94 ~ ~ minecraft:glass replace
setblock ~96 ~ ~ minecraft:glass replace
setblock ~98 ~ ~ minecraft:glass replace
setblock ~100 ~ ~ minecraft:glass replace
setblock ~102 ~ ~ minecraft:glass replace
setblock ~104 ~ ~ minecraft:glass replace
setblock ~106 ~ ~ minecraft:glass replace
setblock ~108 ~ ~ minecraft:glass replace
setblock ~110 ~ ~ minecraft:glass replace
setblock ~112 ~ ~ minecraft:glass replace
setblock ~114 ~ ~ minecraft:glass replace
setblock ~116 ~ ~ minecraft:glass replace
setblock ~118 ~ ~ minecraft:glass replace
setblock ~120 ~ ~ minecraft:glass replace
setblock ~122 ~ ~ minecraft:glass replace
setblock ~124 ~ ~ minecraft:glass replace
setblock ~126 ~ ~ minecraft:glass replace
setblock ~128 ~ ~ minecraft:glass replace
setblock ~130 ~ ~ minecraft:glass replace
setblock ~132 ~ ~ minecraft:glass replace
setblock ~134 ~ ~ minecraft:glass replace
setblock ~136 ~ ~ minecraft:glass replace
setblock ~138 ~ ~ minecraft:glass replace
setblock ~140 ~ ~ minecraft:glass replace
setblock ~142 ~ ~ minecraft:glass replace
setblock ~144 ~ ~ minecraft:glass replace
setblock ~146 ~ ~ minecraft:glass replace
setblock ~148 ~ ~ minecraft:glass replace
setblock ~150 ~ ~ minecraft:glass replace
setblock ~152 ~ ~ minecraft:glass replace
setblock ~154 ~ ~ minecraft:glass replace
setblock ~156 ~ ~ minecraft:glass replace
setblock ~158 ~ ~ minecraft:glass replace
setblock ~160 ~ ~ minecraft:glass replace
setblock ~162 ~ ~ minecraft:glass replace
setblock ~164 ~ ~ minecraft:glass replace
setblock ~166 ~ ~ minecraft:glass replace
setblock ~168 ~ ~ minecraft:glass replace
setblock ~170 ~ ~ minecraft:glass replace
setblock ~172 ~ ~ minecraft:glass replace
setblock ~174 ~ ~ minecraft:glass replace
setblock ~176 ~ ~ minecraft:glass replace
setblock ~178 ~ ~ minecraft:glass replace
setblock ~180 ~ ~ minecraft:glass replace
setblock ~182 ~ ~ minecraft:glass replace
setblock ~184 ~ ~ minecraft:glass replace
setblock ~186 ~ ~ minecraft:glass replace
setblock ~188 ~ ~ minecraft:glass replace
setblock ~190 ~ ~ minecraft:glass replace
setblock ~192 ~ ~ minecraft:glass replace
setblock ~194 ~ ~ minecraft:glass replace
setblock ~196 ~ ~ minecraft:glass replace
setblock ~198 ~ ~ minecraft:glass replace
setblock ~200 ~ ~ minecraft:glass replace
setblock ~202 ~ ~ minecraft:glass replace
setblock ~204 ~ ~ minecraft:glass replace
setblock ~206 ~ ~ minecraft:glass replace
setblock ~208 ~ ~ minecraft:glass replace
setblock ~210 ~ ~ minecraft:glass replace
setblock ~212 ~ ~ minecraft:glass replace

# Create the labels for all the effects
summon minecraft:armor_stand ~ ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"angry_villager"}'}
summon minecraft:armor_stand ~2 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"ash"}'}
summon minecraft:armor_stand ~4 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"block"}'}
summon minecraft:armor_stand ~6 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"block_marker"}'}
summon minecraft:armor_stand ~8 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"bubble"}'}
summon minecraft:armor_stand ~10 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"bubble_column_up"}'}
summon minecraft:armor_stand ~12 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"bubble_pop"}'}
summon minecraft:armor_stand ~14 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"campfire_cosy_smoke"}'}
summon minecraft:armor_stand ~16 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"campfire_signal_smoke"}'}
summon minecraft:armor_stand ~18 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"cherry_leaves"}'}
summon minecraft:armor_stand ~20 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"cloud"}'}
summon minecraft:armor_stand ~22 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"composter"}'}
summon minecraft:armor_stand ~24 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"crimson_spore"}'}
summon minecraft:armor_stand ~26 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"crit"}'}
summon minecraft:armor_stand ~28 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"current_down"}'}
summon minecraft:armor_stand ~30 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"damage_indicator"}'}
summon minecraft:armor_stand ~32 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dolphin"}'}
summon minecraft:armor_stand ~34 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dragon_breath"}'}
summon minecraft:armor_stand ~36 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dripping_dripstone_lava"}'}
summon minecraft:armor_stand ~38 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dripping_dripstone_water"}'}
summon minecraft:armor_stand ~40 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dripping_honey"}'}
summon minecraft:armor_stand ~42 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dripping_lava"}'}
summon minecraft:armor_stand ~44 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dripping_obsidian_tear"}'}
summon minecraft:armor_stand ~46 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dripping_water"}'}
summon minecraft:armor_stand ~48 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dust"}'}
summon minecraft:armor_stand ~50 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dust_color_transition"}'}
summon minecraft:armor_stand ~52 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dust_pillar"}'}
summon minecraft:armor_stand ~54 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"dust_plume"}'}
summon minecraft:armor_stand ~56 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"effect"}'}
summon minecraft:armor_stand ~58 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"egg_crack"}'}
summon minecraft:armor_stand ~60 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"elder_guardian"}'}
summon minecraft:armor_stand ~62 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"electric_spark"}'}
summon minecraft:armor_stand ~64 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"enchant"}'}
summon minecraft:armor_stand ~66 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"enchanted_hit"}'}
summon minecraft:armor_stand ~68 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"end_rod"}'}
summon minecraft:armor_stand ~70 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"entity_effect"}'}
summon minecraft:armor_stand ~72 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"explosion"}'}
summon minecraft:armor_stand ~74 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"explosion_emitter"}'}
summon minecraft:armor_stand ~76 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"falling_dripstone_lava"}'}
summon minecraft:armor_stand ~78 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"falling_dripstone_water"}'}
summon minecraft:armor_stand ~80 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"falling_dust"}'}
summon minecraft:armor_stand ~82 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"falling_honey"}'}
summon minecraft:armor_stand ~84 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"falling_lava"}'}
summon minecraft:armor_stand ~86 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"falling_nectar"}'}
summon minecraft:armor_stand ~88 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"falling_obsidian_tear"}'}
summon minecraft:armor_stand ~90 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"falling_spore_blossom"}'}
summon minecraft:armor_stand ~92 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"falling_water"}'}
summon minecraft:armor_stand ~94 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"firework"}'}
summon minecraft:armor_stand ~96 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"fishing"}'}
summon minecraft:armor_stand ~98 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"flame"}'}
summon minecraft:armor_stand ~100 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"flash"}'}
summon minecraft:armor_stand ~102 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"glow"}'}
summon minecraft:armor_stand ~104 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"glow_squid_ink"}'}
summon minecraft:armor_stand ~106 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"gust"}'}
summon minecraft:armor_stand ~108 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"happy_villager"}'}
summon minecraft:armor_stand ~110 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"heart"}'}
summon minecraft:armor_stand ~112 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"infested"}'}
summon minecraft:armor_stand ~114 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"instant_effect"}'}
summon minecraft:armor_stand ~116 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"item"}'}
summon minecraft:armor_stand ~118 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"item_cobweb"}'}
summon minecraft:armor_stand ~120 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"item_slime"}'}
summon minecraft:armor_stand ~122 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"item_snowball"}'}
summon minecraft:armor_stand ~124 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"landing_honey"}'}
summon minecraft:armor_stand ~126 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"landing_lava"}'}
summon minecraft:armor_stand ~128 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"landing_obsidian_tear"}'}
summon minecraft:armor_stand ~130 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"large_smoke"}'}
summon minecraft:armor_stand ~132 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"lava"}'}
summon minecraft:armor_stand ~134 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"mycelium"}'}
summon minecraft:armor_stand ~136 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"nautilus"}'}
summon minecraft:armor_stand ~138 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"note"}'}
summon minecraft:armor_stand ~140 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"ominous_spawning"}'}
summon minecraft:armor_stand ~142 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"poof"}'}
summon minecraft:armor_stand ~144 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"portal"}'}
summon minecraft:armor_stand ~146 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"raid_omen"}'}
summon minecraft:armor_stand ~148 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"rain"}'}
summon minecraft:armor_stand ~150 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"reverse_portal"}'}
summon minecraft:armor_stand ~152 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"scrape"}'}
summon minecraft:armor_stand ~154 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"sculk_charge"}'}
summon minecraft:armor_stand ~156 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"sculk_charge_pop"}'}
summon minecraft:armor_stand ~158 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"sculk_soul"}'}
summon minecraft:armor_stand ~160 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"shriek"}'}
summon minecraft:armor_stand ~162 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"small_flame"}'}
summon minecraft:armor_stand ~164 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"small_gust"}'}
summon minecraft:armor_stand ~166 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"smoke"}'}
summon minecraft:armor_stand ~168 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"sneeze"}'}
summon minecraft:armor_stand ~170 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"snowflake"}'}
summon minecraft:armor_stand ~172 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"sonic_boom"}'}
summon minecraft:armor_stand ~174 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"soul"}'}
summon minecraft:armor_stand ~176 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"soul_fire_flame"}'}
summon minecraft:armor_stand ~178 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"spit"}'}
summon minecraft:armor_stand ~180 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"splash"}'}
summon minecraft:armor_stand ~182 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"spore_blossom_air"}'}
summon minecraft:armor_stand ~184 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"squid_ink"}'}
summon minecraft:armor_stand ~186 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"sweep_attack"}'}
summon minecraft:armor_stand ~188 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"totem_of_undying"}'}
summon minecraft:armor_stand ~190 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"trial_omen"}'}
summon minecraft:armor_stand ~192 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"trial_spawner_detection"}'}
summon minecraft:armor_stand ~194 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"trial_spawner_detection_ominous"}'}
summon minecraft:armor_stand ~196 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"underwater"}'}
summon minecraft:armor_stand ~198 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"vault_connection"}'}
summon minecraft:armor_stand ~200 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery","particle_gallery_vibration"],CustomName:'{"bold":true,"text":"vibration"}'}
summon minecraft:armor_stand ~202 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"warped_spore"}'}
summon minecraft:armor_stand ~204 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"wax_off"}'}
summon minecraft:armor_stand ~206 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"wax_on"}'}
summon minecraft:armor_stand ~208 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"white_ash"}'}
summon minecraft:armor_stand ~210 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"white_smoke"}'}
summon minecraft:armor_stand ~212 ~-1 ~1 {CustomNameVisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["particle_gallery"],CustomName:'{"bold":true,"text":"witch"}'}

function questcraft:particles_gallery