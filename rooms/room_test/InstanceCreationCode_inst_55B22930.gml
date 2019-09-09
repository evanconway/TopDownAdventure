target_obj = o_player;

with (instance_create_layer(x, y, LAYER_ACTORS, o_hitbox)) {
	attack = other;
	image_xscale = 40;
	image_yscale = 30;
	permenant = true;
}