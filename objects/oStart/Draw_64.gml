draw_set_font(fnPixel2);
draw_set_halign(fa_center);
draw_set_alpha(1);

draw_sprite_ext(sBack, 0, 240, 48, image_xscale*2, image_yscale*1.16, 0, c_white, 1);
draw_text_color(240, 64, "It's time for lunch...", c_white, c_white, #f1f1f1, #f1f1f1, 1);
draw_text_color(240, 96, "Susan (from HR) stole my  ", c_white, c_white, #f1f1f1, #f1f1f1, 1);
draw_text_color(240, 112, "sandwich from the fridge...", c_white, c_white, #f1f1f1, #f1f1f1, 1);
draw_text_color(240, 144, "I'm so hungry I would", c_white, c_white, #f1f1f1, #f1f1f1, 1);
draw_text_color(240, 160, "eat literally anything...", c_white, c_white, #f1f1f1, #f1f1f1, 1);

draw_set_font(fnPixel);
draw_text_color(240, 194, "PLAY", c_white, c_white, #f1f1f1, #f1f1f1, 1);