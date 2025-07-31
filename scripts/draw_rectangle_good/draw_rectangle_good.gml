function draw_rectangle_good(x1, y1, x2, y2){
	draw_sprite_ext(spr_rectangle, 0, x1, y1, (x2 - x1 + 1) / 3, (y2 - y1 + 1) / 3, 0, draw_get_color(), draw_get_alpha())
}
function draw_rectangle_good_big(x1, y1, x2, y2){
	draw_sprite_ext(spr_rectangle_big, 0, x1, y1, (x2 - x1 + 1) / 9, (y2 - y1 + 1) / 9, 0, draw_get_color(), draw_get_alpha())
}
