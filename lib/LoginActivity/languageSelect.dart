import 'package:flutter/material.dart';

import '../colors.dart';
import '../main.dart';

class LanguageSelect extends StatefulWidget {
  final PageController controller;

  LanguageSelect({Key? key, required this.controller}) : super(key: key);

  @override
  _LanguageSelectState createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  bool isEnglishSelected = false;
  bool isKoreanSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 130, 30, 100),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose\nthe language",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: -1,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Select the language to get started.",
                      style: TextStyle(
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
            Image.asset(
              'assets/images/loginPage/earth.png',
              height: 250,
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                setState(() {
                  isEnglishSelected = true; // 색상 변경
                });
                userLanguage = true; // eng
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
                  color: isEnglishSelected ? tby5 : btn,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/loginPage/usa.png',
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'English',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isEnglishSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isEnglishSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  isKoreanSelected = true; // 색상 변경
                });
                userLanguage = false; // kor
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
                  color: isKoreanSelected ? tby5 : btn,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/loginPage/kr.png',
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '한국어',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isKoreanSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isKoreanSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
