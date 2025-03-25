# --- Clean up from previous tick ---
# Clean up any block displays that weren't used last tick
kill @e[type=block_display,tag=raycast_block_display,tag=!raycast_block_display_used]

# Remove glow on any entities that weren't marked last tick
effect clear @e[tag=raycast_targetted_entity,tag=!raycast_targetted_entity_marked] minecraft:glowing
tag @e[tag=raycast_targetted_entity,tag=!raycast_targetted_entity_marked] remove raycast_targetted_entity

# Add glow to entities that were marked last tick
effect give @e[tag=raycast_targetted_entity,tag=raycast_targetted_entity_marked] minecraft:glowing 1 0 true

# --- Setup for current tick ---
# Mark display entities as unused
tag @e[type=block_display,tag=raycast_block_display] remove raycast_block_display_used

# Unmark all entities
tag @e[tag=raycast_targetted_entity,tag=raycast_targetted_entity_marked] remove raycast_targetted_entity_marked