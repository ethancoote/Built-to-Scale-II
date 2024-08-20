draw_set_font(fnPixel);
draw_set_halign(fa_center);

draw_sprite_ext(sBack, 0, 240, 48, image_xscale*2, image_yscale*1.16, 0, c_white, 1);

draw_set_halign(fa_left);

draw_set_font(fnCourier);
depth = -200;
draw_text(124, 52, string(LLHighscoresTopFormatted()));
