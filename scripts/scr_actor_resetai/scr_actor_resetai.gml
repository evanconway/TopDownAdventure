/// @param actor
function scr_actor_resetai() {

	with (argument[0]) {
		instance_destroy(ai);
		ai = scr_actor_createai(ai_default);
	}


}
