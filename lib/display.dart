import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  const Display({
    Key? key,
    required this.display,
  }) : super(key: key);

  final String display;
  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    int easterEgg = 0;

    void showEasterEgg(int value, BuildContext context) {
      easterEgg += value;
      if (easterEgg >= 7) {
        easterEgg = 0;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Flutter e vida"),
          ),
        );
      }
    }

    return GestureDetector(
      onTap: () {
        debugPrint("Um clique");
        showEasterEgg(1, context);
      },
      onDoubleTap: () {
        showEasterEgg(2, context);
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(widget.display),
          ),
        ),
      ),
    );
  }
}
