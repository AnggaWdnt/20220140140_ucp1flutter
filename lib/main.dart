import 'package:flutter/material.dart';
import 'package:ucp1flutter_20220140140/loginpage.dart';
import 'package:ucp1flutter_20220140140/registerpage.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => RegisterPage(), 
        '/login': (context) => LoginPage(), 
      },
    );
  }
}
