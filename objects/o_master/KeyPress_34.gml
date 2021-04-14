/// @description Previous Room

if (global.debug_active && room > room_first + 1) room_goto_previous();
// we add +1 because we don't want player going to init room
