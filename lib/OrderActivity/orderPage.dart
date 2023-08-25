import 'package:flutter/material.dart';

import 'steakPage.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order',
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Western',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SteakPage()),
                      );
                    },
                    child: Image.asset('assets/images/orderPage/steak.png',
                        width: 120),
                  ),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/chicken.png',
                      width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/hamburger.png',
                      width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/pasta.png', width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/pizza.png', width: 120),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Korean',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Image.asset('assets/images/orderPage/kimchi.png', width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/bibimbap.png',
                      width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/noodle.png', width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/spicy.png', width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/rib.png', width: 120),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Japanese',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Image.asset('assets/images/orderPage/sushi.png', width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/udon.png', width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/ramen.png', width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/gyudon.png', width: 120),
                  SizedBox(width: 10),
                  Image.asset('assets/images/orderPage/pork.png', width: 120),
                ],
              ),
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
