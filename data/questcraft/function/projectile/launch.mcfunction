# Get the next projectile id to use and increment it for the next one
execute store result storage questcraft:args projectileId int 1 run scoreboard players get _globals nextProjectileId
scoreboard players add _globals nextProjectileId 1

# Store this data into args. We don't have the caller do this, so that they can use the {} notation to simplify calls to this function
$data modify storage questcraft:args projectileEntity set value "$(projectileEntity)"
$data modify storage questcraft:args projectileSpeed set value $(projectileSpeed)
$data modify storage questcraft:args projectileSpeedOffsetLR set value "$(projectileSpeedOffsetLR)"
$data modify storage questcraft:args projectileSpeedOffsetUD set value "$(projectileSpeedOffsetUD)"

$data modify storage questcraft:args projectileTag set value "$(projectileTag)"

# Determine if there are actually any custom projectile tags to include
execute store result score _projectile_tags_length var run data get storage questcraft:args projectileTag
# If there is none, put dummy content there to avoid a syntax error
execute if score _projectile_tags_length var matches 0 run data modify storage questcraft:args projectileTag set value "_"

$data modify storage questcraft:args projectileData set value "$(projectileData)"

# Determine if there is actually any custom projectile data to include
execute store result score _projectile_data_length var run data get storage questcraft:args projectileData
# If there is none, put dummy content there to avoid a syntax error
execute if score _projectile_data_length var matches 0 run data modify storage questcraft:args projectileData set value "dummyData:1"

$data modify storage questcraft:args projectileTtl set value $(projectileTtl)

# Get the player UUID so we can set the Owner field properly
data modify storage questcraft:args ownerUuid set from entity @s UUID

function questcraft:projectile/launch_apply with storage questcraft:args

data remove storage questcraft:args projectileId
data remove storage questcraft:args projectileEntity
data remove storage questcraft:args projectileSpeed
data remove storage questcraft:args projectileTag
data remove storage questcraft:args projectileData
data remove storage questcraft:args projectileSpeedOffsetLR
data remove storage questcraft:args projectileSpeedOffsetUD
data remove storage questcraft:args projectileTtl
data remove storage questcraft:args ownerUuid

scoreboard players reset _projectile_data_length var
scoreboard players reset _projectile_tags_length var