import 'package:first_project/models/catalog.dart';
import 'package:first_project/screens/HomeScreen.dart';
import 'package:first_project/screens/cart_screen.dart';
import 'package:first_project/screens/detail_screen.dart';
import 'package:first_project/screens/login_screen.dart';
import 'package:first_project/utils/my_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: Myroutes.homeRoute,
      routes: {
        Myroutes.homeRoute: (context) => HomeScreen(),
        Myroutes.loginRoute: (context) => LoginScreen(),
        Myroutes.cartRoute: (context) => CartScreen(),
      },
    );
  }
}
