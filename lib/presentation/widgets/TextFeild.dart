import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController editor = TextEditingController();
  final String title;
  final bool isPassword;
  final IconData icon;

  CTextField({Key? key, required this.title, required this.icon, required this.isPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.5, bottom: 2.5, left: 20, right: 20),
      child: Stack(
        children: [
          TextFormField(
            controller: editor,
            decoration: InputDecoration(
              // icon: Icon(icon),
              border: const OutlineInputBorder().copyWith(
                borderSide: const BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                  color: Color(0xffdfdfde),
                ),
              ),
              focusedBorder: const OutlineInputBorder().copyWith(
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              labelText: title,
              labelStyle: const TextStyle(
                color: Colors.black54,
              ),
              hintStyle: const TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
          isPassword
              ? Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 5, top: 5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                )
              : const SizedBox(height: 0, width: 0),
        ],
      ),
    );
  }
}
