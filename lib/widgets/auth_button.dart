import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;
  final String text;
  const AuthButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        onPressed();
      },
      icon: Icon(iconData),
      label: Text(text),
    );
  }
}
