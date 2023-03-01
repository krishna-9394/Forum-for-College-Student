// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_bb_application/business_logics/auth/auth_bloc.dart';
import 'package:node_bb_application/business_logics/category/category_bloc.dart';
import 'package:node_bb_application/presentation/screens/auth/login_page.dart';
import 'package:node_bb_application/presentation/screens/auth/signup_page.dart';
import 'package:node_bb_application/presentation/screens/category_list.dart';
import 'package:node_bb_application/presentation/screens/chat/chat_room.dart';
import 'package:node_bb_application/presentation/screens/group_page.dart';
import 'package:node_bb_application/presentation/screens/home_page.dart';
import 'package:node_bb_application/presentation/screens/users_page.dart';

import 'business_logics/users/users_bloc.dart';

void main() async {
  // TODO 1: how to initialize the hive and firebase while showing the splash screen
  WidgetsFlutterBinding.ensureInitialized();
  // // initializing the Hive into the app
  // await Hive.initFlutter();
  // // initializing the Firebase with the app
  // await Firebase.initializeApp();
  // Hive.registerAdapter(TripAdapter());
  // Hive.registerAdapter(UserAdapter());
  // Hive.registerAdapter(TransactionAdapter());
  // to lock the screen to portrait mode only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CategoryBloc>(create: (context) => CategoryBloc()),
          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
          BlocProvider<UsersBloc>(create: (context) => UsersBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Node BB Forum',
          // the list of routes in which user will traverse
          theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.blue.shade300;
              } else if (states.contains(MaterialState.pressed)) {
                return Colors.blue.shade300;
              } else if (states.contains(MaterialState.selected)) {
                return Colors.white54;
              } else {
                return Colors.blue;
              }
            }))),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white70,
              elevation: 0,
              shadowColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              actionsIconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
          ),
          routes: {
            HomePage.id: (context) => const HomePage(),
            LoginPage.id: (context) => LoginPage(),
            SignUpPage.id: (context) => SignUpPage(),
            CategoryList.id: (context) => CategoryList(),
            UsersList.id: (context) => const UsersList(),
            Groups.id: (context) => const Groups(),
          },
          home: LoginPage(),
        ));
  }
}
