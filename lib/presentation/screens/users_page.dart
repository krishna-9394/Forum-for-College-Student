import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logics/category/category_bloc.dart';
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
    return BlocProvider(
      create: (context) => CategoryBloc()..add(LoadCategories()),
      child: BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
        if (state is LoadingCategoryData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Category"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.power_settings_new),
                  onPressed: () {
                    Navigator.pushNamed(context, AuthenticationPage.id);
                  },
                ),
              ],
            ),
            body: const Center(
              child: CircularProgressIndicator(),
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
        } else if (state is LoadedCategoryData) {
          Map<String, dynamic> map = state.map;
          return Scaffold(
            appBar: AppBar(
              title: const Text("Category"),
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
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      String time = map["categories"][index + 1]["teaser"]["timestamp"];
                      return Catergory_Tile(
                          title: map["categories"][index + 1]["name"],
                          description: map["categories"][index + 1]["description"],
                          time: time,
                          size: size);
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
        } else if (state is FailedToLoadData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Category"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.power_settings_new),
                  onPressed: () {
                    Navigator.pushNamed(context, AuthenticationPage.id);
                  },
                ),
              ],
            ),
            body: Center(
              child: Text(state.error),
            ),
            drawer: Drawer(
              backgroundColor: Colors.grey.shade800,
              width: size.width * (0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.040),
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
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Category"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.power_settings_new),
                  onPressed: () {
                    Navigator.pushNamed(context, AuthenticationPage.id);
                  },
                ),
              ],
            ),
            body: const Center(
              child: Text("Blank Screen"),
            ),
            drawer: Drawer(
              backgroundColor: Colors.grey.shade800,
              width: size.width * (0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.040),
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
      }),
    );
  }
}