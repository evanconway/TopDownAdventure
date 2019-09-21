/// @param sound_list

var _size = ds_list_size(argument[0]);
var _choice = irandom_range(0, _size - 1);
var _sound = ds_list_find_value(argument[0], _choice);
if (_sound != undefined) audio_play_sound(_sound, 1, false);
