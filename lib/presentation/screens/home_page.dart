import 'package:flutter/material.dart';
import 'package:node_bb_application/presentation/screens/auth/auth.dart';
import 'package:node_bb_application/presentation/widgets/icons.dart';

class HomePage extends StatelessWidget {
  static const id = 'Home Page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new),
            onPressed: () {
              Navigator.pushNamed(context, AuthenticationPage.id);
            },
          ),
        ],
      ),
      body: const Placeholder(),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * (0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            SizedBox(
              width: MediaQuery.of(context).size.width * (0.40),
              height: MediaQuery.of(context).size.width * (0.40),
              child: Image.asset('assets/images/nitk_logo.png'),
            ),
            const InkWell(
                child: ListTile(
                    leading: IconsArt(Icons.home),
                    title: Text(
                      'Home',
                      style: TextStyle(fontSize: 16),
                    ))),
            const InkWell(
                child: ListTile(
                    leading: IconsArt(Icons.mark_chat_unread_outlined),
                    title: Text(
                      'Unread',
                      style: TextStyle(fontSize: 16),
                    ))),
            const InkWell(
                child: ListTile(
                    leading: IconsArt(Icons.access_time),
                    title: Text(
                      'Recent',
                      style: TextStyle(fontSize: 16),
                    ))),
            const InkWell(
                child: ListTile(
                    leading: IconsArt(Icons.discount),
                    title: Text(
                      'Tags',
                      style: TextStyle(fontSize: 16),
                    ))),
            const InkWell(
                child: ListTile(leading: IconsArt(Icons.local_fire_department_sharp), title: Text('Popular'))),
            const InkWell(child: ListTile(leading: IconsArt(Icons.person), title: Text('User'))),
            const InkWell(child: ListTile(leading: IconsArt(Icons.group), title: Text('Groups'))),
          ],
        ),
      ),
    );
  }
}
