import 'package:flutter/material.dart';
import 'package:user_list/item_user.dart';


class ListaUsuarios extends StatelessWidget {
  
  // Lista de usuarios  de prueba
  final List<Map<String, dynamic>> usuarios = [
    {
      "imagen": "assets/2.png", 
      "nombres": "Andres Silva",
      "carrera": "Ingeniería Civil",
      "promedio": 3.9
    },
    {
      "imagen": "assets/1.png",
      "nombres": "Carlos López",
      "carrera": "Arquitectura",
      "promedio": 4.3
    },
     {
      "imagen": "assets/2.png", 
      "nombres": "Maria Florez",
      "carrera": "Ingeniería Sistemas",
      "promedio": 3.0
    },
    {
      "imagen": "assets/3.png",
      "nombres": "Carla Luna",
      "carrera": "Medicina",
      "promedio": 4.4
    },
     {
      "imagen": "assets/2.png", 
      "nombres": "Andres Rojas",
      "carrera": "Ingeniería Civil",
      "promedio": 3.5
    },
    {
      "imagen": "assets/4.png",
      "nombres": "Juan Ardila",
      "carrera": "Arquitectura",
      "promedio": 4.1
    },
     {
      "imagen": "assets/3.png", 
      "nombres": "Andrea Lina",
      "carrera": "Ingeniería Civil",
      "promedio": 3.7
    },
    {
      "imagen": "assets/5.png",
      "nombres": "Carlos López",
      "carrera": "Administración",
      "promedio": 4.2
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuarios"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          itemCount: usuarios.length,
          itemBuilder: (context, index) {
            return ItemUsuario(
              sImagen: usuarios[index]["imagen"],
              sNombres: usuarios[index]["nombre"],
              sCarrera: usuarios[index]["carrera"],
              sPromedio: usuarios[index]["promedio"].toDouble(),
            );
          },
        ),
    );
  }
}
