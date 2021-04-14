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
global.wallsvisible = false;
global.hitfreezeframes = 15;
global.invul_alpha = 0.5; // see actor_drawself
firstroom = room_cave;
global.spawn_room = firstroom;


// We use this enum and map to keep track of what abilities the player has unlocked
// These values are read by the player object when created, and changed by the game world
enum PLR_UNLOCKS {
	ATTACK,
	DEFEND,
	DODGE
}
global.player_stats = ds_map_create();
ds_map_add(global.player_stats, PLR_UNLOCKS.ATTACK, false);
ds_map_add(global.player_stats, PLR_UNLOCKS.DEFEND, false);
ds_map_add(global.player_stats, PLR_UNLOCKS.DODGE, false);
