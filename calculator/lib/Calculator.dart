import 'package:calculator/Display.dart';
import 'package:calculator/Frame.dart';
import 'package:calculator/Keyboard.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const Center(
        child: Frame(),
      ),
    );
  }
}