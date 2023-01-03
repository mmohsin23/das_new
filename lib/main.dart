import 'package:example/authentication_control.dart';
import 'package:example/gender.dart';
import 'package:example/loading_screen.dart';
import 'package:example/login_page.dart';
import 'package:example/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:example/login_page.dart';
// import 'package:example/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:example/gender.dart';
// import 'package:example/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDv_gK9JGJwRpKrdHovpmotDWTMwAjS6vg",
        appId: "1:742490401651:android:4d50c6c0d2d1960c3ab306",
        messagingSenderId: "742490401651",
        projectId: "das-getx-app"),
  ).then((value) => Get.put(DasAuth()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'DAS Analysis App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          "/": (context) => const Body(),
          "/LoginPage": (context) => const LoginPage(),
          "/SignupPage1": (context) => const SignupPage1(),
          "/SignupPage2": (context) => const SignupPage2(),
          "/Gender": (context) => const GenderPage(),
        });
  }
}
