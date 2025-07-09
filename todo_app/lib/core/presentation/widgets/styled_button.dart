import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.child,
    required void Function() onPressed,
  }) : _onPressed = onPressed;

  final Widget child;
  final void Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.grey),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Leicht abgerundet
          ),
        ),
      ),
      onPressed: _onPressed,
      child: SizedBox(height: 150, width: 75, child: child),
    );
  }
}
