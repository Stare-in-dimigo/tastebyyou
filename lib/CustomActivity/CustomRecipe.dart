import 'package:flutter/material.dart';
import 'package:tastebyyou/CustomActivity/CustomResultPage.dart';

import '../colors.dart';

class CustomRecipe extends StatefulWidget {
  const CustomRecipe({Key? key}) : super(key: key);

  @override
  _CustomRecipeState createState() => _CustomRecipeState();
}

class _CustomRecipeState extends State<CustomRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 80, 20, 100),
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
                    'Recipe',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomResultPage()),
                      );
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 16,
                        color: tby4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'What is the name of this recipe?',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: btn,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'name of this recipe',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Please introduce your recipe!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: btn,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'about your recipe',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Please pick a picture',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              // 둥글게 만들고 싶은 테두리의 반경을 10.0으로 설정
              child: Image.asset(
                'assets/images/hamburgerPage/donehamburger.png',
                width: 300,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
