import 'package:calculator/CalculatorButton.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey, 
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: _buildRow(["AC", "CE", "%", "/"], [Colors.orange, Colors.orange, Colors.black45, Colors.black45]),
          ),
          Expanded(
            child: _buildRow(["7", "8", "9", "*"], [Colors.black45, Colors.black45, Colors.black45, Colors.black45]),
          ),
          Expanded(
            child: _buildRow(["4", "5", "6", "-"], [Colors.black45, Colors.black45, Colors.black45, Colors.black45]),
          ),
         Expanded(
            flex: 2, //define el alto por ser column (si le pongo mas numeros se expande mas)
            child: Row(
              children: [
                Expanded(
                  flex: 2, // ancho -row
                  child: Column(
                    children: [
                      Expanded(
                        child: _buildRow(["1", "2", "3"], [Colors.black45, Colors.black45, Colors.black45]),
                      ),
                      Expanded(
                        child: _buildRow(["0", ".", "=" ], [Colors.black45, Colors.black45, Colors.black45]),
                      ),
                    ],
                  ),
                ),
                CalculatorButton(
                  text: "+",
                  color: Colors.black45,
                  heightMultiplier: 2, // Hace que el botón sea más alto
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildRow(List<String> texts, List<Color> colors) {
    return Row(
      children: List.generate(
        texts.length,
        (index) => Expanded(
          child: CalculatorButton(
            text: texts[index],
            color: colors[index],
          ),
        ),
      ),
    );
  }
}
