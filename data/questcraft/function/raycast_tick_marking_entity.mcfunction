# --- Clean up from previous tick ---
# Remove glow on any entities that weren't marked last tick
effect clear @s[tag=!raycast_targetted_entity_marked] minecraft:glowing
tag @s[tag=!raycast_targetted_entity_marked] remove raycast_targetted_entity

# Add glow to entities that were marked last tick
effect give @s[tag=raycast_targetted_entity_marked] minecraft:glowing 1 0 true

# --- Setup for current tick ---
# Unmark all entities
tag @s[tag=raycast_targetted_entity_marked] remove raycast_targetted_entity_marked