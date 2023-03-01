import 'package:flutter/material.dart';

// chat message Basic UI
class chatMessage extends StatelessWidget {
  final String message;
  final String email;
  final String time;
  final String date;
  final String user;
  const chatMessage(
      {Key? key,
      required this.message,
      required this.email,
      required this.time,
      required this.date,
      required this.user})
      : super(key: key);
  bool isCurrentUser() {
    if (user.compareTo(email) == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String setEmail = isCurrentUser() ? "you" : email;
    return Column(
      crossAxisAlignment:
          isCurrentUser() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        isCurrentUser() ? const SizedBox(height: 0) : Text(setEmail),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Material(
            elevation: 5,
            color: isCurrentUser() ? Colors.green.shade700 : Colors.white,
            borderRadius: isCurrentUser()
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.zero,
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                message,
                style: TextStyle(
                  color: isCurrentUser() ? Colors.white : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
