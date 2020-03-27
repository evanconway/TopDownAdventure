/// @description 

door_start = undefined;
door_end = undefined;
room_start = undefined;
room_end = undefined;

cur_alpha = 0;
cur_time = 0;
time_max = 5;
alpha_max = 1; // we're using this to lengthen time of black screen
alpha_change = 0.1;

room_prev = undefined;

/*
We make the player object persistent so that we can easily transition between 
rooms and keep player data the same. 
*/
global.player.persistent = true;
player_o_type = global.player.object_index;
