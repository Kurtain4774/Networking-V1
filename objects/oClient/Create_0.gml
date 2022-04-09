/// @description Initialize Client

//Client Variables
port = 7676;
ip = "138.67.67.92";

network_set_config(network_config_connect_timeout, 3000);
client = network_create_socket(network_socket_tcp);
network_connect(client, ip, port);

//Create Our Player
instances = ds_map_create();
idd = 0;
if(global.first){
	Player = instance_create_layer(100, room_height / 2, "Instances", oPlayer);
}else{
	Player = instance_create_layer(room_width - 100, room_height / 2, "Instances", oPlayer);
}
idd = Player.my_id;

ds_map_add(instances, idd, Player);

//Display error if unable to connect
if (client < 0) {
	show_message("Error connecting to server.");
	game_restart();
}

