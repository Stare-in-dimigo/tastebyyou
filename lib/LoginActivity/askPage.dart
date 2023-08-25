import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';

import '../colors.dart';
import '../main.dart';
import 'allergies.dart';
import 'languageSelect.dart';
import 'veganSelect.dart';

class AskPage extends StatefulWidget {
  const AskPage({Key? key}) : super(key: key);

  @override
  _AskPageState createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  final PageController _controller = PageController(initialPage: 0);
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _buildBody(),
        );
      },
      clipBehavior: Clip.hardEdge,
      maximumSize: Size(475.0, 812.0),
      enabled: kIsWeb,
      backgroundColor: tby3,
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              PageView(
                controller: _controller,
                onPageChanged: (int index) {
                  _currentPageNotifier.value = index;
                },
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  LanguageSelect(controller: _controller),
                  VeganSelect(controller: _controller),
                  AllergiesSelect(controller: _controller),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: ValueListenableBuilder<int>(
                    valueListenable: _currentPageNotifier,
                    builder: (BuildContext context, int currentPage, _) {
                      return _buildPageIndicator(currentPage);
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFFFE8244)),
                    onPressed: () {
                      if (_currentPageNotifier.value > 0) {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 10, 0),
                  child: IconButton(
                    icon: const Icon(Icons.close_rounded,
                        size: 30, color: Color(0xFFFE8244)),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator(int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < 3; i++) _buildPageDot(i == currentPage),
      ],
    );
  }

  Widget _buildPageDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: isActive ? tby5 : btn,
        shape: BoxShape.circle,
      ),
    );
  }
}
