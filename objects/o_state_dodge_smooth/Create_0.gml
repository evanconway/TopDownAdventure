/// @description 

// Inherit the parent event
event_inherited();

name = "Dodge";
invulnerable = true;

/* Defined in dodge rigid
enum DODGE {
	ACTIVE,
	DONE,
}
*/

stage = DODGE.ACTIVE;

dodge_speed = 2;
velx_prev = 0;
vely_prev = 0;
dodge_time = 0;
dodge_time_max = 35;
dodge_cooldown = 0;
dodge_cooldown_max = 20;

dodge_fx_vanish = undefined;
dodge_fx_appear = undefined;
dodge_snd = undefined;

effect_time = 0;
effect_time_max = 7;
dodge_fx_move = undefined;

/*
Often we want to perform an action immediately after finishing a dodge. However,
the natural design of the game means you must wait until after dodge has finished,
or the input simply won't register. Although our code is solid, this does not 
feel good. So, we're giving dodge the ability to "log" specific button presses.
When the dodge is finished, the actors ai controller will have these buttons
set to pressed, so that any states that may want them will have frame perfect
presses when the dodge exits. 
*/
dodge_buffer_buttons = ds_list_create(); // values are button enums
dodge_buffer_pressed = ds_list_create(); // values are bools (pressed or not)
/*
This is annoying, but we'll have to remember that the values in the index
are tied together. when referring to the button enum at index 0 of buttons,
the pressed value is index 0 of pressed.
*/
