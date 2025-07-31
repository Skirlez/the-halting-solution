draw_self()
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(font_medium)
draw_text(x, y - 10, $"HEAT GENERATED\n{heat} kJ")

draw_cube(spr_infinity, x, y - 95, 28, global.frame / 250, global.frame / 900)