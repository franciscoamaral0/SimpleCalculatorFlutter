import 'package:flutter/material.dart';

typedef OperadorPressedCallback = void Function(String);

class OperadorButton extends StatelessWidget {
  const OperadorButton(
      {Key? key, required this.operador, required this.operadorOnPressed})
      : super(key: key);

  final String operador;
  final OperadorPressedCallback operadorOnPressed;

  IconData mapOperadorToIcon() {
    switch (operador) {
      case "x":
        return Icons.close;
      case "-":
        return Icons.remove;
      default:
        return Icons.add;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        onPressed: () => operadorOnPressed(operador),
        icon: Icon(
          mapOperadorToIcon(),
        ),
      ),
    );
  }
}
