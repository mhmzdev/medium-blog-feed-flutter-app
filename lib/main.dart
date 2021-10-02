import 'package:flutter/material.dart';
import 'package:medium_blog_app/view/splashView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medium Blog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashView(),
    );
  }
}
