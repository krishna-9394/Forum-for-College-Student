import 'package:flutter/material.dart';

import '../widgets/categories_tile.dart';
import '../widgets/drawer_button.dart';
import 'auth/auth.dart';
import 'categories.dart';
import 'group_page.dart';
import 'home_page.dart';

class Users extends StatelessWidget {
  static const String id = "users_page";

  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: size.height * 0.8,
        child: Column(
          children: const [
            Text(
              "Groups",
              style: TextStyle(),
            ),
            Catergory_Tile(),
            Catergory_Tile(),
            Catergory_Tile(),
            Catergory_Tile(),
          ],
        ),
      )),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade800,
        width: size.width * (0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.040),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * (0.40),
            //   height: MediaQuery.of(context).size.width * (0.40),
            //   child: Image.asset('assets/images/nitk_logo.png'),
            // ),
            const DrawerButton(title: 'Categories', call: Category.id, data: Icons.home),
            const DrawerButton(title: 'Unread', call: HomePage.id, data: Icons.mark_chat_unread_outlined),
            const DrawerButton(title: 'Recent', call: HomePage.id, data: Icons.access_time),
            const DrawerButton(title: 'Tags', call: HomePage.id, data: Icons.discount),
            const DrawerButton(title: 'Popular', call: HomePage.id, data: Icons.local_fire_department_sharp),
            const DrawerButton(title: 'User', call: Users.id, data: Icons.person),
            const DrawerButton(title: 'Groups', call: Groups.id, data: Icons.group),
          ],
        ),
      ),
    );
  }
}
