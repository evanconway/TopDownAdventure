// this script includes shaders and other things needed when drawing the actor

if (shader != undefined) shader_set(shader);
image_alpha = 1;
if (invul_time > 0 && focus_cur() == global.gameworld) image_alpha = global.invul_alpha;
/* 
we check if the state_act_alpha != 1 because we only want to over write the invulerability
fade when a state is trying to do something.
*/
if (state != undefined && state.state_act_alpha != 1) image_alpha = state.state_act_alpha;
draw_self();
shader_reset();
