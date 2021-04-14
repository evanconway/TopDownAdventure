/// @param newfocus
function focus_set(argument0) {

	ds_stack_clear(global.focus);
	ds_stack_push(global.focus, argument0);



}
