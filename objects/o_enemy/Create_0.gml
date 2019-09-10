/// @description 

// Inherit the parent event
event_inherited();

enemy_state_hurt = scr_actor_createstate(o_state_hurt);
ds_list_add(always_check, enemy_state_hurt);
