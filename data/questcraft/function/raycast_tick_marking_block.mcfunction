# --- Clean up from previous tick ---
# Clean up any block displays that weren't used last tick
kill @s[tag=!raycast_block_display_used]

# --- Setup for current tick ---
# Mark display entities as unused
tag @s remove raycast_block_display_used