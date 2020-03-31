/// @description 

// Inherit the parent event
event_inherited();

draw_black_box = false; // literally only used for death scene
/*
We're not setting a default ai for the player because we don't want it doing 
anything if we cycle global.player to different actors.
*/
ai = scr_actor_createai(o_ai_polluser);
hurtbox = instance_create_depth(x, y, LAYER_ATTACKS, o_hurtbox_actor);
with (hurtbox) {
	mask_index = other.mask_index;
	actor = other;
	vulnerable = o_hitbox_enemy;
}
// starting state
player_state_idle = scr_actor_createstate(o_state_idle);
with (player_state_idle) {
	sprite_front = s_plr_idle_front;
	sprite_back = s_plr_idle_back;
	sprite_left = s_plr_idle_left;
	sprite_right = s_plr_idle_right;
}
state = player_state_idle;

// all other states
player_state_walk = scr_actor_createstate(o_state_walk);
with (player_state_walk) {
	sprite_front = s_plr_walk_front;
	sprite_back = s_plr_walk_back;
	sprite_left = s_plr_walk_left;
	sprite_right = s_plr_walk_right;
	walkspeed = 1.3;
}
player_state_attack = scr_actor_createstate(o_state_cast);
with (player_state_attack) {
	hitbox = o_hitbox_magicmissle;
	var _atktime = 12; // note: this is frame time for the attack, not the hitbox
	startup = _atktime;
	active = _atktime;
	endlag = _atktime;
	sprite_front = s_plr_cast_front;
	sprite_back = s_plr_cast_back;
	sprite_left = s_plr_cast_left;
	sprite_right = s_plr_cast_right;
}
player_state_defend = scr_actor_createstate(o_state_defend);
with (player_state_defend) {
	block_button = INPUT.MAP;
	block_sprite = s_plr_defend;
	block_stun_sprite = s_plr_defend_stun;
	block_barrier_fx = o_fx_magicbarrier;
}
player_state_dodge = scr_actor_createstate(o_state_dodge_smooth);
with (player_state_dodge) {
	dodge_speed = 1.2;
	dodge_fx_vanish = o_fx_robevanish;
	//dodge_fx_appear = o_fx_whiteexplode;
	dodge_fx_move = o_fx_magicpoof;
	dodge_snd = snd_wobble5;
	// bufferable buttons
	ds_list_add(dodge_buffer_buttons, INPUT.ATTACK);
	ds_list_add(dodge_buffer_buttons, INPUT.MAP);
}
player_state_hurt = scr_actor_createstate(o_state_hurt);
with (player_state_hurt) {
	time_hurt_max = 20;
	hurt_health = 3;
	sprite_front = s_plr_hurt_front;
	sprite_back = s_plr_hurt_back;
	sprite_left = s_plr_hurt_left;
	sprite_right = s_plr_hurt_right;
}

scr_state_addconnect(player_state_idle, player_state_attack);
scr_state_addconnect(player_state_idle, player_state_defend);
scr_state_addconnect(player_state_idle, player_state_dodge);
scr_state_addconnect(player_state_idle, player_state_walk);

scr_state_addconnect(player_state_walk, player_state_attack);
scr_state_addconnect(player_state_walk, player_state_defend);
scr_state_addconnect(player_state_walk, player_state_dodge);
scr_state_addconnect(player_state_walk, player_state_idle);

scr_state_addconnect(player_state_attack, player_state_walk);
scr_state_addconnect(player_state_attack, player_state_dodge);
scr_state_addconnect(player_state_attack, player_state_idle);

scr_state_addconnect(player_state_defend, player_state_walk);
scr_state_addconnect(player_state_defend, player_state_dodge);
scr_state_addconnect(player_state_defend, player_state_idle);

scr_state_addconnect(player_state_dodge, player_state_attack);
scr_state_addconnect(player_state_dodge, player_state_defend);
scr_state_addconnect(player_state_dodge, player_state_walk);
scr_state_addconnect(player_state_dodge, player_state_idle);

scr_state_addconnect(player_state_hurt, player_state_walk);
scr_state_addconnect(player_state_hurt, player_state_idle);

/*
player_state_attack.unlocked = false;
player_state_defend.unlocked = false;
player_state_dodge.unlocked = false;
*/
