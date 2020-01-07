/// @description 

/*
We're trying an experiment here. Instead of attacks creating and 
deleting hitboxes, we're going to treat hitboxes like "spells". 
What I mean by that is the player "attack" animation is really more
of a "cast", and all the actual practical data about the attack is
stored in the hitbox. That includes sprite animation. So the only 
thing the actor actually determines is the orientation of the hitbox
relative to the actor. And when it appears.
*/

enum HITBOX {
	POSITION,
	PROJECTILE
}

type = HITBOX.POSITION;

target_ins = undefined;
target_obj = undefined;

knockback = 1;
delete_on_hit = false; // hurt state checks this
marked_for_deletion = false; // hurt state sets this
permenant = false; // ignores frame data and remains forever
actor = undefined; // the actor "wielding" this hitbox
invisible = false; // needed for enemy body hitboxes

// snd vars are actually lists so we can have random sounds
hit_snd = ds_list_create();
ds_list_set(hit_snd, 0, snd_hit2);
ds_list_set(hit_snd, 1, snd_hit3);
//ds_list_set(hit_snd, 2, snd_hit1); // I hate this sound lol

miss_snd = ds_list_create();
ds_list_set(miss_snd, 0, snd_miss1);
ds_list_set(miss_snd, 1, snd_miss2);
ds_list_set(miss_snd, 2, snd_miss3);

// projectile variables
hitbox_x = x;
hitbox_y = y;
xvel = 0;
yvel = 0;

hitbox_fx = o_fx_smack;
freeze_frames = 10;
active = 10; // frames this hitbox can hurt something. 

/*
These next few variables need some explaining. We're going to manually
animate hitboxes. This will give us much greater control over how
long each frame is visible. To do this, we have a list called
"hitbox_frames". This list will contain the number of frames we want
each sub image in the hitbox sprite to be visible. We use the 
image_index of the hitbox as the index. 

As an example. Let's say we had a 3 frame animation (sprite) for the hitbox,
and we wanted the first sub_image to last 3 frames, the second to last 6, 
and the third to last 9. These are the calls we'd make to do that:
ds_list_add(hitbox_frames, 3);
ds_list_add(hitbox_frames, 6);
ds_list_add(hitbox_frames, 9);
Use add instead of set because the code uses the size of the list to 
determine if the animation is over, not the subimage count of the sprite.
This lets us be lazier with our sprites. 
*/
hitbox_frames = ds_list_create(); // image_index is used as index for values 
/*
In our logic, we will use frame_count to keep track of how many frames
we've displayed a sub_image. 
*/
frame_count = 0;


// this must be called from individual hitboxes, otherwise ALL 
// hitboxes play these miss sounds
//scr_play_sfx_rndm(miss_snd)
