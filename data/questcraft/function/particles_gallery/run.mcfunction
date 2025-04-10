# Ensure everything is within bounds
execute if score _globals particlesGallerySpeed matches ..0 run scoreboard players set _globals particlesGallerySpeed 0
execute if score _globals particlesGalleryCount matches ..0 run scoreboard players set _globals particlesGalleryCount 0
execute if score _globals particlesGalleryDeltaX matches ..0 run scoreboard players set _globals particlesGalleryDeltaX 0
execute if score _globals particlesGalleryDeltaZ matches ..0 run scoreboard players set _globals particlesGalleryDeltaZ 0
execute if score _globals particlesGalleryDeltaY matches ..0 run scoreboard players set _globals particlesGalleryDeltaY 0
execute if score _globals particlesGalleryColorR matches ..0 run scoreboard players set _globals particlesGalleryColorR 0
execute if score _globals particlesGalleryColorR matches 100.. run scoreboard players set _globals particlesGalleryColorR 100
execute if score _globals particlesGalleryColorG matches ..0 run scoreboard players set _globals particlesGalleryColorG 0
execute if score _globals particlesGalleryColorG matches 100.. run scoreboard players set _globals particlesGalleryColorG 100
execute if score _globals particlesGalleryColorB matches ..0 run scoreboard players set _globals particlesGalleryColorB 0
execute if score _globals particlesGalleryColorB matches 100.. run scoreboard players set _globals particlesGalleryColorB 100

execute store result storage questcraft:args particlesGalleryDeltaX float 0.01 run scoreboard players get _globals particlesGalleryDeltaX
execute store result storage questcraft:args particlesGalleryDeltaY float 0.01 run scoreboard players get _globals particlesGalleryDeltaY
execute store result storage questcraft:args particlesGalleryDeltaZ float 0.01 run scoreboard players get _globals particlesGalleryDeltaZ
execute store result storage questcraft:args particlesGalleryDeltaScaleX float 0.04 run scoreboard players get _globals particlesGalleryDeltaX
execute store result storage questcraft:args particlesGalleryDeltaScaleY float 0.04 run scoreboard players get _globals particlesGalleryDeltaY
execute store result storage questcraft:args particlesGalleryDeltaScaleZ float 0.04 run scoreboard players get _globals particlesGalleryDeltaZ
execute store result storage questcraft:args particlesGalleryDeltaTranslationX float -0.02 run scoreboard players get _globals particlesGalleryDeltaX
execute store result storage questcraft:args particlesGalleryDeltaTranslationY float -0.02 run scoreboard players get _globals particlesGalleryDeltaY
execute store result storage questcraft:args particlesGalleryDeltaTranslationZ float -0.02 run scoreboard players get _globals particlesGalleryDeltaZ
execute store result storage questcraft:args particlesGallerySpeed float 0.01 run scoreboard players get _globals particlesGallerySpeed
execute store result storage questcraft:args particlesGalleryCount int 1 run scoreboard players get _globals particlesGalleryCount
execute store result storage questcraft:args particlesGalleryColorR float 0.01 run scoreboard players get _globals particlesGalleryColorR
execute store result storage questcraft:args particlesGalleryColorG float 0.01 run scoreboard players get _globals particlesGalleryColorG
execute store result storage questcraft:args particlesGalleryColorB float 0.01 run scoreboard players get _globals particlesGalleryColorB
function questcraft:particles_gallery/fix_color with storage questcraft:args

execute if score _globals particlesGalleryForce matches 0 run data modify storage questcraft:args particlesGalleryForce set value "normal"
execute if score _globals particlesGalleryForce matches 1 run data modify storage questcraft:args particlesGalleryForce set value "force"

# We need to get the coordinate to point the vibration particle to
execute store result score _vibrationX var run data get entity @n[type=armor_stand,tag=particle_gallery_vibration,distance=..256] Pos[0]
execute store result score _vibrationY var run data get entity @n[type=armor_stand,tag=particle_gallery_vibration,distance=..256] Pos[1]
execute store result score _vibrationZ var run data get entity @n[type=armor_stand,tag=particle_gallery_vibration,distance=..256] Pos[2]
# Offset apropriately
scoreboard players add _vibrationX var 1
scoreboard players add _vibrationY var 3
scoreboard players remove _vibrationZ var 2
# Save in args
execute store result storage questcraft:args particlesGalleryVibrationTargetX int 1 run scoreboard players get _vibrationX var
execute store result storage questcraft:args particlesGalleryVibrationTargetY int 1 run scoreboard players get _vibrationY var
execute store result storage questcraft:args particlesGalleryVibrationTargetZ int 1 run scoreboard players get _vibrationZ var

function questcraft:particles_gallery/run_sub with storage questcraft:args

scoreboard players reset _vibrationX var
scoreboard players reset _vibrationY var
scoreboard players reset _vibrationZ var

data remove storage questcraft:args particlesGalleryDeltaX
data remove storage questcraft:args particlesGalleryDeltaY
data remove storage questcraft:args particlesGalleryDeltaZ
data remove storage questcraft:args particlesGalleryDeltaScaleX
data remove storage questcraft:args particlesGalleryDeltaScaleY
data remove storage questcraft:args particlesGalleryDeltaScaleZ
data remove storage questcraft:args particlesGalleryDeltaTranslationX
data remove storage questcraft:args particlesGalleryDeltaTranslationY
data remove storage questcraft:args particlesGalleryDeltaTranslationZ
data remove storage questcraft:args particlesGallerySpeed
data remove storage questcraft:args particlesGalleryCount
data remove storage questcraft:args particlesGalleryColorR
data remove storage questcraft:args particlesGalleryColorG
data remove storage questcraft:args particlesGalleryColorB
data remove storage questcraft:args particlesGalleryForce

data remove storage questcraft:args particlesGalleryVibrationTargetX
data remove storage questcraft:args particlesGalleryVibrationTargetY
data remove storage questcraft:args particlesGalleryVibrationTargetZ