import 'package:flutter/material.dart';

class IconsArt extends StatelessWidget {
  final IconData icon;

  const IconsArt(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Colors.black);
  }
}
