/// @description 

// Inherit the parent event
event_inherited();

/*
These variables must be set in the creation code of the room the 
door is placed in, otherwise it won't work!
*/

target_door = undefined;
target_room = undefined;

exit_x = x + sprite_width/2;
exit_y = y + sprite_height; // magic number lol
