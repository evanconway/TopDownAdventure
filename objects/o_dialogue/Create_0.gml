/// @description Read Me
/*
In our last project, we created text boxes that were far too complicated for what we needed. Although 
most modern games with text for dialogue allow all kinds of cool things like word highlighting, 
special effects on certain words, and all kinds of stuff, we're going to keep it simple for this 
project. Dialogue boxes can type out text, chirp a tone for each character, and... well actually that's
it. We're not going to bother with different colors or different fonts mid sentence. The dialogue box
will get a single font for everything. Also... I think we're going to make dialogue boxes one size. 
None of this automatic resizing crap.  I do, however, want to add portraits into dialogue. I really 
like how much they can add to the experience of the game. We just need to be careful that we don't
rip off of undertale too much ;)
*/

/*
Dialogue boxes don't actually hold a string, they hold a list of strings. These strings are already
pre-line wrapped for us. We set text for dialogue boxes by calling the "set_text" script. See that
script to see how we're handling line wrapping. 
*/
lines = ds_list_create();

width = 100;
height = 80;

active = false;

type_time_max = 5; // this is the number of frames between character types
type_time = 0;

y_cursor = 0; // line in list
x_cursor = 1; // char in list, strings are 1 based index!!!!

text_offset = 3;

font = f_arial;
