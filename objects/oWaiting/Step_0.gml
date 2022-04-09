/// @description Insert description here
// You can write your code in this editor

if(ds_map_size(oPerson) >= 2){
	global.game_state = states.PLAYING;	
	network_destroy(client);
	room_goto(rClient);
}
