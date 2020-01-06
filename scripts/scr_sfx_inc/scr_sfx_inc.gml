// increase sfx volume by 0.1

o_sound.volume_sfx += o_sound.volume_inc;
o_sound.volume_sfx = clamp(o_sound.volume_sfx, o_sound.volume_min, o_sound.volume_max);
