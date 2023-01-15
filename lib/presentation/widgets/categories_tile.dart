import 'package:flutter/material.dart';

class Catergory_Tile extends StatelessWidget {
  const Catergory_Tile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 5, bottom: 5, left: 15),
          child: const CircleAvatar(backgroundColor: Colors.orange, radius: 25, child: Icon(Icons.power)),
        ),
        Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 10, left: 90),
            child: const Text("Forum Announcements",
                style: TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.bold)))
      ],
    );
  }
}
