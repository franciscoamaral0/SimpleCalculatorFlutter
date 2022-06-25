import 'package:calculator_project/theme.dart';
import 'package:flutter/material.dart';

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

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        title: const Text(
          appName,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(
            flex: 3,
            child: Card(
              elevation: 5,
              child: Text("data"),
            ),
          ),
          Expanded(child: Text("First line")),
          Expanded(child: Text("Secondary line")),
          Expanded(child: Text("Third line")),
          Expanded(child: Text("Fourth Line")),
        ],
      ),
    );
  }
}
