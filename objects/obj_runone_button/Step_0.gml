event_inherited();
usable = global.paused ? true : false;
color = usable ? c_white : c_grey;
image_blend = color;
do_lock_sound = !usable;