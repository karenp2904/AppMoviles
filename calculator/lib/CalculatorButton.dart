import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final double heightMultiplier; // ajustar la altura

  const CalculatorButton({
    super.key,
    required this.text,
    required this.color,
    this.heightMultiplier = 1, // Valor predeterminado: altura normal
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.fill, // Llena el espacio disponible
      child: Padding(
        padding: const EdgeInsets.all(4.0), 
        child: SizedBox(
          width: 70.0, //PROBLEMA SOLUCIONADOOOOO (si le defino un ancho fijo todo queda del mismo tamaño)
          height: 70.0 * heightMultiplier, // la altura de todos será la misma
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
            ),
            onPressed: () {
              // al presionar
              debugPrint('Presionaste: $text');
            },
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
