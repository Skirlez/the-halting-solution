event_inherited();
color = global.game_state == game_states.idle ? c_white : c_grey;
image_blend = color;
do_lock_sound = global.game_state != game_states.idle