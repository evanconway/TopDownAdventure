/// @description 

// Inherit the parent event
event_inherited();

/*
Often, we will need information objects that are more complicated than simple
"press button get message". They need to be able to display more than one
message in the dialog, and display different ones each interaction. For that,
we will use these. The messages will be stored in a 2D list. The first index
is the series of messages to be displayed, the second index is the message
in that series. 
*/

dialogue = instance_create_depth(x, y, LAYER_DIALOGUES, o_dialogue);
convos = ds_list_create();
convos_set = false;

index_convo = 0; // which string of messages to show
index_message = 0; // the exact message to show
