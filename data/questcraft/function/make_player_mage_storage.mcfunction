data modify storage questcraft:mage_data mages append value {}
$data modify storage questcraft:mage_data mages[$(mageId)] set value {spell:[]}

# Set up blood bond for their ID
$tag @s add blood_bonded_$(mageId)