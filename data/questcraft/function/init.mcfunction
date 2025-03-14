##
 # init.mcfunction
 # wgs2
 #
 # Created by InfectedGrowth.
##

# ==== General ==== #

# scoreboard objectives add rayCastHops dummy
# scoreboard objectives add maxRayCastHops dummy
# scoreboard players set _globals maxRayCastHops 64

# Temp storage used to pass function arguments (via macros)
data merge storage questcraft:args {}
data merge storage questcraft:temp {}

# Temp variables
scoreboard objectives add var dummy
scoreboard objectives add var2 dummy

# ==== Mage ==== #

# Tracks whether a player is a mage
scoreboard objectives add isMage dummy

# Storage for data about mages and their spellcasting state
execute unless data storage questcraft:mage_data mages run data merge storage questcraft:mage_data {mages:[]}

# Tracks what ID the next mage will have
scoreboard objectives add nextMageId dummy
scoreboard players set _globals nextMageId 0

# Tracks the ID for each individual mage
scoreboard objectives add mageId dummy

# Mage-specific stats
scoreboard objectives add mageLevel dummy
scoreboard objectives add spellBufferSize dummy

# Spellcasting constants
scoreboard objectives add spellCastingMaxCharge dummy
scoreboard players set _globals spellCastingMaxCharge 20

# Variables for spellcasting
scoreboard objectives add vigor_aspect.charge dummy
scoreboard objectives add vigor_aspect.maxCharge dummy
scoreboard objectives add blood_aspect.charge dummy
scoreboard objectives add blood_aspect.maxCharge dummy
scoreboard objectives add soul_aspect.charge dummy
scoreboard objectives add soul_aspect.maxCharge dummy
scoreboard objectives add void_aspect.charge dummy
scoreboard objectives add void_aspect.maxCharge dummy

# ==== Pathfinder ==== #

# ==== Templar ==== #