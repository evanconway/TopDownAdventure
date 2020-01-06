/// @description Read Me
/*
In our last project, we created text boxes that were far too complicated for what we needed. Although 
most modern games with text for dialogue allow all kinds of cool things like word highlighting, 
special effects on certain words, and all kinds of stuff, we're going to keep it simple for this 
project. Dialogue boxes can type out text, chirp a tone for each character, and... well actually that's
it. We're not going to bother with different colors or different fonts mid sentence. The dialogue box
will get a single font for everything. Also... I think we're going to make dialogue boxes one size. 
None of this automatic resizing crap.  I do, however, want to add portraits into dialogues. I really 
like how much they can add to the experience of the game. We just need to be careful that we don't
rip off of undertale too much ;)
*/

/*
Dialogue boxes don't actually hold a string, they hold a list of strings. These strings are already
pre-line wrapped for us. We set text for dialogue boxes by calling the "set_text" script. See that
script to see how we're handling line wrapping. 
*/
lines = ds_list_create();

/*
Ok, we're revisiting these dialogue objects after some time away, and the current code isn't going 
to work, so we're redoing it. The fundamental design, however, is sound. We're still using the 
set text script. We need more control over what the box is doing, and access to more information
about the box at any given time. We're going to use enum, states, and a series of scripts to 
accomplish this.
Also, we should redo how the typing and chirping works. Currently we wait a certain number of frames
before advancing the cursor one position and making the chirp noise. Well, even at the fastest setting
(1 cursor advancement per frame), the typing is still fairly slow. And the chirping sounds like a 
machine gun. So we're going to do it differently. The cursor will still advance after a certain number 
of frames, but we will allow the value to be non-integer values, and we'll round correctly at draw time.
We're not going to worry about different speeds for different characters. We'll call that a stretch 
goal. 
*/

enum DIALOGUE {
	OFF,
	OPENING,
	TYPING,
	STATIC,
	CLOSING
}
state = DIALOGUE.OFF;

/*
Our dialogue boxes "open" before typing text. The expand_rate determines how fast the box opens and
closes.
*/
width = 100;
height = 50;
width_cur = 0;
height_cur = 0;
expand_rate = 4;


type_time_max = 5; // this is the number of frames between character types
type_time = 0;
type_cursor_adv = 2; // number of chars advanced per "type"

cursor_y = 0; // line in list
cursor_x = 0; // char in list, strings are 1 based index!!!!

text_offset = 3; // distance text is from border

font = f_arial;
chirp = snd_chirp_default;
