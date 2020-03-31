/// @param sound
/// @param loop

/*
Quick explanation of how sound volumes work in game maker. The only way to play a sound is to
call the audio_play_sound script. This script returns an id to a newly created sound object. 
To change the volume of this sound, you then have to call audio_sound_gain to set the gain 
of the newly created sound object. To set the gain, we are actually calling audio_sound_get_gain
first. This gets us the volume that we set the sound to manually in the game maker editor. We 
multiply this value by the sound volume (which is always between 0 and 1), to get the actual
volume we should play the sound at. This system lets us control sfx balance by setting their 
values in the game maker editor.
*/

if (argument[0] == undefined) return undefined;

var _id = undefined;

audio_stop_sound(argument[0]); // stops multiple versions of sound playing over eachother

if (argument_count == 1) _id = audio_play_sound(argument[0], 1, false);
else _id = audio_play_sound(argument[0], 1, argument[1]);

audio_sound_gain(_id, audio_sound_get_gain(_id) * o_sound.volume_sfx / 10, 0);

return _id;
