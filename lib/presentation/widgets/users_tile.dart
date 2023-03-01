import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:node_bb_application/presentation/widgets/profile_tile.dart';

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
    // TODO4 when you click you get the pop of the image in the magnified form
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileTile(
                  bgcolor: bgColor, uid: uid,picture: picture,)),
        );
      },
      child: Card(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Row(
            children: [
              Container(
                child: picture.compareTo("") == 0
                    ? CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 28,
                        child: Icon(FontAwesome.user_large,
                            size: 30, color: Color(int.parse(bgColor))),
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage(picture),
                        radius: 28,
                      ),
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  // width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                status.compareTo("online") == 0
                                    ? const Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 14,
                                      )
                                    : const Icon(
                                        Icons.circle,
                                        color: Colors.grey,
                                        size: 14,
                                      ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  status,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(timestamp),
                                const SizedBox(
                                  width: 7,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
