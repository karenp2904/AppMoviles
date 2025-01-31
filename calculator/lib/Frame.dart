import 'package:calculator/Display.dart';
import 'package:calculator/Keyboard.dart';
import 'package:flutter/material.dart';


class Frame extends StatelessWidget {
  const Frame({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350, 
        height: 500, 
        padding: const EdgeInsets.all(10), //padding simetrico
        decoration: BoxDecoration(
          color: Color(0xFF6e6f6f ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow( //sombreado en el frame
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Column(
        children: [
          Expanded(
            flex: 1, // Da más espacio al Display
            child: Container(
              child: const Display(),
            ),
          ),
          const SizedBox(height: 8),
          const Expanded(
            flex: 3, // Da más espacio al Keyboard
            child: Keyboard(),
          ),
        ],
      ),
      ),
    );
  }
}