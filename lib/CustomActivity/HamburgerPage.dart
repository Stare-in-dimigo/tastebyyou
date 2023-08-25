import 'package:flutter/material.dart';

import '../colors.dart';
import 'CustomRecipe.dart';

class HamburgerPage extends StatefulWidget {
  const HamburgerPage({Key? key}) : super(key: key);

  @override
  _HamburgerPageState createState() => _HamburgerPageState();
}

class _HamburgerPageState extends State<HamburgerPage> {
  int selectedBunImageIndex = -1;
  int selectedPattyImageIndex = -1;
  int selectedSauceImageIndex = -1;
  int selectedToppingImageIndex = -1;

  List<String> bunImages = [
    'basicbun.png',
    'blackbun.png',
    'redbun.png',
  ];

  List<String> pattyImages = [
    'beef.png',
    'chicken.png',
    'shrimp.png',
  ];

  List<String> sauceImages = [
    'tomatos.png',
    'mayo.png',
    'mustard.png',
    'teriyaki.png',
    'chili.png',
  ];

  List<String> toppingImages = [
    'lettuce.png',
    'cheese.png',
    'onion.png',
    'ham.png',
    'tomato.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 0, 100),
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
                    'Hamburger',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomRecipe()),
                          );
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 16,
                            color: tby4,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                        decoration: BoxDecoration(
                          color: tby4,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: tby5,
                            width: 1,
                          ),
                        ),
                        child: const Text(
                          '999kcal',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Degrees of steak doneness',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bunImages.length,
                itemBuilder: (context, index) {
                  String imagePath =
                      'assets/images/hamburgerPage/' + bunImages[index];
                  if (index == selectedBunImageIndex) {
                    imagePath = imagePath.replaceFirst('.png', '-s.png');
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBunImageIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(imagePath, width: 120),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Patty',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pattyImages.length,
                itemBuilder: (context, index) {
                  String imagePath =
                      'assets/images/hamburgerPage/' + pattyImages[index];
                  if (index == selectedPattyImageIndex) {
                    imagePath = imagePath.replaceFirst('.png', '-s.png');
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPattyImageIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(imagePath, width: 120),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Sauce',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sauceImages.length,
                itemBuilder: (context, index) {
                  String imagePath =
                      'assets/images/hamburgerPage/' + sauceImages[index];
                  if (index == selectedSauceImageIndex) {
                    imagePath = imagePath.replaceFirst('.png', '-s.png');
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSauceImageIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(imagePath, width: 120),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Toppings',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toppingImages.length,
                itemBuilder: (context, index) {
                  String imagePath =
                      'assets/images/hamburgerPage/' + toppingImages[index];
                  if (index == selectedToppingImageIndex) {
                    imagePath = imagePath.replaceFirst('.png', '-s.png');
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedToppingImageIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(imagePath, width: 120),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
