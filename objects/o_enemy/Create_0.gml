/// @description 

// Inherit the parent event
event_inherited();

enemy_state_hurt = scr_actor_createstate(o_state_hurt);
with (enemy_state_hurt) {
	time_hurt_max = 20;
	time_invul_max = 0;
	hurt_health = 3;
}
