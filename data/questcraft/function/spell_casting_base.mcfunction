# Attempt to cast a spell based on the spell buffer
$data modify storage questcraft:args spell set from storage questcraft:mage_data mages[$(mageId)].spell
$data modify storage questcraft:args mageId set value $(mageId)
function questcraft:spell_casting_select with storage questcraft:args