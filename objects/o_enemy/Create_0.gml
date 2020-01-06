/// @description 

// Inherit the parent event
event_inherited();

enemy_state_hurt = scr_actor_createstate(o_state_hurt);
ds_list_add(always_check, enemy_state_hurt);

with (instance_create_depth(x, y, LAYER_ATTACKS, o_hitbox_enemy)) {
	actor = other;
	sprite_index = other.sprite_index;
}
