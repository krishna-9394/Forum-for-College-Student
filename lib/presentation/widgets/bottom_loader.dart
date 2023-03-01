import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 48,
        width: 48,
        padding: const EdgeInsets.all(10),
        child: const CircularProgressIndicator(strokeWidth: 2.5),
      ),
    );
  }
}
