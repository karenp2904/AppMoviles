import 'package:calculator/CalculatorButton.dart';
import 'package:calculator/Data/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorService = context.read<CalculatorService>();

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey, 
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: _buildRow(context, ["AC", "CE", "%", "/"], [Colors.orange, Colors.orange, Colors.black45, Colors.black45]),
          ),
          Expanded(
            child: _buildRow(context, ["7", "8", "9", "*"], [Colors.black45, Colors.black45, Colors.black45, Colors.black45]),
          ),
          Expanded(
            child: _buildRow(context, ["4", "5", "6", "-"], [Colors.black45, Colors.black45, Colors.black45, Colors.black45]),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: _buildRow(context, ["1", "2", "3"], [Colors.black45, Colors.black45, Colors.black45]),
                      ),
                      Expanded(
                        child: _buildRow(context, ["0", ".", "="], [Colors.black45, Colors.black45, Colors.black45]),
                      ),
                    ],
                  ),
                ),
                CalculatorButton(
                  text: "+",
                  color: Colors.black45,
                  heightMultiplier: 2,
                  onPressed: () => calculatorService.onButtonPressed("+"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, List<String> texts, List<Color> colors) {
    final calculatorService = context.read<CalculatorService>();

    return Row(
      children: List.generate(
        texts.length,
        (index) => Expanded(
          child: CalculatorButton(
            text: texts[index],
            color: colors[index],
            onPressed: () => calculatorService.onButtonPressed(texts[index]),
          ),
        ),
      ),
    );
  }
}
