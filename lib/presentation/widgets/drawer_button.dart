import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String title;
  final String call;
  final IconData data;

  const DrawerButton({Key? key, required this.title, required this.call, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, call);
      },
      child: ListTile(
        leading: Icon(data, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
