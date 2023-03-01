import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:node_bb_application/presentation/widgets/users_tile.dart';

import '../../business_logics/users/users_bloc.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/drawer_button.dart';
import 'auth/login_page.dart';
import 'category_list.dart';
import 'group_page.dart';
import 'home_page.dart';

class UsersList extends StatefulWidget {
  static const String id = "users_page";
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final controller = ScrollController();
  int pageIndex = 0;
  String dateFormater(DateTime last) {
    final DateTime now = DateTime.now();
    String lastonline;
    int days = now.difference(last).inDays;
    if (days < 1) {
      int hour = last.hour;
      int min = last.minute;
      if (hour == 0) {
        String mm = min.toString().padLeft(2, '0');
        lastonline = "12:$mm am";
      } else if (hour > 0 && hour < 12) {
        String hh = hour.toString().padLeft(2, '0');
        String mm = min.toString().padLeft(2, '0');
        lastonline = "$hh:$mm am";
      } else if (hour == 12) {
        lastonline = "12:$min pm";
      } else if (hour > 12 && hour < 24) {
        String hh = (hour - 12).toString().padLeft(2, '0');
        String mm = min.toString().padLeft(2, '0');
        lastonline = "$hh:$mm pm";
      } else {
        String hh = (hour - 12).toString().padLeft(2, '0');
        String mm = min.toString().padLeft(2, '0');
        lastonline = "$hh:$mm am";
      }
    } else if (days < 2) {
      lastonline = "Yesterday";
    } else if (days < 8) {
      lastonline = DateFormat('EEEE').format(last);
    } else {
      lastonline = "${last.day}/${last.month}/${last.year}";
    }
    return lastonline;
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(onScrollEvent);
  }

  @override
  void dispose() {
    controller.removeListener(onScrollEvent);
    super.dispose();
  }

  bool get _isBottom {
    if (!controller.hasClients) return false;
    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.offset;
    return (currentScroll >= (maxScroll * 0.8));
  }

  void onScrollEvent() {
    // ignore: unrelated_type_equality_checks
    if (_isBottom) context.read<UsersBloc>().add(LoadingUsers());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UsersBloc()..add(LoadingUsers()),
      child: BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
        if (state is LoadingUsersData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Users"),
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
        } else if (state is LoadedUsersData) {
          List<dynamic> map = state.map;
          return Scaffold(
            appBar: AppBar(
              title: const Text("Users"),
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
                    controller: controller,
                    itemCount: state.hasReachedMax
                        ? (state.map.length)
                        : (state.map.length + 1),
                    itemBuilder: (context, index) {
                      if (index < (state.map.length)) {
                        String name = map[index]["displayname"];
                        String? picture = map[index]["picture"];
                        picture ??= "";
                        if (picture.contains("assets")) picture = "";
                        String logo = map[index]["icon:text"];
                        String bgColor = map[index]["icon:bgColor"];
                        bgColor = bgColor.substring(1);
                        bgColor = "0xff$bgColor";
                        String status = map[index]["status"];
                        int uid = map[index]["uid"];
                        final DateTime last =
                            DateTime.fromMillisecondsSinceEpoch(
                                map[index]["lastonline"]);
                        String lastonline = dateFormater(last);
                        return UsersTile(
                          uid: uid,
                          bgColor: bgColor,
                          name: name,
                          picture: picture,
                          status: status,
                          logo: logo,
                          timestamp: lastonline,
                        );
                      } else {
                        return const BottomLoader();
                      }
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
        } else if (state is FailedToLoadUsersData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Users"),
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
        } else {
          return Scaffold(
            appBar: AppBar(
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
      }),
    );
  }
}
