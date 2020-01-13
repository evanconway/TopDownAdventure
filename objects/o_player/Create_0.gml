/// @description 

// Inherit the parent event
event_inherited();

draw_black_box = false; // literally only used for death scene
invul_time_max = 60;
/*
We're not setting a default ai for the player because we don't want it doing 
anything if we cycle global.player to different actors.
*/
ai = scr_actor_createai(o_ai_polluser);

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
player_state_attack = scr_actor_createstate(o_state_attack);
with (player_state_attack) {
	target_obj = o_enemy;
	hitbox = o_hitbox_slash;
	var _atktime = 7; // note: this is frame time for the attack, not the hitbox
	startup = _atktime;
	active = _atktime;
	endlag = _atktime;
	sprite_front = s_plr_cast_front;
	sprite_back = s_plr_cast_back;
	sprite_left = s_plr_cast_left;
	sprite_right = s_plr_cast_right;
}
player_state_attack2 = scr_actor_createstate(o_state_attack);
with (player_state_attack2) {
	attack_button = INPUT.MAP;
	target_obj = o_enemy;
	hitbox = o_hitbox_fireball;
	var _atktime = 7; // note: this is frame time for the attack, not the hitbox
	startup = _atktime;
	active = _atktime;
	endlag = _atktime;
	sprite_front = s_plr_cast_front;
	sprite_back = s_plr_cast_back;
	sprite_left = s_plr_cast_left;
	sprite_right = s_plr_cast_right;
}
player_state_dodge = scr_actor_createstate(o_state_dodge_smooth);
with (player_state_dodge) {
	dodge_speed = 1.2;
	dodge_fx_vanish = o_fx_robevanish;
	dodge_snd = snd_wobble5;
}
player_state_hurt = scr_actor_createstate(o_state_hurt);
with (player_state_hurt) {
	death_snd = undefined;
	time_hurt_max = 10;
	hurt_health = 3;
	hurt_shader = sh_red;
	sprite_front = s_plr_hurt_front;
	sprite_back = s_plr_hurt_back;
	sprite_left = s_plr_hurt_left;
	sprite_right = s_plr_hurt_right;
}
ds_list_add(always_check, player_state_hurt);

scr_state_addconnect(player_state_idle, player_state_walk);
scr_state_addconnect(player_state_idle, player_state_attack);
scr_state_addconnect(player_state_idle, player_state_attack2);
scr_state_addconnect(player_state_idle, player_state_dodge);

scr_state_addconnect(player_state_walk, player_state_idle);
scr_state_addconnect(player_state_walk, player_state_attack);
scr_state_addconnect(player_state_walk, player_state_attack2);
scr_state_addconnect(player_state_walk, player_state_dodge);

scr_state_addconnect(player_state_attack, player_state_idle);
scr_state_addconnect(player_state_attack, player_state_walk);
scr_state_addconnect(player_state_attack, player_state_dodge);

scr_state_addconnect(player_state_attack2, player_state_idle);
scr_state_addconnect(player_state_attack2, player_state_walk);
scr_state_addconnect(player_state_attack2, player_state_dodge);

scr_state_addconnect(player_state_dodge, player_state_idle);
scr_state_addconnect(player_state_dodge, player_state_walk);
scr_state_addconnect(player_state_dodge, player_state_attack);
scr_state_addconnect(player_state_dodge, player_state_attack2);

scr_state_addconnect(player_state_hurt, player_state_idle);
scr_state_addconnect(player_state_hurt, player_state_walk);
