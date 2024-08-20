draw_set_font(fnPixel);
draw_set_halign(fa_center);

draw_sprite_ext(sBack, 0, 240, 48, image_xscale*2, image_yscale*1.16, 0, c_white, 1);

draw_set_halign(fa_left);

draw_set_font(fnCourier);
depth = -200;

array_names = string_split(string(LLHighscoresTopFormatted()), "\n");
var _len = array_length(array_names);
if _len > 7 {
	_len = 7;
}
var _inter = 20;
for (var _i = 0; _i < _len; _i++) {
	draw_text(124, 52 + (_inter*_i),array_names[_i] );
}

