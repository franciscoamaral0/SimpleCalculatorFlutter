import 'package:calculator_project/theme.dart';
import 'package:flutter/material.dart';

import 'display.dart';
import 'number_button.dart';

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
  String display = "0";
  String firstNumber = "";
  void insert(String char) {
    firstNumber += char;
    setState(() {
      display = firstNumber;
    });
  }

  void clearCalculator() {
    firstNumber = "";
    setState(() {
      display = firstNumber;
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
