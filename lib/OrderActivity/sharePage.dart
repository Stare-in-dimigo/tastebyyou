import 'package:flutter/material.dart';
import 'package:tastebyyou/main.dart';

import '../colors.dart'; // tby5 색상을 정의한 파일을 가져옵니다.

class SharePage extends StatefulWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
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
                    'Share',
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
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                // 세로 간격
                crossAxisSpacing: 10,
                // 가로 간격
                childAspectRatio: 3 / 4,
                // 비율을 4:3으로 설정
                children: List.generate(4, (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    // 둥글게 만들고 싶은 테두리의 반경을 10.0으로 설정
                    child: Image.asset(
                      'assets/images/orderPage/pic$index.png',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ),
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
    );
  }
}
