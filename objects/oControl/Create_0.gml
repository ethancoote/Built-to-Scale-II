window_set_fullscreen(true); // remove this
weight = 80; // chnage to 80
win = false;
level = 0; // change to 0
max_level = 2;
level_change_timer = 0;
level_change_frames = 60;
level_room = [Level1Room, Level2Room];
level_weight = [100, 240, 250, 350, 500];
timer = 300;
audio_play_sound(song1, 99, true, 0.6);

audio_listener_orientation(0, 0, 1000,0,-1,0)

LootLockerInitialize("dev_06b3c273ed3b46f2bd803114f294414d", "0.0.0.1", true, 24185);
global.LLdevelopmentMode = true;
ll_name = "";
set_ll_name = false;

// delta time
target_delta = 1/60;
actual_delta = delta_time/1000000;
delta_mult = actual_delta/target_delta;