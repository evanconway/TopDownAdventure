/// @description 

// Inherit the parent event
event_inherited();
name = "Defend";
unlocked = false;
block_button = INPUT.MAP;

sprite_block = s_plr_defend;
sprite_stun = s_plr_defend_stun;

time_stun_max = 30;
time_stun = 0;
vel_x = 0;
vel_y = 0;
vel_hurt_scalar = 1.3; // hurt knockback velocity scalar
activate_snd = undefined;
block_snd = undefined;
shield_fx = undefined;
shield_fx_id = undefined;

hitboxes_blocked = ds_list_create();
