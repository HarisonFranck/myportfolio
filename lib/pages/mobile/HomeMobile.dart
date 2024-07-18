import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:myportfolio/utils/Utilities.dart';

class HomeMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeMobileState();
  }
}

class HomeMobileState extends State<HomeMobile> {
  final imagelist = [
    Container(
      height: 600,
      width: 300,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [
            BoxShadow(
                blurStyle: BlurStyle.solid, blurRadius: 8, color: Colors.grey)
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Column(children: [
        SizedBox(
          height: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/P1.png',
                fit: BoxFit.cover,
                width: 60,
              ),
              Image.asset(
                'assets/images/P2.png',
                fit: BoxFit.cover,
                width: 60,
              ),
              Image.asset(
                'assets/images/P3.png',
                fit: BoxFit.cover,
                width: 60,
              ),
              Image.asset(
                'assets/images/P4.png',
                fit: BoxFit.cover,
                width: 60,
              ),
            ],
          ),
        ),
        const Spacer(),
        const Center(
          child: Text(
            'Med Scheduler',
            //'Application mobile de prise de rendez-vous',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 3),
          ),
        ),
        const Spacer(),
      ]),
    ),
    Container(
        height: 600,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurStyle: BlurStyle.solid, blurRadius: 8, color: Colors.grey)
            ],
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Swach.png',
              fit: BoxFit.fitWidth,
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.center,
              child: Text('Maquette avec Adobe XD',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3)),
            ),
            const Spacer()
          ],
        )),
    Container(
        height: 600,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurStyle: BlurStyle.solid, blurRadius: 8, color: Colors.grey)
            ],
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Image.asset(
              'assets/images/meds.png',
              fit: BoxFit.fitWidth,
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.center,
              child: Text('Maquette de Med Scheduler',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3)),
            ),
            const Spacer()
          ],
        )),
    Container(
        height: 600,
        width: 300,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: const [
              BoxShadow(
                  blurStyle: BlurStyle.solid, blurRadius: 8, color: Colors.grey)
            ],
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Responsive.png',
              fit: BoxFit.fitWidth,
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.center,
              child: Text('Application Web Responsive avec Flutter',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3)),
            ),
            const Spacer()
          ],
        )),
  ];

  bool isBright = true;

  int isSelected = 0;

  ScrollController scrollController = ScrollController();

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
    print("POSITION : ${scrollController.position.pixels}");
    if (scrollController.position.pixels >= 0 &&
        scrollController.position.pixels < 640) {
      setState(() {
        isSelected = 0;
      });
    } else if (scrollController.position.pixels >= 640 &&
        scrollController.position.pixels < 1200) {
      setState(() {
        isSelected = 1;
      });
    } else if (scrollController.position.pixels >= 1200 &&
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    //print('HEIGHT: $height');
    //print("POSITION : ${scrollController.position.pixels}");
    return Scaffold(
      backgroundColor:
          (isBright) ? Colors.white : const Color.fromARGB(255, 82, 82, 82),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MyPortfolio',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: isBright
            ? const Color.fromARGB(255, 27, 78, 102)
            : const Color.fromARGB(255, 44, 44, 44),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isBright = !isBright;
                });
              },
              icon: const Icon(
                Icons.brightness_6_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
      ),
      body: ListView(controller: scrollController, children: [
        Container(
            height: 900,
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Bonjour, bienvenue sur mon portfolio.',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 19,
                        letterSpacing: 2,
                        color: isBright ? Colors.black : Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/profile.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(180),
                      color: Colors.teal),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Je m\'appel Franck Mauriat,',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 2,
                      color: isBright ? Colors.black : Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  //color: Colors.black12,
                  padding: EdgeInsets.only(left: 30, right: 30),

                  child: AnimatedTextKit(
                    pause: const Duration(seconds: 4),
                    animatedTexts: [
                      TypewriterAnimatedText(
                          speed: const Duration(milliseconds: 80),
                          'Ma passion ?',
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                              color: isBright ? Colors.black : Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 4)),
                      TypewriterAnimatedText(
                          speed: const Duration(milliseconds: 80),
                          textAlign: TextAlign.center,
                          'Transformer les idées en réalité grâce à un développement innovant ! En tant que développeur mobile, Web et Desktop spécialisé dans Flutter.',
                          textStyle: TextStyle(
                              color: isBright ? Colors.black : Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 4)),
                      TypewriterAnimatedText(
                          speed: const Duration(milliseconds: 80),
                          'Pour en savoir plus sur moi, je vous invite à télécharger mon CV.',
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                              color: isBright ? Colors.black : Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 4)),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Center(
                        child: Container(
                      width: height / 2,
                      padding: const EdgeInsets.all(20),
                      child: const Center(
                        child: Text(
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                            'Veuillez scanner ce code pour vérifier l\'authenticité de mon diplôme :'),
                      ),
                    ))),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Center(
                      child: Container(
                          width: height / 4,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(width: 1, color: Colors.teal)),
                          child: Image.asset(
                            'assets/images/qr_Franck.png',
                            fit: BoxFit.cover,
                          ))),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(isBright
                        ? Color.fromARGB(232, 32, 85, 128)
                        : Color.fromARGB(255, 27, 27, 27)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Définissez le rayon de la bordure ici
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(const Size(250.0, 70.0)),
                  ),
                  onPressed: () async {
                    window.open(
                        'https://drive.google.com/file/d/1fmkNhqlAMUPEb52iyZPKXa93aUwRi-AL/view?usp=sharing',
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
                const Spacer(),
              ],
            )),
        Container(
            height: 700,
            decoration:
                const BoxDecoration(//color: Color.fromARGB(255, 49, 122, 82)
                    ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Mes services',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                      color: isBright ? Colors.black : Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: Text(
                    'Je propose des services de conception de maquettes avec Adobe XD, développement backend avec Java ou PHP, et création d\'interfaces multiplateformes avec Flutter.',
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 17,
                        color: isBright ? Colors.grey : Colors.white),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 4.5,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurStyle: BlurStyle.solid,
                                blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(6),
                          color: !isBright
                              ? const Color.fromARGB(255, 68, 68, 68)
                              : Colors.white),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/uiux.png',
                            fit: BoxFit.cover,
                            width: 200,
                            height: 140,
                          ),
                          Center(
                            child: Text(
                              'Adobe XD',
                              style: TextStyle(
                                  letterSpacing: 2,
                                  color:
                                      isBright ? Colors.black : Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      child: Divider(
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                        color: isBright ? Colors.grey : Colors.white,
                      ),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 4.5,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurStyle: BlurStyle.solid,
                                blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(6),
                          color: !isBright
                              ? const Color.fromARGB(255, 68, 68, 68)
                              : Colors.white),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/code.png',
                            fit: BoxFit.cover,
                            width: 200,
                            height: 140,
                          ),
                          Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'PHP',
                                style: TextStyle(
                                    letterSpacing: 2,
                                    color:
                                        isBright ? Colors.black : Colors.white),
                              ),
                              Text(
                                'JAVA',
                                style: TextStyle(
                                    letterSpacing: 2,
                                    color:
                                        isBright ? Colors.black : Colors.white),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      child: Divider(
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                        color: isBright ? Colors.grey : Colors.white,
                      ),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 4.5,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurStyle: BlurStyle.solid,
                                blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(6),
                          color: !isBright
                              ? const Color.fromARGB(255, 68, 68, 68)
                              : Colors.white),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Icon(Icons.computer_rounded,
                              size: 80,
                              color: isBright
                                  ? Color.fromARGB(255, 92, 92, 92)
                                  : Colors.white),
                          const Spacer(),
                          Center(
                              child: Column(
                            children: [
                              Text(
                                'Flutter',
                                style: TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 17,
                                    color:
                                        isBright ? Colors.black : Colors.white),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                22,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Mobile',
                                        style: TextStyle(
                                            color: isBright
                                                ? Colors.grey
                                                : Colors.white),
                                      ),
                                      const Spacer()
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                22,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Web',
                                        style: TextStyle(
                                            color: isBright
                                                ? Colors.grey
                                                : Colors.white),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                22,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Desktop',
                                        style: TextStyle(
                                            color: isBright
                                                ? Colors.grey
                                                : Colors.white),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )),
                          const SizedBox(
                            height: 5,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            )),
        Container(
          height: 700,
          decoration:
              const BoxDecoration(//color: Color.fromARGB(255, 59, 75, 148)
                  ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Projets',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                    color: isBright ? Colors.black : Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Center(
                  child: Text(
                    'Voici quelques-uns des projets sur lesquels j\'ai travaillé, m\'offrant une expérience significative et enrichissante.',
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: isBright ? Colors.grey : Colors.white),
                  ),
                ),
              ),
              Center(
                child: CarouselSlider.builder(
                  itemCount: imagelist.length,
                  itemBuilder: (context, i, index) {
                    final urlImage = imagelist.elementAt(i);

                    return urlImage;
                  },
                  options: CarouselOptions(
                      height: 380,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 400,
          decoration:
              const BoxDecoration(//color: Color.fromARGB(255, 219, 164, 219)
                  ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Center(
                  child: Text(
                    'Développé par Harison Franck Mauriat',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 16,
                        color: isBright ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          width: 1,
                          color: isBright ? Colors.grey : Colors.white)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(
                                'email: hmauriatfranck@gmail.com',
                                softWrap: true,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    color:
                                        isBright ? Colors.black : Colors.white),
                              ),
                              const Spacer()
                            ],
                          )),
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
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(
                                'LinkedIn: @Mauriat Franck',
                                softWrap: true,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    color:
                                        isBright ? Colors.black : Colors.white),
                              ),
                              const Spacer()
                            ],
                          )),
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
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(
                                'WhatsApp: +261 34 56 241 03',
                                softWrap: true,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    color:
                                        isBright ? Colors.black : Colors.white),
                              ),
                              const Spacer()
                            ],
                          )),
                    ],
                  )),
              const Spacer(),
            ],
          ),
        ),
      ]),
    );
  }

  void scrollToContent(BuildContext context, int index) {
    const double appBarHeight = kToolbarHeight;
    final double screenHeight = MediaQuery.of(context).size.height;
    double position = 0.0;
    if (index == 0) {
      position = 0;
    }
    if (index == 1) {
      position = appBarHeight + index * screenHeight - (appBarHeight * 2);
    } else if (index == 2) {
      position = appBarHeight + index * screenHeight - (appBarHeight * 4);
    } else {
      position = appBarHeight + index * screenHeight;
    }
    print('POSITION: $position');

    scrollController.animateTo(position - 56,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  Widget BuildImage(String url, int i) => Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Card(
            elevation: 10,
            child: Image.asset(
              url,
              fit: BoxFit.fitWidth,
              width: 400,
            )),
      );
}
