import 'package:flutter/material.dart';

class ElevatedButtonCustomWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;
  const ElevatedButtonCustomWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed,
      this.borderColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
