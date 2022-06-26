import 'package:calculator_project/theme.dart';
import 'package:flutter/material.dart';

import 'display.dart';
import 'number_button.dart';
import 'operadorButton.dart';

const appName = "Simple Calculator";
void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode currentThemeMode = ThemeMode.light;

  void _toggleThemeMode() {
    setState(() {
      currentThemeMode = currentThemeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora Simples",
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: currentThemeMode,
      theme: SimpleCalculatorTheme.light,
      darkTheme: SimpleCalculatorTheme.dark,
      home: Calculator(
        onThemeModePressed: _toggleThemeMode,
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({
    Key? key,
    required this.onThemeModePressed,
  }) : super(key: key);

  final VoidCallback onThemeModePressed;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  static const operadores = ["x", "+", "-"];
  String display = "0";
  String operador = "";
  String firstNumber = "";
  String secondNumber = "";
  double progress = 0.0;
  bool disableOperador = false;

  void calculate() {
    final number1 = int.parse(firstNumber);
    final number2 = int.parse(secondNumber);
    String result = "";

    switch (operador) {
      case "+":
        result = (number1 + number2).toString();
        break;
      case "-":
        result = (number1 - number2).toString();
        break;
      default:
        result = (number1 * number2).toString();
        break;
    }
    firstNumber = result;
    secondNumber = "";
    operador = "";

    setState(() {
      display = result;
      progress = 0.33;
      disableOperador = false;
    });
  }

  void insert(String char) {
    if (char == "0") {
      if (operador.isEmpty && firstNumber.isEmpty) return;
      if (operador.isNotEmpty && secondNumber.isEmpty) return;
    }
    if (operadores.contains(char)) {
      if (firstNumber.isEmpty) firstNumber = "0";
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
        progress = 0.33;
        display = firstNumber;
      } else {
        if (secondNumber.isEmpty) {
          display = "$firstNumber $operador";
          progress = 0.66;
        } else {
          display = "$firstNumber $operador $secondNumber";
          progress = 1.0;
          disableOperador = true;
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
      progress = 0;
      disableOperador = false;
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
        actions: [
          IconButton(
            onPressed: widget.onThemeModePressed,
            icon: Icon(theme.brightness == Brightness.light
                ? Icons.dark_mode
                : Icons.light_mode),
          )
        ],
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
            child: Center(
              child: LinearProgressIndicator(
                backgroundColor: theme.scaffoldBackgroundColor,
                value: progress,
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(number: "7", onNumberPressed: insert),
                NumberButton(number: "8", onNumberPressed: insert),
                NumberButton(number: "9", onNumberPressed: insert),
                OperadorButton(
                  operador: "x",
                  operadorOnPressed: insert,
                  disabled: disableOperador,
                )
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
                OperadorButton(
                  operador: "-",
                  operadorOnPressed: insert,
                  disabled: disableOperador,
                )
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
                OperadorButton(
                  operador: "+",
                  operadorOnPressed: insert,
                  disabled: disableOperador,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: TextButton(
                    onPressed: () => insert("0"),
                    child: const Text("0"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () => calculate(),
                      child: const Text("="),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
