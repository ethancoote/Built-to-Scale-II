draw_set_font(fnPixel);
draw_set_halign(fa_center);
draw_set_alpha(1);

draw_text_color(240, 124, "PLAY", c_white, c_white, #f1f1f1, #f1f1f1, 1);

draw_text_color(240, 174, "LEADERBOARD", c_white, c_white, #f1f1f1, #f1f1f1, 1);

var _sine = sin((current_time/ 1000) *2 *pi / 2) * 3;
draw_sprite_ext(sSandwich, 0, 240, 100 + _sine, image_xscale*2, image_yscale*2, 0, c_white, 1);
draw_sprite_ext(sStole, 0, 115, 40 + _sine, image_xscale, image_yscale, 0, c_white, 1);
//draw_set_halign(fa_left);
//draw_text_color(125, 40 + _sine, "SUSAN STOLE MY", c_gray, c_gray, c_black, c_black, 1);