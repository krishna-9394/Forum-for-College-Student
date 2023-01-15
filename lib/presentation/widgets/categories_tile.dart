import 'package:flutter/material.dart';

class Catergory_Tile extends StatelessWidget {
  final Size size;
  final String title;
  final String description;
  final String time;

  const Catergory_Tile(
      {Key? key, required this.size, required this.title, required this.description, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5, left: 15),
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: const CircleAvatar(backgroundColor: Colors.orange, radius: 25, child: Icon(Icons.power)),
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(title,
                          style: const TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.bold))),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(description),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.only(right: 10, bottom: 10),
                    child: Text(time),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
