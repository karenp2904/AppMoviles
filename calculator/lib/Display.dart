import 'package:calculator/Data/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    String output = context.watch<CalculatorService>().output;

    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFb9c09b),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        output,
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
