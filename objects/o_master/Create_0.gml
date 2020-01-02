/// @description 

show_debug_message(" start next line");

// MACROS
#macro EVENT_LOGIC 0

#macro COLOR_DEBUG c_lime
#macro ATOZ "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

// ROOM LAYERS
#macro LAYER_MASTER "Master"
#macro LAYER_MENUS "Menus"
#macro LAYER_EFFECTS "Effects"
#macro LAYER_ACTORS "Actors"
#macro LAYER_ATTACKS "Attacks"
#macro LAYER_WALLS "Walls"

// these functions were in the last project, but I don't understand exactly what they do
//game_set_speed(60, gamespeed_fps);
//display_set_timing_method(tm_sleep);
//display_reset(0, true);

// I DO know what these do though...
window_set_cursor(cr_none);
randomize();

global.volume_sound = 1;

/*
NOTES
- The top room in the room list is the first room game maker runs,
even if that room is a parent room. 
- DO NOT put persistent objects in the master room, otherwise they
are re-created in every other room. Creating two instances of
a persistent object (of which there should only be one) causes
all kinds of weird problems.
- Most objects will only use User Event 0 instead of step event.
- See o_camera for notes on resolution and screen stuff.
*/

global.debug_active = true;

/*
To handle what object to update when, we have a object called the "focus".
There will be a number of objects with their logic stored in user_event0 
such as gameworld, the menus, etc. Whatever object is the "focus" of the 
program will be the object updated. This will allow us to stop things from
getting to confusing with menus, the gameworld, and whatever all trying
to listen for input. 
*/
global.focus = undefined; // this is the object updated each frame

gameworld = instance_create_depth(0, 0, 0, o_gameworld);
global.focus = gameworld;
pause_menu = undefined;