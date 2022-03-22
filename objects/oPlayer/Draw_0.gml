/// @description Insert description here
// You can write your code in this editor
draw_self();

//Draw the HP of our player
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(x, y-32, string(hp));
