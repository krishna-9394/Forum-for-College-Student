import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:node_bb_application/presentation/screens/auth/login_page.dart';
import 'package:simple_rich_text/simple_rich_text.dart';

import '../../business_logics/users/users_bloc.dart';
import '../screens/category_list.dart';
import '../screens/group_page.dart';
import '../screens/home_page.dart';
import '../screens/users_page.dart';
import 'drawer_button.dart';

class ProfileTile extends StatelessWidget {
  final int uid;
  final String name;
  final String picture;
  final String bgcolor;

  const ProfileTile({Key? key, required this.uid, required this.name, required this.picture, required this.bgcolor})
      : super(key: key);

  String DateInterconversion(int time) {
    final DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(time);
    final DateTime now = DateTime.now();
    int difference = now.difference(timestamp).inHours;
    String lastonline = "$difference hours ago";
    if (difference > 23) {
      difference = now.difference(timestamp).inDays;
      lastonline = "$difference days ago";
    }
    return lastonline;
  }

  String DateConverter(int time) {
    final DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(time);
    return DateFormat.yMMMEd().format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UsersBloc()..add(LoadingSingleUser(uid)),
      child: BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
        if (state is LoadingSingleUsersData) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text("Profile"),
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
          );
        } else if (state is LoadedSingleUsersData) {
          dynamic map = state.object;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text("Profile"),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 25),
                picture.compareTo("") == 0
                    ? CircleAvatar(
                        backgroundColor: Color(int.parse(bgcolor)),
                        radius: 75,
                        child: const Icon(
                          FontAwesome.user_astronaut,
                          size: 75,
                        ))
                    : CircleAvatar(
                        radius: 75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(75),
                          child: Image.network(
                            picture,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                const SizedBox(height: 25),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: SimpleRichText("*STATUS*:  ${map["status"]}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontFamily: 'CormorantGaramond-LightItalic.ttf')),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: SimpleRichText(
                    map["email"].compareTo("") == 0 ? "*Email:* Null" : "*Email:* ${map["email"]}",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: SimpleRichText(
                    "*Last Online:* ${DateInterconversion(map["lastonline"])}",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: SimpleRichText(
                    "*Joined:* ${DateConverter(map["joindate"])} ago",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: SimpleRichText(
                    "*REPUTATION:* ${map["reputation"]} ",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: SimpleRichText(
                    "*POSTS:* ${map["postcount"]}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: SimpleRichText(
                    "*PROFILE VIEW:* ${map["profileviews"]}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: SimpleRichText(
                    "*FOLLOWERS:* ${map["followerCount"]}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: SimpleRichText(
                    "*FOLLOWING:* ${map["followingCount"]}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                  ),
                ),
              ],
            ),
          );
        } else if (state is FailedToLoadSingleUsersData) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text("Profile"),
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
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text("Category"),
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
