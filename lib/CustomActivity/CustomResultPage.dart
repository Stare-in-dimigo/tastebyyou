import 'package:flutter/material.dart';

import '../colors.dart';
import '../main.dart';

class CustomResultPage extends StatefulWidget {
  const CustomResultPage({Key? key}) : super(key: key);

  @override
  _CustomResultPageState createState() => _CustomResultPageState();
}

class _CustomResultPageState extends State<CustomResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 100),
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Share your recipe!',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1,
                      ),
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
                                  '123456',
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
                  const SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // 첫 번째 버튼의 액션
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: btn,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "Save",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // 두 버튼 사이의 간격
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // 두 번째 버튼의 액션
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: tby5,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "Share",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        "Go back home",
                        style: TextStyle(
                          fontSize: 16,
                          color: tby4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
