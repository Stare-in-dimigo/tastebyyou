import 'package:flutter/material.dart';

import '../colors.dart';
import 'progressPage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<String> paymentOptions = [
    'Master Card',
    'Visa',
    'Paypal',
    'Toss Pay',
  ];

  final List<AssetImage> paymentImages = [
    AssetImage('assets/images/orderPage/master.png'),
    AssetImage('assets/images/orderPage/visa.png'),
    AssetImage('assets/images/orderPage/paypal.png'),
    AssetImage('assets/images/orderPage/toss.png'),
  ];

  int selectedOptionIndex = -1;

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
                    'Payment',
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
            const SizedBox(height: 30),
            ...List.generate(paymentOptions.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptionIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: selectedOptionIndex == index ? tby5 : btn,
                    ),
                    child: Row(
                      children: [
                        Image(image: paymentImages[index], width: 40), // 이미지 추가
                        SizedBox(width: 10),
                        Text(
                          paymentOptions[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: selectedOptionIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: selectedOptionIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressPage()),
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
