import 'package:flutter/material.dart';
import 'package:tastebyyou/CustomActivity/blockCodePage.dart';

import '../colors.dart';
import '../models/activity.dart';

class SelectIngredientPage extends StatefulWidget {
  const SelectIngredientPage({Key? key}) : super(key: key);

  @override
  _SelectIngredientPageState createState() => _SelectIngredientPageState();
}

class _SelectIngredientPageState extends State<SelectIngredientPage> {
  List<bool> selectedBunImages = List.filled(5, false);
  List<bool> selectedPattyImages = List.filled(4, false);
  List<bool> selectedSauceImages = List.filled(5, false);
  List<bool> selectedToppingImages = List.filled(5, false);

  List<String> bunImages = [
    'seaweed.png',
    'gim.png',
    'kelp.png',
    'anchovy.png',
    'shrimp.png',
  ];

  List<String> pattyImages = [
    'cream.png',
    'milk.png',
    'butter.png',
    'cheese.png',
  ];

  List<String> sauceImages = [
    'chicken.png',
    'porkbelly.png',
    'tenderloin.png',
    'rib.png',
    'sirloin.png',
  ];

  List<String> toppingImages = [
    'onion.png',
    'carrot.png',
    'cucumber.png',
    'garlic.png',
    'mushroom.png',
  ];

  List<Ingredient> ingredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    Expanded(child: Container()),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BlockCodePage(ingredients)),
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
              buildCategory('Seafood', bunImages, selectedBunImages),
              const SizedBox(height: 20),
              buildCategory('Dairy product', pattyImages, selectedPattyImages),
              const SizedBox(height: 20),
              buildCategory('Meat', sauceImages, selectedSauceImages),
              const SizedBox(height: 20),
              buildCategory('Vegetable', toppingImages, selectedToppingImages),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategory(
      String title, List<String> images, List<bool> selectedImages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              String imagePath = 'assets/images/hamburgerPage/' + images[index];
              if (selectedImages[index]) {
                imagePath = imagePath.replaceFirst('.png', '-s.png');
              }
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImages[index] = !selectedImages[index];

                    if (selectedImages[index]) {
                      if (title == "Seafood") {
                        index += 14;
                      } else if (title == "Dairy product") {
                        index += 10;
                      } else if (title == "Meat") {
                        index += 5;
                      }

                      ingredients.add(Ingredient.values[index]);
                    } else {
                      if (title == "Seafood") {
                        index += 14;
                      } else if (title == "Dairy product") {
                        index += 10;
                      } else if (title == "Meat") {
                        index += 5;
                      }

                      ingredients.remove(Ingredient.values[index]);
                    }
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
    );
  }
}
