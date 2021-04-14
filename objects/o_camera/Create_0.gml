/// @description GameMaker Camera Explained

showdims = false;
#macro VIEW_CAMERA view_camera[0]

/*
It is critical to understand that this camera object is NOT the Game Maker 
camera. Changing the position of this object does not change the position
of the Game Maker camera! Watch this video for a brief overview:
https://www.youtube.com/watch?v=_g1LQ6aIJFk
Here are the most important functions to remember:

window_set_size() - sets the size of the application window
surface_resize() - sets resolution of game
set_view_size() - sets area of room shown on camera
set_view_pos() - sets position of camera in room

We need to explain how these functions/values all interact with one another.

Firstly, the window_set_size() function determines the dimensions of the
application window. When the application is set to fullscreen, anything
that window_set_size() trys to overwrite is ignored. I'm pretty sure full 
size just locks the dimensions of your window to the native resolution of 
the computer monitor.

Now surface_resize() is the thing that totally threw us off last time. It
scales, not stretches, scales to the window size. This means that if the
window has dimensions of 16:9, and the surface has dimensions of 4:3, then
you will get a 4:3 game with black bars on the side inside of the 16:9 
window.

Finally, the view is STRETCHED to the surface. This is an important 
difference. If the view has 4:3 dimensions, and the surface has 16:9,
then the 4:3 view will get stretched and distorted into a 16:9 picture.

If we want pixel perfection, then the view must have the EXACT same ratio
as the surface to avoid stretching, and the dimensions of the window
must be an integer multiplication of the surface.
*/

/*
With all of that said, we're going to try something kind of weird for this 
game. Instead of picking a resolution, we're going to set multipliers for
a starting screen ratio. Given our understanding of screens (outlined
above), the view and resolution will be identical, and the window
will be an integer multiplication of those dimensions.
*/

/*
I'm expecting we'll use 16:9 for our game ratio, however, should we decide
to try 4:3, we have to use the values 12:9. This is because it keeps the
values similar to 16:9 when multiplied by the same multipliers. 
*/
#macro SCREEN_RATIO_WIDTH 16
#macro SCREEN_RATIO_HEIGHT 9

// multipliers (m short of multiplier for all these variables)
/*
Our screen ratio values are multiplied by these multipliers to create the
dimensions of the resolution, view, and window. There are also many places
in our code that will change these multipliers, so we're going to establish
min and max values for these multipliers so that things never get too far out of hand. 
*/
m_min = 20;
m_max = 120;

/*
If we're going with a 16:9 res, I feel 320x180 looks really good. The pixels
are huge (which I love), but it's juuuuuust barely detailed enough to have
some creative freedom. So to do this, we have to multiply our starting ratio
values by 20. The only thing that will ever change the resolution of the game
is changing the aspect ratio in the settings. 
*/
m_resolution = 20;
#macro RESOLUTION_W o_camera.m_resolution * SCREEN_RATIO_WIDTH
#macro RESOLUTION_H o_camera.m_resolution * SCREEN_RATIO_HEIGHT

/*
The view is the dimensions of the game world drawn to the surface. Recall that
the view is STRETCHED to the dimensions of the surface. So, if we want pixel
perfection, the view must be the exact same dimensions as the resolution. And
if we want to play around with the view, like zoom in on something, the ratio
of the view dimensions must be identical. For starters, we will use the same
multiplier as the resolution
*/
m_view = m_resolution;
#macro VIEW_W o_camera.m_view * SCREEN_RATIO_WIDTH
#macro VIEW_H o_camera.m_view * SCREEN_RATIO_HEIGHT

/*
By our desgin, the window will only ever be a multiplication of the game
resolultion. By having a game resolution of 320x180, we can easily get
common resolutions like 720p and 1080p by multiplying the game res by 4
and 6 respectively. 
*/
m_window = 4;
#macro WINDOW_W o_camera.m_window * RESOLUTION_W
#macro WINDOW_H o_camera.m_window * RESOLUTION_H

window_set_size(WINDOW_W, WINDOW_H);
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
display_reset(0, true);

enum CAMFOLLOW {
	RIGID,
	BOUNDS
}

follow_type = CAMFOLLOW.BOUNDS;
var _bound_m = 10;
follow_bound_x = RESOLUTION_W/_bound_m; // distance from view position
follow_bound_y = RESOLUTION_H/_bound_m;
