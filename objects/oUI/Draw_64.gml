// drawing rectangle
draw_set_font(fnPixel);
draw_set_alpha(0.6);
draw_set_halign(fa_center);
//draw_rectangle_color(170, 22, 310, 52, c_gray, c_gray, c_black, c_black,  false);
draw_set_alpha(1);


draw_text_color(240, 0, string_format(round(oControl.weight*10)/10, 1, 1) + " KG", c_white, c_white, #f1f1f1, #f1f1f1, 1);





