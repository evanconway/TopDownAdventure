/// @description 

// Inherit the parent event
event_inherited();

/*
We're not setting a default ai for the player because we don't want it doing 
anything if we cycle global.player to different actors.
*/
ai = scr_actor_createai(o_ai_polluser);

state = scr_actor_createstate(o_state_idle);

player_state_idle = state;
with (player_state_idle) {
	sprite_front = s_plr_idle_front;
	sprite_back = s_plr_idle_back;
	sprite_left = s_plr_idle_left;
	sprite_right = s_plr_idle_right;
}
player_state_walk = scr_actor_createstate(o_state_walk);
with (player_state_walk) {
	sprite_front = s_plr_walk_front;
	sprite_back = s_plr_walk_back;
	sprite_left = s_plr_walk_left;
	sprite_right = s_plr_walk_right;
	walkspeed = 1.3;
}
player_state_hurt = scr_actor_createstate(o_state_hurt);
ds_list_add(always_check, player_state_hurt);

scr_state_addconnect(player_state_idle, player_state_walk);
scr_state_addconnect(player_state_walk, player_state_idle);

scr_state_addconnect(player_state_hurt, player_state_idle);
scr_state_addconnect(player_state_hurt, player_state_walk);
