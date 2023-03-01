import 'package:flutter/material.dart';

import '../../../data/Models/message.dart';
import '../../componets_and_design/post_count.dart';
import '../auth/login_page.dart';

class ChatRoom extends StatefulWidget {
  static const String id = "chat room";
  final String name;
  const ChatRoom({super.key, required this.name});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String message;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.name,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new),
            onPressed: () {
              Navigator.pushNamed(context, LoginPage.id);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: MessageStream(),
              ),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: controller,
                        onChanged: (value) {
                          message = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MessageStream extends StatelessWidget {
//   const MessageStream({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: _firestore.collection('group message').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.blueAccent,
//             ),
//           );
//         }
//         final messages = snapshot.data?.documents;
//         List<chatMessage> messageWidgets = [];
//         for (var message in messages!) {
//           String textMessage = message.data['message'];
//           String sender = message.data['sender'];
//           DateTime dateTime = message.data['date time'].toDate();
//           String date = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
//           String time = '${dateTime.hour}:${dateTime.minute}';
//           String chat = '$sender\n$textMessage';
//           messageWidgets.add(
//             chatMessage(
//               message: textMessage,
//               email: sender,
//               time: time,
//               date: date,
//               user: loggedInUser.email,
//             ),
//           );
//         }
//         return Expanded(
//           child: ListView(
//             children: messageWidgets,
//           ),
//         );
//       },
//     );
//   }
// }

class MessageStream extends StatefulWidget {
  const MessageStream({super.key});

  @override
  State<MessageStream> createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  int _page_num = 0;
  int _limit = 20;
  bool is_first_loading = false;
  List posts = [];
  void firstLoad() async {
    setState(() {
      is_first_loading = true;
    });
    setState(() {
      is_first_loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
