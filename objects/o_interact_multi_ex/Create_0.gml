/// @description 

// Inherit the parent event
event_inherited();

//This object is an example of how to add text to an interact_multi

var _t = ds_list_create();
ds_list_add(_t, "Hello!");
ds_list_add(_t, "I'm an example interact multi.");
ds_list_add(_t, "Try talking to me again.");
ds_list_add(convos, _t);
_t = ds_list_create();
ds_list_add(_t, "You see?");
ds_list_add(_t, "I can say a lot of different things.");
ds_list_add(_t, "Try talking to me one more time.");
ds_list_add(convos, _t);
_t = ds_list_create();
ds_list_add(_t, "This is my final convo.");
ds_list_add(_t, "I won't say anything more than this.");
ds_list_add(convos, _t);
