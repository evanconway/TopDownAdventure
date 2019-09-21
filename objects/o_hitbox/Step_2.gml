/// @description Delete If Attack Undefined

if (target_ins == undefined && target_obj == undefined) {
	instance_destroy(id);
	show_debug_message("Deleting Hitbox ID: " + string(id) + " with no target");
}

var _frametotal = 0;
for (var i = 0; i < ds_list_size(sprite_frames); i++) {
	_frametotal += sprite_frames[|i];
}

if (frame >= _frametotal && frame >= active) instance_destroy(id);