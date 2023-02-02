import 'package:flutter/material.dart';

class Topics_Tile extends StatelessWidget {
  final Size size;
  final String title;
  final int count1;
  final int count2;
  final int count3;
  final String time;

  const Topics_Tile(
      {Key? key,
      required this.size,
      required this.title,
      required this.time,
      required this.count1,
      required this.count2,
      required this.count3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => TopicsList(
        //             cid: 0,
        //             title: '',
        //           )),
        // );
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 15),
              child: Text(time),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 0),
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.thumb_up_sharp,
                        size: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$count1",
                        style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.message, size: 22),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$count2",
                        style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.remove_red_eye, size: 22),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$count3",
                        style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
