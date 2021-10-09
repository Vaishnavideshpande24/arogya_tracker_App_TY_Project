import 'file:///C:/Users/vaishnavi/Desktop/arogyatracker/lib/Extra/PostHomePage.dart';
import 'package:arogyatracker/Splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arogyatracker/loginScreen.dart';
import 'package:arogyatracker/tasks.dart';
import 'package:arogyatracker/Splashscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        primarySwatch: Colors.pink,
        accentColor: Colors.pink,
      ),
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          FirebaseUser user = snapshot.data;
          return TasksPage();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}