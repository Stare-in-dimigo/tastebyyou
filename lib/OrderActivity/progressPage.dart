import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import '../colors.dart';
import 'sharePage.dart';
import 'package:firebase_database/firebase_database.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int currentIndex = 0; // 현재 색칠된 점의 인덱스
  int recipeIndex = 2;
  String time = "15 minutes left";
  String process = "Preparing ingredient";
  final usersRef = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    startTimer(); // 타이머 시작
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (currentIndex <= 4) {
        final snapshot =
            await usersRef.child('recipe/steak/$recipeIndex').get();
        switch (currentIndex) {
          case 0:
            time = "8 minutes left";
          case 1:
            time = "5 minutes left";
          case 2:
            time = "1 minutes left";
          case 3:
            time = "10 seconds left";
          case 4:
            time = "check your meal";
        }
        setState(() {
          currentIndex++; // currentIndex 증가
          recipeIndex++;
          process = snapshot.value.toString();
        });
      } else {
        timer.cancel(); // 4까지 도달하면 타이머 종료
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  const Text(
                    'Progress',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(30, 30, 30, 15),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: index == currentIndex ? tby5 : Colors.white,
                    // 현재 인덱스와 일치하면 색칠
                    border: Border.all(color: tby5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
            Center(
              child: Text(
                'Resting',
                style: TextStyle(
                  fontSize: 18,
                  color: tby5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(10.0), // 둥글게 만들고 싶은 테두리의 반경을 10.0으로 설정
              child: Image.asset(
                'assets/images/orderPage/progress.png',
              ),
            ),
            const SizedBox(height: 30),
            Text(
              '$process',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                if (currentIndex == 5) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SharePage()),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: tby5,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "$time",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
