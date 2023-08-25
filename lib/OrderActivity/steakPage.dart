import 'package:flutter/material.dart';
import 'package:tastebyyou/OrderActivity/paymentPage.dart';

import '../colors.dart';

class SteakPage extends StatefulWidget {
  const SteakPage({Key? key}) : super(key: key);

  @override
  _SteakPageState createState() => _SteakPageState();
}

class _SteakPageState extends State<SteakPage> {
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
                    'Steak',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  ),
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
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Degrees of steak doneness',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: steakImages.length,
                itemBuilder: (context, index) {
                  String imagePath =
                      'assets/images/steakPage/' + steakImages[index];
                  if (index == selectedSteakImageIndex) {
                    imagePath = imagePath.replaceFirst('.png', '-s.png');
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSteakImageIndex = index;
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
              'Garnish',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: garnishImages.length,
                itemBuilder: (context, index) {
                  String imagePath =
                      'assets/images/steakPage/' + garnishImages[index];
                  if (index == selectedGarnishImageIndex) {
                    imagePath = imagePath.replaceFirst('.png', '-s.png');
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGarnishImageIndex = index;
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
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: tby5,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Order",
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
    );
  }
}
