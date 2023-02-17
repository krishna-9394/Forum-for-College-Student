// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_bb_application/business_logics/category/category_bloc.dart';
import 'package:node_bb_application/presentation/screens/auth/login_page.dart';
import 'package:node_bb_application/presentation/screens/auth/signup_page.dart';
import 'package:node_bb_application/presentation/screens/category_list.dart';
import 'package:node_bb_application/presentation/screens/group_page.dart';
import 'package:node_bb_application/presentation/screens/home_page.dart';
import 'package:node_bb_application/presentation/screens/users_page.dart';

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
  // // to lock the screen to portrait mode only
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CategoryBloc>(create: (context) => CategoryBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Node BB Forum',
          // the list of routes in which user will traverse
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.deepPurpleAccent,
              secondary: const Color(0xFFFFC107),
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
