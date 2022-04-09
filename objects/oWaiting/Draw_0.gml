/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(room_width/2,room_height/2, "Connected Players: " + string(ds_map_size(instances)));
