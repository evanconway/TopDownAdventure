/// @function scr_state_addconnect(state_getting_connection, state)
/// @description adds state to connection list of a state
/// @param {o_state} state getting new connection
/// @param {o_state} state added to connection list
function scr_state_addconnect() {

	ds_list_add(argument[0].connections, argument[1]);



}
