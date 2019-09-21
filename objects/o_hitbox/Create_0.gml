/// @description 

enum HITBOX {
	POSITION,
	PROJECTILE
}

type = HITBOX.POSITION;

target_ins = undefined;
target_obj = undefined;

knockback = 1;
actor = undefined;

// snd vars are actually lists so we can have random sounds
hit_snd = ds_list_create();
ds_list_set(hit_snd, 0, snd_hit1);
ds_list_set(hit_snd, 1, snd_hit2);
ds_list_set(hit_snd, 2, snd_hit3);
miss_snd = ds_list_create();
ds_list_set(miss_snd, 0, snd_miss1);
ds_list_set(miss_snd, 1, snd_miss2);
ds_list_set(miss_snd, 2, snd_miss3);


// projectile variables
hitbox_x = x;
hitbox_y = y;
xvel = 0;
yvel = 0;

hitbox_fx = undefined;
freeze_frames = 10;

/*
We're trying an experiment here. Instead of attacks creating and 
deleting hitboxes, we're going to treat hitboxes like "spells". 
What I mean by that is the player "attack" animation is really more
of a "cast", and all the actual practical data about the attack is
stored in the hitbox. That includes sprite animation. So the only 
thing the actor actually determines is the orientation of the hitbox
relative to the actor. And when it appears.
*/


frame = 0; // keep track of frames this hitbox has existed.
active = 10; // frames this hitbox can hurt something. 
/*
This next variable, sprite_frames, needs some explaining. We're going
to manually animate hitbox sprites. In this list, we're going to 
store the number of frames each image_index should exist. For 
example, let's say we image_index0 to last 2 frames. So we'd do:
ds_list_set(sprite_frames, 0, 2)
Our logic event will only increment the image_index once the frame
counter is greater than the list value for the current image_index.
These lists will have to be setup manually for each hitbox. 
*/
frames_counted = 0; // incremented by frame value of sprite_frames
sprite_frames = ds_list_create(); // we'll use the image_index as 

scr_play_sfx_rndm(miss_snd)
