/// @param actor
function scr_actor_setplayer() {

	with (argument[0]) {
		instance_destroy(ai);
		ai = scr_actor_createai(o_ai_polluser);
	}



}
