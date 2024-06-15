import 'package:flutter/material.dart';

class FloatingActionButtonView extends StatelessWidget {

  VoidCallback? onPressed;
  Widget? widget;

      FloatingActionButtonView({
        required this.onPressed,
        required this.widget,
      });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: widget,
    );
  }
}
