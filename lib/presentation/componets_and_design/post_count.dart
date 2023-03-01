import 'package:flutter/material.dart';

class Pair extends StatelessWidget {
  final String count;
  final String name;
  final double left, right;
  const Pair(
      {super.key,
      required this.count,
      required this.name,
      required this.left,
      required this.right});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: left, right: right),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent.shade700),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String message;
  final Function onPressed;
  final String? name;
  const Button(
      {super.key, required this.message, required this.onPressed, this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        if (name == null) {
        } else {
          onPressed(context, name);
        }
      },
      child: Text(message,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
    );
  }
}



const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
