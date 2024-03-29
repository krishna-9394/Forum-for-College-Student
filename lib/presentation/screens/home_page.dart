import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_bb_application/presentation/screens/category_list.dart';
import 'package:node_bb_application/presentation/screens/users_page.dart';
import 'package:node_bb_application/presentation/widgets/drawer_button.dart';

import '../../business_logics/category/category_bloc.dart';
import '../widgets/categories_tile.dart';
import 'auth/login_page.dart';
import 'group_page.dart';

class HomePage extends StatelessWidget {
  static const id = 'Home Page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CategoryBloc()..add(LoadCategories()),
      child: BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
        if (state is LoadingCategoryData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.power_settings_new),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
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
                  const DrawerButton(title: 'Categories', call: CategoryList.id, data: Icons.home),
                  const DrawerButton(title: 'Unread', call: HomePage.id, data: Icons.mark_chat_unread_outlined),
                  const DrawerButton(title: 'Recent', call: HomePage.id, data: Icons.access_time),
                  const DrawerButton(title: 'Tags', call: HomePage.id, data: Icons.discount),
                  const DrawerButton(title: 'Popular', call: HomePage.id, data: Icons.local_fire_department_sharp),
                  const DrawerButton(title: 'User', call: UsersList.id, data: Icons.person),
                  const DrawerButton(title: 'Groups', call: Groups.id, data: Icons.group),
                ],
              ),
            ),
          );
        } else if (state is LoadedCategoryData) {
          List<dynamic> map = state.map["categories"];
          print(map.length);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.power_settings_new),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
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
                    itemCount: map.length,
                    itemBuilder: (context, index) {
                      //TODO handle time and date according to the time difference
                      String timestamp = map[index]["teaser"]["timestampISO"];
                      String date = "2023-01-31";
                      String time = "19:21";
                      String color = map[index]["bgColor"];
                      color = color.substring(1);
                      color = "0xff$color";
                      return Catergory_Tile(
                          title: map[index]["name"],
                          description: map[index]["description"],
                          time: date,
                          size: size,
                          cid: 0,
                          color: color);
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
                  const DrawerButton(title: 'Categories', call: CategoryList.id, data: Icons.home),
                  const DrawerButton(title: 'Unread', call: HomePage.id, data: Icons.mark_chat_unread_outlined),
                  const DrawerButton(title: 'Recent', call: HomePage.id, data: Icons.access_time),
                  const DrawerButton(title: 'Tags', call: HomePage.id, data: Icons.discount),
                  const DrawerButton(title: 'Popular', call: HomePage.id, data: Icons.local_fire_department_sharp),
                  const DrawerButton(title: 'User', call: UsersList.id, data: Icons.person),
                  const DrawerButton(title: 'Groups', call: Groups.id, data: Icons.group),
                ],
              ),
            ),
          );
        } else if (state is FailedToLoadData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.power_settings_new),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
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
                  const DrawerButton(title: 'Categories', call: CategoryList.id, data: Icons.home),
                  const DrawerButton(title: 'Unread', call: HomePage.id, data: Icons.mark_chat_unread_outlined),
                  const DrawerButton(title: 'Recent', call: HomePage.id, data: Icons.access_time),
                  const DrawerButton(title: 'Tags', call: HomePage.id, data: Icons.discount),
                  const DrawerButton(title: 'Popular', call: HomePage.id, data: Icons.local_fire_department_sharp),
                  const DrawerButton(title: 'User', call: UsersList.id, data: Icons.person),
                  const DrawerButton(title: 'Groups', call: Groups.id, data: Icons.group),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.power_settings_new),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
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
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * (0.40),
                  //   height: MediaQuery.of(context).size.width * (0.40),
                  //   child: Image.asset('assets/images/nitk_logo.png'),
                  // ),
                  const DrawerButton(title: 'Categories', call: CategoryList.id, data: Icons.home),
                  const DrawerButton(title: 'Unread', call: HomePage.id, data: Icons.mark_chat_unread_outlined),
                  const DrawerButton(title: 'Recent', call: HomePage.id, data: Icons.access_time),
                  const DrawerButton(title: 'Tags', call: HomePage.id, data: Icons.discount),
                  const DrawerButton(title: 'Popular', call: HomePage.id, data: Icons.local_fire_department_sharp),
                  const DrawerButton(title: 'User', call: UsersList.id, data: Icons.person),
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
