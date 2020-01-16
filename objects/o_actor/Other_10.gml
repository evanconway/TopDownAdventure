/// @description Update Actor

if (act_freezetime-- > 0) {
	image_speed = 0;
	exit;
} else image_speed = 1;

if (invul_time > 0) invul_time--;

// update ai (ai determines controller inputs)
with (ai) if (global.ai_active) event_user(0);
else with (ai.controller) resetcontroller();

// delete hitboxes from struck list if they no longer exist in the game world
for (var i = 0; i < ds_list_size(act_hitboxes_struck); i++) {
	if (!instance_exists(act_hitboxes_struck[|i])) ds_list_delete(act_hitboxes_struck, i--);
}
	
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

/*
There are some states we want to update at a different time, or do something different
with. The first notable example of this is the defend state. We only update the actor
state if it is not one of these special cases.
*/
var _special_case_state = false;
if (state.object_index == o_state_defend) _special_case_state = true;
if (!_special_case_state) scr_state_run(state);

// reset pressed values
/*
we should probably be calling this stuff in the ai? I'm sure there's a
cleaner way to do it, but we'll worry about it for the next project.
*/
with (ai.controller) event_user(EVENT_LOGICEND);
