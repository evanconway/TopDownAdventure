/// @description 

// Inherit the parent event
event_inherited();
name = "Defend";

blocking = undefined; // the hitbox type to defend against
block_button = INPUT.MAP;

block_stuntime = 0; // we set this based on damage and hitstun of move
velx = 0;
vely = 0;

block_fx = o_fx_smack_blue;
block_snd = snd_bonk;
block_snd_activate = undefined;

block_sprite = undefined;
block_stun_sprite = undefined;

block_barrier_fx = undefined;
block_barrier_fx_id = undefined;

hitboxes_blocked = ds_list_create();
