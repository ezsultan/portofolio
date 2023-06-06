import 'package:flutter/material.dart';

class HeaderItem {
  HeaderItem({
    required this.title,
    required this.onTap,
    required this.isButton,
  });

  final bool isButton;
  final VoidCallback onTap;
  final String title;
}
