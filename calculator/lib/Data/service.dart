import 'package:flutter/material.dart';
import 'dart:collection';

class CalculatorService with ChangeNotifier {
  String _input = "";
  String _output = "0";
  
  String get output => _output;

  void onButtonPressed(String value) {
    if (value == "AC") {
      _clear();
    } else if (value == "CE") {
      _deleteLast();
    } else if (value == "=") {
      _calculateResult();
    } else {
      _appendValue(value);
    }
    notifyListeners();
  }

  void _clear() {
    _input = "";
    _output = "0";
  }

  void _deleteLast() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
    }
    _output = _input.isEmpty ? "0" : _input;
  }

  void _appendValue(String value) {
    if (value == "." && _input.endsWith(".")) return; 
    _input += value;
    _output = _input;
  }

  void _calculateResult() {
    try {
      double result = _evaluateExpression(_input);
      _output = (result % 1 == 0) ? result.toInt().toString() : result.toString();
      _input = _output; // Permite continuar con más operaciones
    } catch (e) {
      _output = "Error";
    }
    notifyListeners();
  }



  double _evaluateExpression(String expression) {
    List<String> tokens = _tokenize(expression);
    Queue<double> values = Queue<double>();
    Queue<String> operators = Queue<String>();

    for (String token in tokens) {
      if (_isNumber(token)) {
        values.add(double.parse(token));
      } else if (_isOperator(token)) {
        while (operators.isNotEmpty &&
            _precedence(operators.last) >= _precedence(token)) {
          _applyOperator(values, operators.removeLast());
        }
        operators.add(token);
      }
    }

    while (operators.isNotEmpty) {
      _applyOperator(values, operators.removeLast());
    }

    return values.removeLast();
  }

  List<String> _tokenize(String expression) {
    List<String> tokens = [];
    String numberBuffer = "";

    for (int i = 0; i < expression.length; i++) {
      String char = expression[i];

      if (_isDigitOrDot(char)) {
        numberBuffer += char;
      } else {
        if (numberBuffer.isNotEmpty) {
          tokens.add(numberBuffer);
          numberBuffer = "";
        }
        tokens.add(char);
      }
    }

    if (numberBuffer.isNotEmpty) {
      tokens.add(numberBuffer);
    }

    return tokens;
  }

  bool _isNumber(String token) {
    return double.tryParse(token) != null;
  }

  bool _isOperator(String token) {
    return ["+", "-", "*", "/", "%"].contains(token);
  }

  int _precedence(String operator) {
    if (operator == "+" || operator == "-") return 1;
    if (operator == "*" || operator == "/" || operator == "%") return 2;
    return 0;
  }

  bool _isDigitOrDot(String char) {
    return RegExp(r'[0-9.]').hasMatch(char);
  }

  void _applyOperator(Queue<double> values, String operator) {
    if (values.length < 2) return;

    double b = values.removeLast();
    double a = values.removeLast();
    double result = 0;

    switch (operator) {
      case "+":
        result = a + b;
        break;
      case "-":
        result = a - b;
        break;
      case "*":
        result = a * b;
        break;
      case "/":
        if (b != 0) {
          result = a / b;
        } else {
          throw Exception("Division by zero");
        }
        break;
      case "%":
        result = a % b;
        break;
    }

    values.add(result);
  }
}
