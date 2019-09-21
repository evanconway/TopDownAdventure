/// @param sound
/// @param loop

if (argument[0] == undefined) return;

if (argument_count == 1) audio_play_sound(argument[0], 1, false);
else audio_play_sound(argument[0], 1, argument[1]);
