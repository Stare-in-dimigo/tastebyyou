import 'package:flutter/material.dart';
import 'package:tastebyyou/CustomActivity/CustomRecipe.dart';

import '../colors.dart'; // Make sure to import your color definitions file
import '../models/activity.dart';

class BlockCodePage extends StatefulWidget {
  final List<Ingredient> ingredients;

  const BlockCodePage(this.ingredients, {Key? key}) : super(key: key);

  List<String> getIngredientNames(List<Ingredient> ingredients) {
    List<String> result = [];
    for (var ing in ingredients) {
      result.add(ing.name);
    }
    return result;
  }

  @override
  _BlockCodePageState createState() =>
      _BlockCodePageState(getIngredientNames(ingredients), [
        getIngredientNames(ingredients)[0],
        '100g',
        'Boil',
        '10 mins',
        '100°C',
        'Salt'
      ], [
        [
          getIngredientNames(ingredients)[0],
          '100g',
          'Boil',
          '10 mins',
          '100°C',
          'Salt'
        ]
      ]);
}

class _BlockCodePageState extends State<BlockCodePage> {
  List<String> ingredientNames = [];
  List<String> amount = ['100g', '200g', '300g'];
  List<String> cookingMethod = ['Boil', 'Fry', 'Grill'];
  List<String> cookingTime = ['10 mins', '20 mins', '30 mins'];
  List<String> temperature = ['100°C', '150°C', '200°C'];
  List<String> seasoning = ['Salt', 'Pepper', 'Sugar'];

  _BlockCodePageState(this.ingredientNames, this.initialBlock, this.blocks);

  List<String> initialBlock = [];
  List<List<String>> blocks = [];

  void _addBlock() {
    setState(() {
      blocks.add(initialBlock);
    });
  }

  void _resetBlocks() {
    setState(() {
      blocks = [initialBlock];
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
                    'Custom recipe',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(onPressed: _resetBlocks, icon: Icon(Icons.delete)),
                  // Delete button
                ],
              ),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              child: Column(
                children: blocks.asMap().entries.map((entry) {
                  int index = entry.key;
                  List<String> selectedOptions = entry.value;
                  String imagePath = index % 2 == 0
                      ? 'assets/images/block.png'
                      : 'assets/images/block2.png';

                  return _buildImageWithGrid(imagePath, selectedOptions);
                }).toList(),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _addBlock,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: tby5,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Add block",
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
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomRecipe(),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: btn,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Done",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithGrid(String imagePath, List<String> selectedOptions) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(imagePath),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDropdownContainer(0,
                    options: ingredientNames,
                    selectedOptions: selectedOptions,
                    color: tby1),
                SizedBox(width: 10),
                _buildDropdownContainer(1,
                    options: amount,
                    selectedOptions: selectedOptions,
                    color: tby1),
                SizedBox(width: 10),
                _buildDropdownContainer(2,
                    options: cookingMethod,
                    selectedOptions: selectedOptions,
                    color: tby1),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDropdownContainer(3,
                    options: cookingTime,
                    selectedOptions: selectedOptions,
                    color: btn),
                SizedBox(width: 10),
                _buildDropdownContainer(4,
                    options: temperature,
                    selectedOptions: selectedOptions,
                    color: btn),
                SizedBox(width: 10),
                _buildDropdownContainer(5,
                    options: seasoning,
                    selectedOptions: selectedOptions,
                    color: btn),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownContainer(int index,
      {required List<String> options,
      required List<String> selectedOptions,
      required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: selectedOptions[index],
        items: options.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedOptions[index] = value!;
          });
        },
        underline: Container(),
        dropdownColor: color,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
