import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:tastebyyou/BoardActivity/BoardPage.dart';

import 'CustomActivity/CustomPage.dart';
import 'LoginActivity/loginPage.dart';
import 'OrderActivity/orderPage.dart';
import 'colors.dart';
import 'firebase_options.dart';
import 'homePage.dart';
import 'profilePage.dart';

bool userLanguage = true;
bool isLoggedIn = false;
bool isVegan = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (Platform.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
    }
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TasteByYou',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 2);
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _selectedIndex = _pageController.page!.round();
      });
    });

    if (!isLoggedIn) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height;
    if (kIsWeb) {
      height = 80;
    } else {
      height = Platform.isAndroid ? 80 : 100;
    }
    return FlutterWebFrame(
      builder: (context) {
        return MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  children: const [
                    OrderPage(),
                    CustomPage(),
                    HomePage(),
                    BoardPage(),
                    ProfilePage(),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: tby5,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              _selectedIndex == 0
                                  ? Icons.storefront_rounded
                                  : Icons.storefront_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              _pageController.animateToPage(0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              _selectedIndex == 1
                                  ? Icons.precision_manufacturing_rounded
                                  : Icons.precision_manufacturing_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              _pageController.animateToPage(1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              _selectedIndex == 2
                                  ? Icons.home_rounded
                                  : Icons.home_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              _pageController.animateToPage(2,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              _selectedIndex == 3
                                  ? Icons.note_alt_rounded
                                  : Icons.note_alt_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              _pageController.animateToPage(3,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              _selectedIndex == 4
                                  ? Icons.person_rounded
                                  : Icons.person_outline_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              _pageController.animateToPage(4,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
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
