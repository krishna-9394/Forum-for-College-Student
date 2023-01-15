import 'package:flutter/material.dart';
import 'package:node_bb_application/presentation/screens/users_page.dart';
import 'package:node_bb_application/presentation/widgets/categories_tile.dart';

import '../../data/Repository/category_repo.dart';
import '../widgets/drawer_button.dart';
import 'auth/auth.dart';
import 'group_page.dart';
import 'home_page.dart';

class Category extends StatelessWidget {
  CategoryRepo repo = CategoryRepo();
  static const String id = "category_page";

  Category({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Category"),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                repo.getCategories(index + 1);
                return const Catergory_Tile();
              },
            ),
          ),
        ],
      ),
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
