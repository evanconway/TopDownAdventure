/// @description Update Actor

if (!global.actors_freeze && global.actors_freeze_time <= 0 && state != undefined) {
	image_speed = 1;
	
	// update ai (ai determines controller inputs)
	with (ai) if (global.ai_active) event_user(0);
	else with (ai.controller) resetcontroller();
	
	// check connections
	if (!scr_state_remain(state)) {
		for (var i = 0; i < ds_list_size(state.connections); i++) {
			if (scr_actor_changestate(state.connections[|i])) {
				state = state.connections[|i];
				i = ds_list_size(state.connections);
			}
		}
	}
	
	scr_state_run(state);
	
} else {
	image_speed = 0;
	if (global.actors_freeze_time > 0) global.actors_freeze_time--;
}
