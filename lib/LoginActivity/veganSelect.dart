import 'package:flutter/material.dart';

import '../colors.dart';
import '../main.dart';

class VeganSelect extends StatefulWidget {
  final PageController controller;

  VeganSelect({Key? key, required this.controller}) : super(key: key);

  @override
  _VeganSelectState createState() => _VeganSelectState();
}

class _VeganSelectState extends State<VeganSelect> {
  bool isVeganSelected = false;
  bool isNotVeganSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 130, 30, 100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userLanguage ? "Are you a\nvegetarian?" : "혹시\n채식주의자신가요?",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: -1,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      userLanguage
                          ? "If you are a vegetarian,\nWe'll recommend vegan foods."
                          : "비건푸드를 추천해드릴게요.",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: -1,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/images/loginPage/vegan.png',
                height: 200,
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                setState(() {
                  isVeganSelected = true; // 색상 변경
                });
                isVegan = true;
                Future.delayed(const Duration(seconds: 1), () {
                  widget.controller.animateToPage(
                    widget.controller.page!.toInt() + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isVeganSelected ? tby5 : btn,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  userLanguage ? "Vegan" : "네, 채식주의자예요.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        isVeganSelected ? FontWeight.bold : FontWeight.normal,
                    color: isVeganSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  isNotVeganSelected = true; // 색상 변경
                });
                isVegan = true;
                Future.delayed(const Duration(seconds: 1), () {
                  widget.controller.animateToPage(
                    widget.controller.page!.toInt() + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isNotVeganSelected ? tby5 : btn,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  userLanguage ? "Not Vegan" : "아니요, 채식주의자가 아니에요.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isNotVeganSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isNotVeganSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
