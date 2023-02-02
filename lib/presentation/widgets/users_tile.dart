import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class UsersTile extends StatelessWidget {
  final int uid;
  final String bgColor;
  final String name;
  final String picture;
  final String status;
  final String logo;
  final String timestamp;

  const UsersTile(
      {super.key,
      required this.uid,
      required this.bgColor,
      required this.name,
      required this.picture,
      required this.status,
      required this.timestamp,
      required this.logo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => TopicsList(cid: cid, title: title)),
        // );
      },
      child: Card(
          elevation: 5,
          child: ListTile(
            leading: picture.compareTo("") == 0
                ? CircleAvatar(
                    backgroundColor: Color(int.parse(bgColor)), radius: 25, child: const Icon(FontAwesome.user))
                : CircleAvatar(backgroundColor: Color(int.parse(bgColor)), radius: 25, child: Image.network(picture)),
            title: Text(
              name,
              style: const TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              children: [
                Text(timestamp),
                Row(
                  children: [
                    status.compareTo("online") == 0
                        ? const Icon(Icons.circle, color: Colors.green)
                        : const Icon(Icons.circle, color: Colors.grey),
                    Text(status),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
