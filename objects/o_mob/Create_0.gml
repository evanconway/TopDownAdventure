/// @description 

// Inherit the parent event
event_inherited();

ai_default = o_ai_wander
ai = scr_actor_createai(ai_default);

state = scr_actor_createstate(o_state_idle);
mob_state_idle = state;
with (mob_state_idle) {
	sprite_front = s_mob_front;
	sprite_back = s_mob_back;
	sprite_left = s_mob_left;
	sprite_right = s_mob_right;
}
mob_state_walk = scr_actor_createstate(o_state_walk);
with (mob_state_walk) {
	sprite_front = s_mob_front;
	sprite_back = s_mob_back;
	sprite_left = s_mob_left;
	sprite_right = s_mob_right;
	walkspeed = 0.7
}

scr_state_addconnect(mob_state_idle, mob_state_walk);
scr_state_addconnect(mob_state_walk, mob_state_idle);
