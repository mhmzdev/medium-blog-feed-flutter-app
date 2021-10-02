import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medium_blog_app/view/blogFeed.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlogFeed(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/logo.png",
            height: 100,
            width: 100,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Medium Blog Feed",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}
