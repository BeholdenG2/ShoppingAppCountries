import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:product_app/screens/home_page.dart';
import 'package:product_app/screens/products_screen.dart';
import 'package:product_app/screens/shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:product_app/Screens/taken_picture_screen.dart';
import 'package:product_app/screens/stores_screen.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  final first = cameras.first;

  runApp(SqliteApp(
    firstCamera: first,
  ));
}

class SqliteApp extends StatelessWidget {
  final CameraDescription firstCamera;

  const SqliteApp({Key? key, required this.firstCamera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQLite Example',
      initialRoute: 'home',
      routes: {
        'home': (context) => StoresWidget()

        /*'home': (context) => HomePageWidget(
              firstCamera: firstCamera,
            )*/

         /* 'home':(context) => TakenPictureScreen(
             camera: firstCamera,) */

         /* 'home': (context) => HomeScreen(
               firstCamera: firstCamera,
             ) */
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
        color: Color(0xFF907761),
      )),
    );
  }
}