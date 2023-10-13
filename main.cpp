#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>
#include <cstring>
//Prototipo de la funcion para crear las tareas
int NewTask();
int CreateTask(std::string title, std::string description);
//Funcion para verificar el comando del usuario
int Command(std::string command){
	if(command=="help"){
		std::cout<<"Mostrar la Ayuda\n";
		//help();
	}
	else if(command=="exit"){
		std::cout<<"Hasta la Vista\n";
		exit(0);
	}
	else if(command=="new"){
		NewTask();
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

//Funcion para crear una nueva tarea
int NewTask(){
	std::system("cd src/ && sh newtask.sh");
	return 0;
}