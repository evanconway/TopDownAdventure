/// @description 

/*
This object actually loops through and runs all objects that we would consider part
of the in-game "world". That's things like the player, actors, enemies, story/quest
objects or whatever. It's not stuff like menus. 
*/

global.actors_list = ds_list_create();
global.ai_active = true;
global.bboxes = false; // boolean, draw bboxes of game objects
global.bboxes_sprite_alpha = 0.3; // alpha of sprites when bboxes visible
global.playerdata = false; // boolean, draws data about player
global.player = undefined; // this is the ID of the actor that is the player character
global.spawn_room = room_test;
