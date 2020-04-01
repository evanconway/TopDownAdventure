/// @description 

// Inherit the parent event
event_inherited();
name = "Defend";

block_button = INPUT.MAP;

time_stun_max = 30;
time_stun = 0;
vel_x = 0;
vel_y = 0;

activate_snd = undefined;

shield_fx = undefined;
shield_fx_id = undefined;

hitboxes_blocked = ds_list_create();
