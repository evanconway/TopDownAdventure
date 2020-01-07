/// @description Update Actor

image_speed = 1;
	
// update ai (ai determines controller inputs)
with (ai) if (global.ai_active) event_user(0);
else with (ai.controller) resetcontroller();
	
/*
Although this code is fairly readable, it still can't hurt to leave an 
explanation of what's going on here. First the actor checks if it should
remain in it's current state. If it's can't, it iterates over all state
connections in the current state, to see if any of them are valid. The
first valid state runs its change code. This check and change are done
in the same script "scr_actor_changestate()". Finally, after the correct
state has been set (whether it's the same or a new one), the state run
code is executed. 
*/
if (!scr_state_remain(state)) {
	for (var i = 0; i < ds_list_size(state.connections); i++) {
		if (scr_actor_changestate(state.connections[|i])) {
			state = state.connections[|i];
			i = ds_list_size(state.connections);
		}
	}
}
scr_state_run(state);
