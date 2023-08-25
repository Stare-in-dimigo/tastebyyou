import 'package:flutter/material.dart';

import '../colors.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  int selectedSteakImageIndex = -1;
  int selectedGarnishImageIndex = -1;

  List<String> steakImages = [
    'r.png',
    'mr.png',
    'm.png',
    'mw.png',
    'w.png',
  ];

  List<String> garnishImages = [
    'tomato.png',
    'asparagus.png',
    'paprika.png',
    'mushroom.png',
    'salad.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_ios, color: tby5)),
                  Expanded(child: Container()),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: tby5,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      '999kcal',
                      style: TextStyle(
                        fontSize: 16,
                        color: tby5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/customPage/pinimg.png',
                    height: 350,
                  ),
                  // 오른쪽 위 텍스트
                  const Positioned(
                      top: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '060307',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '2023-08-19',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                  // 왼쪽 아래 텍스트
                  const Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      'My first\nrecipe',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'About this recipe',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: btn,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('This is very delicious hamburger recipe!!!')),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ingredients used',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Image.asset('assets/images/hamburgerPage/blackbun-s.png',
                      width: 120),
                  Image.asset('assets/images/hamburgerPage/beef-s.png',
                      width: 120),
                  Image.asset('assets/images/hamburgerPage/tomatos-s.png',
                      width: 120),
                  Image.asset('assets/images/hamburgerPage/cheese-s.png',
                      width: 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
