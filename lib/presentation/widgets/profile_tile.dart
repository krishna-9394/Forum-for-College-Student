import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:node_bb_application/business_logics/user_profile/user_profile_bloc.dart';
import 'package:node_bb_application/presentation/screens/auth/login_page.dart';
import 'package:simple_rich_text/simple_rich_text.dart';
import 'package:http/http.dart' as http;

import '../../business_logics/users/users_bloc.dart';
import '../componets_and_design/post_count.dart';
import '../screens/category_list.dart';
import '../screens/chat/chat_room.dart';
import '../screens/group_page.dart';
import '../screens/home_page.dart';
import '../screens/users_page.dart';
import 'drawer_button.dart';

class ProfileTile extends StatelessWidget {
  final int uid;
  final String bgcolor;
  final String picture;

  const ProfileTile(
      {Key? key,
      required this.uid,
      required this.bgcolor,
      required this.picture})
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

  void onMessageClick(BuildContext context, String name) {
    // BlocProvider.of<AuthBloc>(context).add(Login(name, password));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatRoom(name: name)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UserProfileBloc()..add(LoadProfile(uid: uid)),
      child: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileInitial || state is UserProfileLoading) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: const Text("Profile"),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is UserProfileLoaded) {
            Map<String, dynamic> data = state.data;
            String fullname = data["displayname"];
            // TODO5 name capitalizer
            // TODO6 username space remover
            String username = "@${data["username"]}";
            String? email = data["email"];
            String userslug = data["userslug"];
            if (email == null || email.trim().compareTo("") == 0) {
              email = "email does not exist";
            }
            String? aboutme = data["aboutme"];
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: const Text("Profile"),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: picture.compareTo("") == 0
                        ? CircleAvatar(
                            backgroundColor: Colors.greenAccent[400],
                            radius: 55,
                            child: CircleAvatar(
                              backgroundColor: Color(int.parse(bgcolor)),
                              radius: 50,
                              child: const Icon(FontAwesome.user,
                                  size: 50, color: Colors.black),
                            ),
                          )
                        : CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.greenAccent[400],
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Image.network(
                                picture,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      fullname,
                      style: const TextStyle(
                        fontSize: 17,
                        // color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf',
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      username,
                      style: const TextStyle(
                        fontSize: 16,
                        // color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf',
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      email,
                      style: const TextStyle(
                        fontSize: 16,
                        // color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CormorantGaramond-LightItalic.ttf',
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),
                  if (aboutme != null)
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        aboutme,
                        style: const TextStyle(
                          fontSize: 16,
                          // color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CormorantGaramond-LightItalic.ttf',
                        ),
                      ),
                    ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 20),
                      Expanded(
                          child: Button(message: "Follow", onPressed: () {})),
                      const SizedBox(width: 20),
                      Expanded(
                          child: Button(
                              message: "Message",name: fullname, onPressed: onMessageClick)),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.30,
                        child: Pair(
                            count: "${data["reputation"]}",
                            name: "Reputation",
                            left: 30,
                            right: 0),
                      ),
                      SizedBox(
                        width: size.width * 0.30,
                        child: Pair(
                            count: "${data["followerCount"]}",
                            name: "Followers",
                            left: 0,
                            right: 0),
                      ),
                      SizedBox(
                        width: size.width * 0.30,
                        child: Pair(
                            count: "${data["followingCount"]}",
                            name: "Following",
                            left: 0,
                            right: 30),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.30,
                        child: Pair(
                            count: "${data["profileviews"]}",
                            name: "Views",
                            left: 30,
                            right: 0),
                      ),
                      SizedBox(
                        width: size.width * 0.30,
                        child: Pair(
                            count: "${data["postcount"]}",
                            name: "Posts",
                            right: 0,
                            left: 0),
                      ),
                      SizedBox(
                        width: size.width * 0.30,
                        child: Pair(
                            count: "${data["topiccount"]}",
                            name: "Topics",
                            right: 30,
                            left: 0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // TODO9 Complete making the list of followers and following in a horizontal scrollable view
                  // Expanded(
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       // GridTile(child: ,footer: ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            );
          } else if (state is FailedLoadingProfile) {
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
          } else if (state is UserNotFound) {
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
                child: Text("User not found"),
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
                    const DrawerButton(
                        title: 'Categories',
                        call: CategoryList.id,
                        data: Icons.home),
                    const DrawerButton(
                        title: 'Unread',
                        call: HomePage.id,
                        data: Icons.mark_chat_unread_outlined),
                    const DrawerButton(
                        title: 'Recent',
                        call: HomePage.id,
                        data: Icons.access_time),
                    const DrawerButton(
                        title: 'Tags', call: HomePage.id, data: Icons.discount),
                    const DrawerButton(
                        title: 'Popular',
                        call: HomePage.id,
                        data: Icons.local_fire_department_sharp),
                    const DrawerButton(
                        title: 'User', call: UsersList.id, data: Icons.person),
                    const DrawerButton(
                        title: 'Groups', call: Groups.id, data: Icons.group),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
