/// @description 
/*
Choice objects are what actually execute menu code. We've decided to do this 
so that we can easily add different options to a menu.
*/

name = "Undefined Option";

menu = undefined; // the menu object that uses this choice


enum MENU_CHOICE_TYPE {
	TOGGLE,
	DIAL,
	INPUT_SETTING
}

type = MENU_CHOICE_TYPE.TOGGLE;
