import 'package:flutter/material.dart';

import '../colors.dart';
import '../main.dart';

class AllergiesSelect extends StatefulWidget {
  final PageController controller;

  AllergiesSelect({Key? key, required this.controller}) : super(key: key);

  @override
  _AllergiesSelectState createState() => _AllergiesSelectState();
}

class _AllergiesSelectState extends State<AllergiesSelect> {
  List<bool> isSelected = List.filled(allergyItems.length, false);

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
                      userLanguage
                          ? "Do you have\nany allergies?"
                          : "혹시\n알러지가 있으신가요??",
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
                          ? "I'll cook without the foods\nyou're allergic to"
                          : "해당 재료 없이 조리해드릴게요.",
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
                'assets/images/loginPage/egg.png',
                height: 200,
              ),
            ),
            Expanded(child: Container()),
            Wrap(
              children: List.generate(allergyItems.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected[index] = !isSelected[index];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected[index] ? tby5 : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: tby5,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        userLanguage
                            ? allergyItems[index].en
                            : allergyItems[index].kr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected[index]
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected[index] ? Colors.white : tby5,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

List<AllergyItem> allergyItems = [
  AllergyItem(en: 'egg', kr: '난류'),
  AllergyItem(en: 'beef', kr: '소고기'),
  AllergyItem(en: 'poke', kr: '돼지고기'),
  AllergyItem(en: 'chicken', kr: '닭고기'),
  AllergyItem(en: 'shrimp', kr: '새우'),
  AllergyItem(en: 'crab', kr: '게'),
  AllergyItem(en: 'squid', kr: '오징어'),
  AllergyItem(en: 'mackerel', kr: '고등어'),
  AllergyItem(en: 'shellfish', kr: '조개류'),
  AllergyItem(en: 'milk', kr: '우유'),
  AllergyItem(en: 'peanut', kr: '땅콩'),
  AllergyItem(en: 'walnut', kr: '호두'),
  AllergyItem(en: 'pine nuts', kr: '잣'),
  AllergyItem(en: 'soybean', kr: '대두'),
];

class AllergyItem {
  final String en;
  final String kr;

  AllergyItem({required this.en, required this.kr});
}
