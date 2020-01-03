/// @description 

/*
This object actually loops through and runs all objects that we would consider part
of the in-game "world". That's things like the player, actors, enemies, story/quest
objects or whatever. It's not stuff like menus. 
*/

global.actors_list = ds_list_create();
global.actor_freezers = ds_list_create();
global.actors_freeze_time = 0;
global.ai_active = true;
global.bboxes = true; // boolean, draw bboxes of game objects
global.bboxes_sprite_alpha = 0.3; // alpha of sprites when bboxes visible
global.playerdata = true; // boolean, draws data about player
global.player = undefined; // this is the ID of the actor that is the player character
pause_menu = undefined;
