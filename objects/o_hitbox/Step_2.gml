/// @description Delete If Attack Undefined

if (target_ins == undefined && target_obj == undefined) {
	instance_destroy(id);
	show_debug_message("Deleting Hitbox ID: " + string(id) + " with no target");
}

if (!permenant && frame >= scr_hitbox_frametotal() && frame >= active) instance_destroy(id);
