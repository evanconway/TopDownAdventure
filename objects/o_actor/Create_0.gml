/// @description Read Me

/*
We should talk about non-integer x/y values. I don't fully understand how game maker 
works, but if the x/y values of actors are not integers, all kinds of problems start
showing up. I'm not sure how or when we're going to do rounding. One thing that 
"appears" to be true though is that it's much better to round x/y values to integers
before drawing them to the screen. Drawing anything that isn't an integer seems to 
just get messy. Let's try using our own x/y to keep track of movement, and game 
maker x/y will be set to the rounded values of our x/y where needed so the game
make x/y are always integers. We'll have the states themselves do this.
*/

// the true position of the actor is stored in these variables
act_x = x;
act_y = y;

if (ds_list_find_index(global.actors_list, id) < 0) ds_list_add(global.actors_list, id);

// list of states that are always checked. Beware, order added matters!
always_check = ds_list_create();
// This list is only needed by hurt and defend
act_hitboxes_struck = ds_list_create();

ai = undefined;
ai_default = o_ai; // ai switched to when resetting ai
state = undefined; // state actor is currently in/running

enum DIR {
	UP,
	DOWN,
	LEFT,
	RIGHT
}
actdirection = DIR.DOWN;

bbox_color = c_lime;
origin_color = c_fuchsia;

killed = false;

// set by hurt states after getting hit. 
invul_time = 0;
invul_time_max = 0; // leave 0 if you want actor to never be invulnerable

shader = undefined;

act_freezetime = 0;
