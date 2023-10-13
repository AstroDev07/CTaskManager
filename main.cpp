#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>

//Funcion para verificar el comando del usuario
int Command(std::string command){
	if(command=="help"){
		std::cout<<"Mostrar la Ayuda\n";
		//help();
	}
	if(command=="exit"){
		std::cout<<"Hasta la Vista\n";
		exit(0);
	}
	return 0;
}

// La funcion principal, la cual sera un bucle infinito para aceptar los comandos de control del programa
int main(){
	//Esta funcion ejecuta el script de preparacion, para crear los directorios necesarios en caso de que aun no existan
	std::system("sh config.sh");
	while(true){
		std::string user;
		std::cout<<"Diga el siguiente comando: ";
		std::cin>>user;
		Command(user);
	}
	return 0;
}