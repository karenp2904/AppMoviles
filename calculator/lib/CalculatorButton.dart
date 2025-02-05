import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final double heightMultiplier;
  final VoidCallback? onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.color,
    this.heightMultiplier = 1,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.fill,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: 70.0,
          height: 70.0 * heightMultiplier,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (onPressed != null) {
                onPressed!();
              }
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

