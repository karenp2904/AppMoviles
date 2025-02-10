import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'item_user.dart'; 

class ListaExterna extends StatefulWidget {
  final String sTitulo;
  const ListaExterna({super.key, this.sTitulo = ""});

  @override
  State<ListaExterna> createState() => _ListaArticulosState();
}

class _ListaArticulosState extends State<ListaExterna> {
  List<Map<String, dynamic>> usuarios = [];

  @override
  void initState() {
    super.initState();
    _consultarUsuarios(); // Cargar datos al inicio
  }

  Future<void> _consultarUsuarios() async {
    String sUrl = "http://api.npoint.io/bffbb3b6b3ad5e711dd2";

    try {
      final respuesta = await http.get(
        Uri.parse(sUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (respuesta.statusCode == 200) {
        dynamic datos = jsonDecode(utf8.decode(respuesta.bodyBytes));

        if (datos != null && datos["items"] != null) {
          setState(() {
            usuarios = List<Map<String, dynamic>>.from(datos["items"]);
          });
        } else {
          print("Error: Estructura JSON inesperada.");
        }
      } else {
        print("Error al obtener datos: ${respuesta.statusCode}");
      }
    } catch (e) {
      print("ERROR AL ENVIAR/RECIBIR SOLICITUD: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sTitulo.isEmpty ? "Lista de Usuarios" : widget.sTitulo),
        backgroundColor: const Color.fromARGB(255, 120, 193, 229),
      ),
      body: usuarios.isEmpty
          ? const Center(child: CircularProgressIndicator()) //loading
          :ListView.builder(
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
