/// @description READ ME

/*
The controls menu displays all actions the game recognizes and the inputs
assigned to them. The choices in the menu are choice_menu objects that 
open a "enter new input" menu when selected. Once opened, the next button
or key pressed will be remapped to the chosen action. The way this happens 
is first, the choice of the newbutton menu runs its logic to detect what
button/key was pressed. Pressing a button defines the "newbutton" variable
in the newbutton choice. Next, the newbutton menu checks to see if the choices
"new button" variable is no longer undefined, and if it's defined, sets its own
"new button" variable to the same value, and pops its focus. Finally the
choice of the control menu which started this whole process checks to see
if the submenu "new button" variable has been defined. If it has, the choice
runs logic to remap the new button to the action. 
*/

// Inherit the parent event
event_inherited();
menu_font = f_menu2_small;
title = "Controls";
menu_color = c_green;

var i = 0;
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Up";
	submenu.title = name;
	button = INPUT.UP;
	submenu.button = button;
	submenu.choices[|0].button = button;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Down";
	submenu.title = name;
	button = INPUT.DOWN;
	submenu.button = button;
	submenu.choices[|0].button = button;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Left";
	submenu.title = name;
	button = INPUT.LEFT;
	submenu.button = button;
	submenu.choices[|0].button = button;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Right";
	submenu.title = name;
	button = INPUT.RIGHT;
	submenu.button = button;
	submenu.choices[|0].button = button;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Interact";
	submenu.title = name;
	button = INPUT.INTERACT;
	submenu.button = button;
	submenu.choices[|0].button = button;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Attack";
	submenu.title = name;
	button = INPUT.ATTACK;
	submenu.button = button;
	submenu.choices[|0].button = button;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Action 1";
	submenu.title = name;
	button = INPUT.BACK;
	submenu.button = button;
	submenu.choices[|0].button = button;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Action 2";
	submenu.title = name;
	button = INPUT.MAP;
	submenu.button = button;
	submenu.choices[|0].button = button;
}
ds_list_set(choices, i, menu_createchoice(o_choice_back));
