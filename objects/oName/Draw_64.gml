draw_set_font(fnPixel);
draw_set_halign(fa_center);
draw_text_color(240, 80, "ENTER NAME:", c_white, c_white, c_white, c_white, 1);
if string_length(keyboard_string) > 15 {
	keyboard_string = string_copy(keyboard_string, 1, 15);
}

global.name = keyboard_string;

if keyboard_string != last_string {
	audio_play_sound(click, 1, false, 0.8, 0, rand);
}
last_string = keyboard_string;

draw_text_color(240, 105, keyboard_string, c_white, c_white, c_white, c_white, 1);
draw_set_halign(fa_left);
