import 'package:flutter/material.dart';

import 'InformationPage.dart';
import 'colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              decoration: BoxDecoration(
                color: tby4,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: tby5.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      const SizedBox(width: 20), // 프로필 사진과 정보 사이의 간격
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center, // 세로 정렬
                        crossAxisAlignment: CrossAxisAlignment.start, // 가로 정렬
                        children: [
                          Row(
                            children: [
                              const Text('User',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: -1)),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text('Vegan',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        letterSpacing: -1)),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Text('ddd@gmail.com',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1,
                                  color: Colors.white))
                        ],
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 45,
                          ))
                    ],
                  ),
                  SizedBox(height: 20),
                  Image.asset('assets/images/followers.png'),
                ],
              )),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Liked recipes',
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
                    'Original resicpes',
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
                          onTap: () {},
                          child: Image.asset(
                              'assets/images/orderPage/steak.png',
                              width: 120),
                        ),
                        const SizedBox(width: 10),
                        Image.asset('assets/images/orderPage/chicken.png',
                            width: 120),
                        const SizedBox(width: 10),
                        Image.asset('assets/images/orderPage/hamburger.png',
                            width: 120),
                        const SizedBox(width: 10),
                        Image.asset('assets/images/orderPage/pasta.png',
                            width: 120),
                        const SizedBox(width: 10),
                        Image.asset('assets/images/orderPage/pizza.png',
                            width: 120),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Custom recipes',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InformationPage()),
                                );
                              },
                              child: Image.asset(
                                'assets/images/likePage/hamburgerlike.png',
                              ),
                            ),
                            const SizedBox(height: 15),
                            Image.asset(
                              'assets/images/likePage/ramenlike.png',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/likePage/bibimbaplike.png',
                            ),
                            const SizedBox(height: 15),
                            Image.asset(
                              'assets/images/likePage/pizzalike.png',
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
