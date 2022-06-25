import 'package:calculator_project/theme.dart';
import 'package:flutter/material.dart';

import 'display.dart';
import 'number_button.dart';
import 'operadorButton.dart';

const appName = "Simple Calculator";
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora Simples",
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: ThemeMode.light,
      theme: SimpleCalculatorTheme.light,
      darkTheme: SimpleCalculatorTheme.dark,
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  static const operadores = ["x", "+", "-"];
  String display = "0";
  String operador = "";
  String firstNumber = "";
  String secondNumber = "";

  void insert(String char) {
    if (operadores.contains(char)) {
      operador = char;
    } else {
      if (operador.isEmpty) {
        firstNumber += char;
      } else {
        secondNumber += char;
      }
    }

    setState(() {
      if (operador.isEmpty) {
        display = firstNumber;
      } else {
        if (secondNumber.isEmpty) {
          display = "$firstNumber $operador";
        } else {
          display = "$firstNumber $operador $secondNumber";
        }
      }
    });
  }

  void clearCalculator() {
    firstNumber = "";
    operador = "";
    secondNumber = "";
    setState(() {
      display = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: FloatingActionButton(
          onPressed: clearCalculator,
          child: const Text("C"),
        ),
      ),
      // backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        title: const Text(
          appName,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Display(
              display: display,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(number: "7", onNumberPressed: insert),
                NumberButton(number: "8", onNumberPressed: insert),
                NumberButton(number: "9", onNumberPressed: insert),
                OperadorButton(operador: "x", operadorOnPressed: insert)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(number: "6", onNumberPressed: insert),
                NumberButton(number: "5", onNumberPressed: insert),
                NumberButton(number: "4", onNumberPressed: insert),
                OperadorButton(operador: "-", operadorOnPressed: insert)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(number: "3", onNumberPressed: insert),
                NumberButton(number: "2", onNumberPressed: insert),
                NumberButton(number: "1", onNumberPressed: insert),
                OperadorButton(operador: "+", operadorOnPressed: insert)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // NumberButton(number: "0", onNumberPressed: insert),
                // NumberButton(number: ",", onNumberPressed: insert),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
