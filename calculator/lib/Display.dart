import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFb9c09b),
        borderRadius: BorderRadius.circular(10),  // Ajusta el valor para redondear
      ),
      child: Text(
        "0",
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}