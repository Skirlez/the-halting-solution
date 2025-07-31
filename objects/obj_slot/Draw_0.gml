draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if global.memory[slot] < 100
	draw_set_font(font_medium)
else
	draw_set_font(font_small)
draw_text(x, y, global.memory[slot])