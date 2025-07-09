import 'package:flutter/material.dart';

class CanbanButton extends StatelessWidget {
  const CanbanButton({super.key, required this.function, required this.child});

  final Function function;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: function(), child: child);
  }
}
