// camera position
cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);

cam_x = oPlayer.x - cam_width/2;
cam_y = oPlayer.y - cam_height/2;

// shake
shake_pow = 1;
shake = false;
shake_timer = 0;
shake_frames = 6;
