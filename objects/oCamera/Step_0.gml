cam_x = oPlayer.x - cam_width/2;
cam_y = oPlayer.y - cam_height/2;

// camera shake
if shake {
	shake_timer = shake_frames;
	shake = false;
}

if shake_timer > 0 {
	shake_timer--;
	cam_x += random_range(-shake_pow, shake_pow);
	cam_y += random_range(-shake_pow, shake_pow);
}

camera_set_view_pos(view_camera[0], cam_x, cam_y);

