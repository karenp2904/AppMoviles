import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class ItemUsuario extends StatelessWidget {
  final String sImagen;
  final String sNombres;
  final String sCarrera;
  final double sPromedio;

  const ItemUsuario({
    super.key,
    required this.sImagen,
    required this.sNombres,
    required this.sCarrera,
    required this.sPromedio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blueAccent[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5), // Espaciado interno 
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(path.join('assets', sImagen)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sNombres,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Text(
                      sCarrera,
                      style: const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      "Promedio: $sPromedio",
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
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
