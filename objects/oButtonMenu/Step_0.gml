var _inst;
_inst = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if _inst {
	sprite_index = sButtonBackHover;
	if device_mouse_check_button_pressed(0, mb_left) {
		audio_play_sound(click, 1, false);
		room_goto(MenuRoom);
	}
} else {
	sprite_index = sButtonBack;
}
