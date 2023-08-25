import 'package:flutter/material.dart';

import '../colors.dart';
import 'selectIngredientPage.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: -10,
          right: -100,
          child: Image.asset(
            'assets/images/ellipse-top.png',
            height: 550,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            'assets/images/ellipse-bottom.png',
            height: 550,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Make your own recipe!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Make your own recipe\nand share it with your friends.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff767676),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 70),
                    Image.asset(
                      'assets/images/customPage/custom.png',
                      height: 300,
                    ),
                    const SizedBox(height: 70),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectIngredientPage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: tby5,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "Let’s go!",
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
              )
            ],
          ),
        ),
      ],
    ));
  }
}
