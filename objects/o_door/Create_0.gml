/// @description 

// Inherit the parent event
event_inherited();

/*
These variables must be set in the creation code of the room the 
door is placed in, otherwise it won't work!
*/

target_door = undefined;
target_room = undefined;

exit_x = undefined;
exit_y = undefined;

// for direction actor should face when exiting
door_dir = undefined;
