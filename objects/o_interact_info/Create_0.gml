/// @description 

// Inherit the parent event
event_inherited();

dialogue = instance_create_depth(x, y, LAYER_DIALOGUES, o_dialogue);
with (dialogue) dialogue_settext("I'm an interact info object!");
