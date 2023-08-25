import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:tastebyyou/LoginActivity/askPage.dart';

import '../main.dart';
import '../colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    isLoggedIn = true;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AskPage()),
                    );
                  },
                  child: Text('로그인'),
                ),
              ],
            ),
          ),
        );
      },
      clipBehavior: Clip.hardEdge,
      maximumSize: Size(475.0, 812.0),
      enabled: kIsWeb,
      backgroundColor: tby3,
    );
  }
}
