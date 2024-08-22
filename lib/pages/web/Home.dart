import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:myportfolio/pages/web/Component/contactContainer.dart';
import 'package:myportfolio/pages/web/Component/homeContainer.dart';
import 'package:myportfolio/pages/web/Component/projectContainer.dart';
import 'package:myportfolio/pages/web/Component/serviceContainer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int isSelected = 0;

  ScrollController scrollController = ScrollController();

  bool isFrench = false;

  bool isBright = true;

  Map<String, String>? localizedStrings;

  String languageCodeFr = "fr";
  String languageCodeEn = "en";

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_updateCurrentIndex);
  }

  @override
  void dispose() {
    scrollController.removeListener(_updateCurrentIndex);
    scrollController.dispose();
    super.dispose();
  }

  void _updateCurrentIndex() {
    print('UPDATE INDEX');
    if (scrollController.position.pixels >= 0 &&
        scrollController.position.pixels < 900) {
      setState(() {
        isSelected = 0;
      });
    } else if (scrollController.position.pixels >= 900 &&
        scrollController.position.pixels < 1800) {
      setState(() {
        isSelected = 1;
      });
    } else if (scrollController.position.pixels >= 1800 &&
        scrollController.position.pixels < 2500) {
      setState(() {
        isSelected = 2;
      });
    } else if (scrollController.position.pixels >= 2500) {
      setState(() {
        isSelected = 3;
      });
    }
    print('POS : ${scrollController.position.pixels}');
    print('IS SELECTED: $isSelected');
  }

  String getTranslatedText(String key) {
    return Intl.message(
      key,
      name: 'appTranslations',
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    print('WIDTH: $width');

    return Scaffold(
      backgroundColor: isBright
          ? const Color.fromARGB(255, 235, 235, 235)
          : const Color.fromARGB(255, 65, 65, 65),
      //backgroundColor: const Color.fromARGB(255, 54, 54, s54),
      appBar: AppBar(
        backgroundColor: isBright
            ? const Color.fromARGB(255, 27, 78, 102)
            : const Color.fromARGB(255, 44, 44, 44),
        leadingWidth: 130,
        leading: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  isBright
                      ? const Color.fromARGB(255, 27, 78, 102)
                      : const Color.fromARGB(255, 44, 44, 44),
                ),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                      // Définissez le rayon de la bordure ici
                      ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(40.0, 30.0)),
              ),
              onPressed: () async {
                window.open(
                    'https://drive.google.com/file/d/1Y5F-1giICrbQg3TEEDzXIBFQDmBKbKU7/view?usp=sharing',
                    '_blank');
                window.console;
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.download,
                    size: 40,
                    color: Colors.white,
                  ),

                  /*Text(
                    'CV',
                    textScaleFactor: 1.4,
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253),
                      fontWeight: FontWeight.w500,
                    ),
                  ),*/
                ],
              )),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    scrollToContent(context, 0);
                    isSelected = 0;
                  });
                },
                child: Container(
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 2,
                            color: (isSelected == 0)
                                ? Colors.white
                                : Colors.transparent)),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Home',
                    style: TextStyle(
                        color: (isSelected == 0)
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 206, 206, 206),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    scrollToContent(context, 1);
                    isSelected = 1;
                  });
                },
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 2,
                            color: (isSelected == 1)
                                ? Colors.white
                                : Colors.transparent)),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Services',
                    style: TextStyle(
                        color: (isSelected == 1)
                            ? Colors.white
                            : const Color.fromARGB(255, 206, 206, 206),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    scrollToContent(context, 2);
                    isSelected = 2;
                  });
                },
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 2,
                            color: (isSelected == 2)
                                ? Colors.white
                                : Colors.transparent)),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Projects',
                    style: TextStyle(
                        color: (isSelected == 2)
                            ? Colors.white
                            : const Color.fromARGB(255, 206, 206, 206),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    scrollToContent(context, 3);
                    isSelected = 3;
                  });
                },
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 2,
                            color: (isSelected == 3)
                                ? Colors.white
                                : Colors.transparent)),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Contacts',
                    style: TextStyle(
                        color: (isSelected == 3)
                            ? Colors.white
                            : const Color.fromARGB(255, 206, 206, 206),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: isBright
                    ? const Icon(
                        Icons.nightlight_rounded,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.brightness_5_rounded,
                        color: Colors.white,
                      ),
                onPressed: () {
                  setState(() {
                    isBright = !isBright;
                  });
                },
              ))
        ],
      ),
      body: ListView(
        controller: scrollController,
        children: [
          FirstContainer(
            isBright: isBright,
          ),
          SecondContainer(isBright: isBright),
          ThirdContainer(
            isBright: isBright,
          ),
          ContactContainer(isBright: isBright)
        ],
      ),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  void scrollToContent(BuildContext context, int index) {
    final double appBarHeight = kToolbarHeight;
    final double screenHeight = MediaQuery.of(context).size.height;
    double position = 0.0;
    if (index == 0) {
      position = 0;
    }
    if (index == 1) {
      position = appBarHeight + index * screenHeight - (appBarHeight - 200);
    } else if (index == 2) {
      position = appBarHeight + index * screenHeight - (appBarHeight - 300);
    } else {
      position = appBarHeight + index * screenHeight + 200;
    }

    print("POSITION: $position");

    scrollController.animateTo(position - 56,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
