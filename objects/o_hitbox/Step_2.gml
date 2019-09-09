/// @description Delete If Attack Undefined

if (attack == undefined) {
	instance_destroy(id);
	show_debug_message("Deleting Hitbox ID: " + string(id) + " with undefined attack");
}

if (attack != undefined && !instance_exists(attack)) {
	instance_destroy(id);
	show_debug_message("Deleting Hitbox ID: " + string(id) + " with attack that doesn't exist");
}