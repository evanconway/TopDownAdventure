/// @description 

show_debug_message(" start next line");

// MACROS
#macro EVENT_LOGIC 0

#macro COLOR_DEBUG c_lime
#macro ATOZ "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

// ROOM LAYERS
#macro LAYER_MASTER "Master"
#macro LAYER_MENUS "Menus"
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
Most objects will need to update in a specific order, we handle that
by creating different lists of objects and updating them when we need
to. The objects do not have step events, but instead have User Events
that we can call manually from this master object.
*/
global.actors_list = ds_list_create();
global.actors_freeze = false;
global.actors_freeze_time = 0;
global.ai_active = true;
global.bboxes = true; // boolean, draw bboxes of game objects
global.bboxes_sprite_alpha = 0.3; // alpha of sprites when bboxes visible
global.playerdata = true; // boolean, draws data about player
global.player = undefined; // this is the ID of the actor that is the player character
