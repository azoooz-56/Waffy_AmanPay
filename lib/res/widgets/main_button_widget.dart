import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainButtonWidget extends StatelessWidget {
  MainButtonWidget({Key? key, required this.onPressed, required this.text}) : super(key: key);
  String text;
  void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
