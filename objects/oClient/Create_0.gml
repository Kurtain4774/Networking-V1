/// @description Insert description here
// You can write your code in this editor

port = 7676;
ip = "127.0.0.1";

network_set_config(network_config_connect_timeout, 3000);
client = network_create_socket(network_socket_tcp);
network_connect(client, ip, port);

if(client < 0){
	show_message("ERROR CONNECTING TO SERVER");
	game_restart();
	
}