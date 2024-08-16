import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';
import 'package:myportfolio/utils/Utilities.dart';

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

  bool _isHoveredFlutter = false;
  bool _isHoveredUI = false;
  bool _isHoveredBack = false;

  bool _isHoveredMed = false;
  bool _isHoveredWatch = false;
  bool _isHoveredMedDesign = false;
  bool _isHoveredResp = false;

  AnimationController? _controller;
  Animation<Color?>? _colorAnimation;

  Map<String, String>? localizedStrings;

  String languageCodeFr = "fr";
  String languageCodeEn = "en";

  Locale _locale = const Locale('en');

  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_updateCurrentIndex);
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: const Color.fromARGB(255, 44, 91, 129),
    ).animate(_controller!);
  }

  @override
  void dispose() {
    scrollController.removeListener(_updateCurrentIndex);
    scrollController.dispose();
    _controller!.dispose();
    super.dispose();
  }

  void _updateCurrentIndex() {
    if (scrollController.position.pixels >= 0 &&
        scrollController.position.pixels < 200) {
      setState(() {
        isSelected = 0;
      });
    } else if (scrollController.position.pixels >= 600 &&
        scrollController.position.pixels < 1000) {
      setState(() {
        isSelected = 1;
      });
    } else if (scrollController.position.pixels >= 1500 &&
        scrollController.position.pixels < 1800) {
      setState(() {
        isSelected = 2;
      });
    } else if (scrollController.position.pixels >= 1800) {
      setState(() {
        isSelected = 3;
      });
    }
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
          Container(
              //color: const Color.fromARGB(255, 218, 238, 255),
              height: 990, // Remplacez cela par votre propre contenu

              child: Padding(
                padding: EdgeInsets.only(top: (width < 1350) ? 10 : 130),
                child: Row(
                  children: [
                    if (width < 1000) ...[
                      const Spacer(),
                    ],
                    Padding(
                      padding: EdgeInsets.only(
                          left: (width < 650)
                              ? 20
                              : (width < 1545)
                                  ? 50
                                  : 150),
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.only(top: 0),
                          padding: EdgeInsets.only(
                              top: 20, left: (width < 650) ? 20 : 100),
                          height: (width < 650)
                              ? 70
                              : (width < 1350)
                                  ? 90
                                  : 50,
                          width: (width < 1000)
                              ? MediaQuery.of(context).size.width / 1.2
                              : MediaQuery.of(context).size.width / 2,
                          child: Text(
                            'Bonjour, bienvenue sur mon portfolio',
                            style: TextStyle(
                                color: isBright ? Colors.black : Colors.white,
                                letterSpacing: 4,
                                fontSize: (width < 775) ? 20 : 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: (width < 650) ? 10 : 30,
                              left: (width < 650) ? 20 : 100),
                          height: (width < 650)
                              ? 100
                              : (width < 1350)
                                  ? 150
                                  : 100,
                          width: (width < 1000)
                              ? MediaQuery.of(context).size.width / 1.2
                              : MediaQuery.of(context).size.width / 2,
                          child: Text(
                            'Je m\'appel Franck Mauriat,',
                            style: TextStyle(
                                letterSpacing: 4,
                                color: isBright ? Colors.black : Colors.white,
                                fontSize: (width < 775) ? 26 : 36,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: (width < 650) ? 0 : 40,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: (width < 650) ? 20 : 100),
                              width: (width < 1000)
                                  ? MediaQuery.of(context).size.width / 1.2
                                  : MediaQuery.of(context).size.width / 2,
                              height: (width < 650)
                                  ? 280
                                  : (width < 1000)
                                      ? 170
                                      : (width < 1350)
                                          ? 320
                                          : 170,
                              child: AnimatedTextKit(
                                pause: const Duration(seconds: 4),
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                      speed: const Duration(milliseconds: 80),
                                      'Ma passion ?',
                                      textAlign: (width < 650)
                                          ? TextAlign.center
                                          : TextAlign.start,
                                      textStyle: TextStyle(
                                          color: isBright
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 4)),
                                  TypewriterAnimatedText(
                                      speed: const Duration(milliseconds: 80),
                                      'Transformer les idées en réalité grâce à un développement innovant ! En tant que développeur mobile, Web et Desktop spécialisé dans Flutter.',
                                      textStyle: TextStyle(
                                          color: isBright
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 4)),
                                  TypewriterAnimatedText(
                                      speed: const Duration(milliseconds: 80),
                                      'Pour en savoir plus sur moi, je vous invite à télécharger mon CV.',
                                      textAlign: TextAlign.start,
                                      textStyle: TextStyle(
                                          color: isBright
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 4)),
                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            )),
                        const SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 30, right: (width > 1400) ? 250 : 20),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(232, 32, 85, 128)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Définissez le rayon de la bordure ici
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(250.0, 70.0)),
                            ),
                            onPressed: () async {
                              window.open(
                                  'https://drive.google.com/file/d/1Y5F-1giICrbQg3TEEDzXIBFQDmBKbKU7/view?usp=sharing',
                                  '_blank');
                              window.console;
                            },
                            child: const Text(
                              'Télécharger mon CV',
                              textScaleFactor: 1.6,
                              style: TextStyle(
                                color: Color.fromARGB(255, 253, 253, 253),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 80),
                              //color: Colors.yellow,

                              child: AnimatedBuilder(
                                animation: _controller!,
                                builder: (context, child) {
                                  return Container(
                                    padding: const EdgeInsets.all(20),
                                    height: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: _colorAnimation!.value!,
                                          width: 4),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '"L\'innovation distingue un leader d\'un suiveur." - Steve Jobs',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: isBright
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 7.2,
                            )
                          ],
                        ),
                        const Spacer(),
                      ]),
                    ),
                    Container(
                      child: VerticalDivider(
                        color: isBright
                            ? const Color.fromARGB(255, 83, 83, 83)
                            : Colors.white,
                      ),
                    ),
                    if (width > 790) ...[
                      const Spacer(),
                    ],
                    if (width > 1000) ...[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 0, left: 20, right: (width < 965) ? 10 : 100),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                width: (width < 650)
                                    ? 150
                                    : (width < 785)
                                        ? 200
                                        : 300,
                                height: (width < 650)
                                    ? 150
                                    : (width < 785)
                                        ? 200
                                        : 300,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/profile.png'),
                                        fit: BoxFit.cover),
                                    borderRadius:
                                        BorderRadius.circular((width < 650)
                                            ? 150
                                            : (width < 785)
                                                ? 200
                                                : 300),
                                    color: Colors.teal),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Center(
                                  child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        width: 1, color: Colors.teal)),
                                child: Text(
                                  'Développeur Flutter',
                                  style: TextStyle(
                                      letterSpacing: 4,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 19,
                                      color: isBright
                                          ? Colors.black.withOpacity(0.7)
                                          : Colors.white),
                                ),
                              )),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Center(
                                    child: Container(
                                  width: width / 7,
                                  padding: const EdgeInsets.all(20),
                                  child: Center(
                                    child: Text(
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: isBright
                                                ? Colors.black
                                                : Colors.white),
                                        'Veuillez scanner ce code pour vérifier l\'authenticité de mon diplôme :'),
                                  ),
                                ))),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Center(
                                  child: Container(
                                      width: width / 7,
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              width: 1, color: Colors.teal)),
                                      child: Image.asset(
                                        'assets/images/qr_Franck.png',
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                          ]),
                        ),
                      ),
                    ],
                    SizedBox(
                      width: (width < 1040)
                          ? 10
                          : (width < 1400)
                              ? 50
                              : 150,
                    ),
                    if (width < 1000) ...[
                      const Spacer(),
                    ],
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(
                right: (width < 1185) ? 50 : 100,
                left: (width < 1185) ? 50 : 100),
            height: 800, // Remplacez cela par votre propre contenu
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2.5, color: Colors.transparent)),
            child: Center(
                child: Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: (width < 900) ? 20 : 40),
                  child: Text(
                    'Ce que je peux faire?',
                    style: TextStyle(
                        fontSize: 40,
                        color: isBright ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 4),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 6,
                      right: MediaQuery.of(context).size.width / 6,
                      bottom: 50),
                  child: Text(
                    'Je propose des services de conception de maquettes avec Adobe XD, développement backend avec Java ou PHP, et surtout la création d\'interfaces multiplateformes avec Flutter.',
                    style: TextStyle(
                        fontSize: 18,
                        color: isBright
                            ? const Color.fromARGB(255, 133, 133, 133)
                            : Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: (width < 650) ? 30 : 60,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: (width < 650)
                      ? 30
                      : (width > 1650)
                          ? 200
                          : (width > 1400)
                              ? 150
                              : 70,
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHoveredUI = true),
                      onExit: (_) => setState(() => _isHoveredUI = false),
                      child: Container(
                        width: (width < 1185) ? 240 : 280,
                        height: (width < 990)
                            ? 240
                            : (width < 1185)
                                ? 250
                                : 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 3)
                            ]),
                        child: (_isHoveredUI)
                            ? Row(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/uiux.png',
                                      fit: BoxFit.cover,
                                      width: (width < 1185) ? 120 : 150,
                                      height: (width < 1185) ? 90 : 230,
                                    ),
                                  ),
                                  Container(
                                    width: (width < 1185) ? 120 : 130,
                                    color:
                                        const Color.fromARGB(255, 15, 82, 136)
                                            .withOpacity(0.2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: (width < 1185) ? 0 : 10,
                                          ),
                                          child: const Text(
                                            'Pencil',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 15, 82, 136),
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: (width < 1185) ? 0 : 10,
                                          ),
                                          child: const Text(
                                            'Adobe XD',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 15, 82, 136),
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: (width < 1185) ? 0 : 10,
                                          ),
                                          child: const Text(
                                            'Photoshop',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 15, 82, 136),
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'DESIGN',
                                      style: TextStyle(
                                          letterSpacing: 4,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/uiux.png',
                                      fit: BoxFit.cover,
                                      width: 150,
                                      height: (width < 990) ? 200 : 210,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                      ),
                    ),
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHoveredBack = true),
                      onExit: (_) => setState(() => _isHoveredBack = false),
                      child: Container(
                        width: (width < 1185) ? 240 : 280,
                        height: (width < 990)
                            ? 240
                            : (width < 1185)
                                ? 250
                                : 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 3)
                            ]),
                        child: (_isHoveredBack)
                            ? Row(
                                children: [
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/code.png',
                                      fit: BoxFit.cover,
                                      width: 130,
                                      height: (width < 1185) ? 60 : 200,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: (width < 1185) ? 110 : 130,
                                    color:
                                        const Color.fromARGB(255, 15, 82, 136)
                                            .withOpacity(0.2),
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Text(
                                            'PHP',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 15, 82, 136),
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Text(
                                            'Java',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 15, 82, 136),
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'BACKEND',
                                      style: TextStyle(
                                          letterSpacing: 4,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/code.png',
                                      fit: BoxFit.cover,
                                      width: 140,
                                      height: 170,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                      ),
                    ),
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHoveredFlutter = true),
                      onExit: (_) => setState(() => _isHoveredFlutter = false),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: (width < 650) ? 20 : 0),
                        width: (width < 650)
                            ? MediaQuery.of(context).size.width - 90
                            : (width < 1185)
                                ? 240
                                : 280,
                        height: (width < 990)
                            ? 240
                            : (width < 1185)
                                ? 250
                                : 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 3)
                            ]),
                        child: (_isHoveredFlutter)
                            ? Row(
                                children: [
                                  const Spacer(),
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: Image.asset(
                                        'assets/images/flutter.png',
                                        fit: BoxFit.cover),
                                  ),
                                  if (width < 650) ...[
                                    const Spacer(),
                                  ] else ...[
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                  Container(
                                    width: (width < 650)
                                        ? (MediaQuery.of(context).size.width -
                                                60) /
                                            2
                                        : 150,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 229, 241, 252)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Icon(
                                                Icons.smartphone_rounded,
                                                color: Color.fromARGB(
                                                    255, 15, 82, 136),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Mobile',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 15, 82, 136),
                                                    letterSpacing: 2,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Container(
                                                width: 25,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  border: const Border(
                                                      top: BorderSide(
                                                          width: 1,
                                                          color: Colors.white)),
                                                  color: const Color.fromARGB(
                                                      255, 15, 82, 136),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Web',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 15, 82, 136),
                                                    letterSpacing: 2,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Icon(
                                                Icons.computer,
                                                color: Color.fromARGB(
                                                    255, 15, 82, 136),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Desktop',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 15, 82, 136),
                                                    letterSpacing: 2,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'FLUTTER',
                                      style: TextStyle(
                                          letterSpacing: 4,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/flutter.png',
                                      fit: BoxFit.fill,
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Mais mon expertise réside dans la transformation de vos idées en une excellente expérience mobile à l\'aide de Flutter, tout en assurant une synchronisation fluide des données via les API SQLite, Firebase ou REST.',
                    softWrap: true,
                    style: TextStyle(
                        letterSpacing: 2,
                        color: isBright
                            ? const Color.fromARGB(255, 133, 133, 133)
                            : Colors.white,
                        fontSize: 18),
                  ),
                ),
                const Spacer(),
              ],
            )),
          ),
          Container(
            //margin: EdgeInsets.only(left: 120, right: 120),

            height: 1050, // Remplacez cela par votre propre contenu
            //color: const Color.fromARGB(255, 54, 54, 54),
            child: Padding(
                padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: MediaQuery.of(context).size.width / 6,
                    right: MediaQuery.of(context).size.width / 6),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  height: 600,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 50),
                        child: Center(
                          child: Text(
                            'Projets',
                            style: TextStyle(
                                letterSpacing: 4,
                                fontSize: 50,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    isBright ? Colors.black : Colors.white,
                                fontWeight: FontWeight.w800,
                                color: isBright ? Colors.black : Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 70),
                        child: Center(
                          child: Text(
                            'Voici quelques-uns des projets sur lesquels j\'ai travaillé, m\'offrant une expérience significative et enrichissante.',
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: isBright
                                    ? const Color.fromARGB(255, 133, 133, 133)
                                    : Colors.white),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: MouseRegion(
                                onEnter: (_) =>
                                    setState(() => _isHoveredMed = true),
                                onExit: (_) =>
                                    setState(() => _isHoveredMed = false),
                                child: _isHoveredMed
                                    ? GestureDetector(
                                        onTap: () {
                                          Utilities().urlLaunch(
                                              'https://github.com/HarisonFranck/Med-Scheduler-Front.git');
                                        },
                                        child: Container(
                                          height: (width < 1720) ? 325 : 370,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 207, 207, 207),
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurStyle: BlurStyle.solid,
                                                    blurRadius: 8,
                                                    color: Colors.grey)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 280,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/P1.png',
                                                        fit: BoxFit.cover,
                                                        width: 120,
                                                      ),
                                                      Image.asset(
                                                        'assets/images/P2.png',
                                                        fit: BoxFit.cover,
                                                        width: 120,
                                                      ),
                                                      if (width > 1260) ...[
                                                        Image.asset(
                                                          'assets/images/P3.png',
                                                          fit: BoxFit.cover,
                                                          width: 120,
                                                        ),
                                                      ],
                                                      if (width > 1745) ...[
                                                        Image.asset(
                                                          'assets/images/P4.png',
                                                          fit: BoxFit.cover,
                                                          width: 120,
                                                        ),
                                                      ]
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 350,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                                  255,
                                                                  233,
                                                                  228,
                                                                  228)
                                                              .withOpacity(0.6),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.white)),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3.6,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20),
                                                    child: Column(
                                                      children: [
                                                        const Spacer(),
                                                        const Text(
                                                          'Med Scheduler',
                                                          //'Application mobile de prise de rendez-vous',
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 40,
                                                              shadows: [
                                                                Shadow(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            177,
                                                                            176,
                                                                            176),
                                                                    blurRadius:
                                                                        2)
                                                              ],
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      27,
                                                                      78,
                                                                      102),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              letterSpacing: 3),
                                                        ),
                                                        const SizedBox(
                                                          height: 30,
                                                        ),
                                                        const Text(
                                                          'Application mobile de prise de rendez-vous',
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              shadows: [
                                                                Shadow(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            177,
                                                                            176,
                                                                            176),
                                                                    blurRadius:
                                                                        2)
                                                              ],
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      27,
                                                                      78,
                                                                      102),
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              letterSpacing: 3),
                                                        ),
                                                        const Spacer(),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 10),
                                                          decoration: BoxDecoration(
                                                              borderRadius: const BorderRadius
                                                                  .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12)),
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.8)),
                                                          child: const Center(
                                                            child: Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              'Cliquez ici pour accéder au dépôt GitHub',
                                                              style: TextStyle(
                                                                letterSpacing:
                                                                    2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 22,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ]),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          Utilities().urlLaunch(
                                              'https://github.com/HarisonFranck/Med-Scheduler-Front.git');
                                        },
                                        child: Container(
                                          height: (width < 1720) ? 325 : 370,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurStyle: BlurStyle.solid,
                                                    blurRadius: 8,
                                                    color: Colors.grey)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Column(children: [
                                            SizedBox(
                                              height: 280,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/P1.png',
                                                    fit: BoxFit.cover,
                                                    width: 120,
                                                  ),
                                                  Image.asset(
                                                    'assets/images/P2.png',
                                                    fit: BoxFit.cover,
                                                    width: 120,
                                                  ),
                                                  if (width > 1260) ...[
                                                    Image.asset(
                                                      'assets/images/P3.png',
                                                      fit: BoxFit.cover,
                                                      width: 120,
                                                    ),
                                                  ],
                                                  if (width > 1745) ...[
                                                    Image.asset(
                                                      'assets/images/P4.png',
                                                      fit: BoxFit.cover,
                                                      width: 120,
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            const Center(
                                              child: Text(
                                                'Med Scheduler',
                                                //'Application mobile de prise de rendez-vous',
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 3),
                                              ),
                                            ),
                                            const Spacer(),
                                          ]),
                                        ),
                                      ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                                height: (width < 1720) ? 325 : 370,
                                width: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurStyle: BlurStyle.solid,
                                          blurRadius: 8,
                                          color: Colors.grey)
                                    ],
                                    borderRadius: BorderRadius.circular(6)),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/Swach.png',
                                      fit: (width < 1650)
                                          ? BoxFit.fill
                                          : BoxFit.fitWidth,
                                    ),
                                    const Spacer(),
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text('Maquette avec Adobe XD',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 3)),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: (width < 1720) ? 325 : 370,
                              width: MediaQuery.of(context).size.width / 3.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        blurStyle: BlurStyle.solid,
                                        blurRadius: 8,
                                        color: Colors.grey)
                                  ],
                                  borderRadius: BorderRadius.circular(6)),
                              child: Image.asset(
                                'assets/images/meds.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          MouseRegion(
                            onEnter: (_) =>
                                setState(() => _isHoveredResp = true),
                            onExit: (_) =>
                                setState(() => _isHoveredResp = false),
                            child: _isHoveredResp
                                ? GestureDetector(
                                    onTap: () {
                                      print('TAP');
                                      Utilities().urlLaunch(
                                          'https://github.com/HarisonFranck/TeamTech.git');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                          height: (width < 1720) ? 325 : 370,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurStyle: BlurStyle.solid,
                                                    blurRadius: 8,
                                                    color: Colors.grey)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                'assets/images/tree.png',
                                                fit: BoxFit.fitWidth,
                                              ),
                                              Container(
                                                height: 350,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                            255, 233, 228, 228)
                                                        .withOpacity(0.6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.white)),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.5,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, right: 20),
                                                  child: Column(
                                                    children: [
                                                      const Spacer(),
                                                      const Text(
                                                        'TechTeam',
                                                        //'Application mobile de prise de rendez-vous',
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 40,
                                                            shadows: [
                                                              Shadow(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          177,
                                                                          176,
                                                                          176),
                                                                  blurRadius: 2)
                                                            ],
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    27,
                                                                    78,
                                                                    102),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 3),
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      const Text(
                                                        'Application web de gestion des employés',
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            shadows: [
                                                              Shadow(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          177,
                                                                          176,
                                                                          176),
                                                                  blurRadius: 2)
                                                            ],
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    27,
                                                                    78,
                                                                    102),
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 3),
                                                      ),
                                                      const Spacer(),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 10),
                                                        decoration: BoxDecoration(
                                                            borderRadius: const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12)),
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.8)),
                                                        child: const Center(
                                                          child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            'Cliquez ici pour accéder au dépôt GitHub',
                                                            style: TextStyle(
                                                              letterSpacing: 2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 22,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      print('TAP');
                                      Utilities().urlLaunch(
                                          'https://github.com/HarisonFranck/TeamTech.git');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        height: (width < 1720) ? 325 : 370,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            boxShadow: const [
                                              BoxShadow(
                                                  blurStyle: BlurStyle.solid,
                                                  blurRadius: 8,
                                                  color: Colors.grey)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Image.asset(
                                          'assets/images/Responsive.png',
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
            margin: const EdgeInsets.only(
                top: 50, left: 100, right: 100, bottom: 20),
            height: 300, // Remplacez cela par votre propre contenu
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 2.5,
                    color: isBright ? Colors.transparent : Colors.white)),
            child: Row(
              children: [
                const Spacer(),
                Container(
                  width: (width < 1076)
                      ? MediaQuery.of(context).size.width / 2.5
                      : MediaQuery.of(context).size.width / 2.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            const String textToCopy = "@Mauriat Franck";
                            Clipboard.setData(
                                const ClipboardData(text: textToCopy));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'Nom LinkedIn copié dans le presse-papiers'),
                            ));
                          },
                          child: Container(
                              height: 30,
                              child: Row(
                                children: [
                                  const SizedBox(width: 15),
                                  Image.asset(
                                    'assets/images/in.png',
                                    width: 40,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '@Mauriat Franck',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: isBright
                                            ? const Color.fromARGB(
                                                255, 38, 94, 131)
                                            : Colors.white,
                                        letterSpacing: 4),
                                  ),
                                  const Spacer(),
                                ],
                              ))),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            const String textToCopy =
                                "hmauriatfranck@gmail.com";

                            Utilities utilities = Utilities();

                            utilities.launchMailTo(
                                textToCopy, "Objet du message ici");
                            /*Clipboard.setData(
                                const ClipboardData(text: textToCopy));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text('Email copié dans le presse-papiers'),
                            ));*/
                          },
                          child: Container(
                              height: 40,
                              child: Row(
                                children: [
                                  const SizedBox(width: 15),
                                  Image.asset(
                                    'assets/images/gmail.png',
                                    width: 40,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'hmauriatfranck@gmail.com',
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: isBright
                                            ? const Color.fromARGB(
                                                255, 39, 114, 175)
                                            : Colors.white,
                                        letterSpacing: 4),
                                  ),
                                  const Spacer(),
                                ],
                              ))),
                      const Spacer()
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(children: [
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          const String textToCopy = "+261 34 56 241 03";
                          Clipboard.setData(
                              const ClipboardData(text: textToCopy));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text('Numéro copié dans le presse-papiers'),
                          ));
                        },
                        child: Container(
                            height: 35,
                            width: 300,
                            child: Row(
                              children: [
                                const SizedBox(width: 15),
                                Image.asset(
                                  'assets/images/whatsapp.png',
                                  width: 40,
                                  height: 35,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '+261 34 56 241 03',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: isBright
                                          ? const Color.fromARGB(
                                              255, 39, 114, 175)
                                          : Colors.white,
                                      letterSpacing: 4),
                                ),
                              ],
                            ))),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: 35,
                            width: 300,
                            child: Row(
                              children: [
                                const SizedBox(width: 15),
                                Icon(
                                  Icons.phone,
                                  color: isBright ? Colors.black : Colors.white,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Contactez moi',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: isBright
                                          ? const Color.fromARGB(
                                              255, 43, 43, 43)
                                          : Colors.white,
                                      letterSpacing: 4),
                                ),
                              ],
                            ))),
                    const Spacer(),
                  ]),
                ),
                const Spacer(),
              ],
            ),
          ),
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
      position = appBarHeight + index * screenHeight - (appBarHeight * 3);
    } else if (index == 2) {
      position = appBarHeight + index * screenHeight - (appBarHeight * 4);
    } else {
      position = appBarHeight + index * screenHeight;
    }

    scrollController.animateTo(position - 56,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
