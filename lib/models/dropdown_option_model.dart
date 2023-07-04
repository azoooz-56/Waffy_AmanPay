import 'package:flutter/material.dart';

class DropdownOption {
  final String title;
  final List<RowOption> options;

  DropdownOption({
    required this.title,
    required this.options,
  });
}

class RowOption {
  final String text;
  final IconData icon;
  final Color? iconColor;
  final Function onTap;

  RowOption({
    required this.text,
    required this.icon,
    this.iconColor,
    required this.onTap
  });
}
