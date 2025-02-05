import 'package:flutter/material.dart';

class ItemUsuario extends StatelessWidget {
  final Map<String, dynamic> usuario;

  const ItemUsuario({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blueAccent[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(5), // Espaciado interno 
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(usuario["imagen"]),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      usuario["nombres"],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Text(
                      usuario["carrera"],
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      "Promedio: ${usuario["promedio"]}",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
