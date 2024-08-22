import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FirstContainer extends StatefulWidget {
  const FirstContainer({required this.isBright});

  final bool isBright;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstContainerState();
  }
}

class FirstContainerState extends State<FirstContainer>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  AnimationController? _controller;
  Animation<Color?>? _colorAnimation;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
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
                          color: widget.isBright ? Colors.black : Colors.white,
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
                          color: widget.isBright ? Colors.black : Colors.white,
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
                        padding:
                            EdgeInsets.only(left: (width < 650) ? 20 : 100),
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
                                    color: widget.isBright
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 4)),
                            TypewriterAnimatedText(
                                speed: const Duration(milliseconds: 80),
                                'Transformer les idées en réalité grâce à un développement innovant ! En tant que développeur mobile, Web et Desktop spécialisé dans Flutter.',
                                textStyle: TextStyle(
                                    color: widget.isBright
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
                                    color: widget.isBright
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
                        minimumSize:
                            MaterialStateProperty.all(const Size(250.0, 70.0)),
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
                                    color: _colorAnimation!.value!, width: 4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  '"L\'innovation distingue un leader d\'un suiveur." - Steve Jobs',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: widget.isBright
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
                  color: widget.isBright
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
                                  image:
                                      AssetImage('assets/images/profile.png'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular((width < 650)
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
                              border: Border.all(width: 1, color: Colors.teal)),
                          child: Text(
                            'Développeur Flutter',
                            style: TextStyle(
                                letterSpacing: 4,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: widget.isBright
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
                                      color: widget.isBright
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
                                    borderRadius: BorderRadius.circular(6),
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
        ));
  }
}
