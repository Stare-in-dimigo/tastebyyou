import 'package:flutter/material.dart';

import '../colors.dart';

class TopRecipesPage extends StatefulWidget {
  const TopRecipesPage({Key? key}) : super(key: key);

  @override
  _TopRecipesPageState createState() => _TopRecipesPageState();
}

class _TopRecipesPageState extends State<TopRecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios, color: tby5)),
                const Text(
                  'Top 10 recipes',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                // 세로 간격
                crossAxisSpacing: 0,
                // 가로 간격
                childAspectRatio: 3 / 4,
                // 비율을 4:3으로 설정
                children: List.generate(4, (index) {
                  // Define the image names in the desired order
                  final List<String> imageNames = [
                    'customburger',
                    'custombibimbap',
                    'custompizza',
                    'customsushi',
                    'customkimchi',
                    'customramen',
                  ];
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        // Navigate to HamburgerPage if the hamburger image is tapped
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => HamburgerPage()),
                        // );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/customPage/${imageNames[index]}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
