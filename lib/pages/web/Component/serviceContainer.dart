import 'package:flutter/material.dart';

class SecondContainer extends StatefulWidget {
  const SecondContainer({required this.isBright});

  final bool isBright;

  @override
  State<SecondContainer> createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
  bool _isHoveredFlutter = false;
  bool _isHoveredUI = false;
  bool _isHoveredBack = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          right: (width < 1185) ? 50 : 100, left: (width < 1185) ? 50 : 100),
      height: 1000, // Remplacez cela par votre propre contenu
      decoration: BoxDecoration(
          //color: Colors.red,
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
                  color: widget.isBright ? Colors.black : Colors.white,
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
              'Je crée des maquettes sur mesure avec Adobe XD et transforme ces visions en interfaces fluides et dynamiques grâce à Flutter. Mon objectif est de donner vie à des expériences numériques intuitives et élégantes, adaptées à tous les appareils.',
              style: TextStyle(
                  fontSize:
                      (MediaQuery.of(context).size.width < 1000) ? 18 : 26,
                  color: widget.isBright
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
                cursor: SystemMouseCursors.click,
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
                              color: const Color.fromARGB(255, 15, 82, 136)
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
                                          color:
                                              Color.fromARGB(255, 15, 82, 136),
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
                                          color:
                                              Color.fromARGB(255, 15, 82, 136),
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
                                          color:
                                              Color.fromARGB(255, 15, 82, 136),
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
                cursor: SystemMouseCursors.click,
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
                            const Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.sync_lock,
                                  size: 130,
                                ) /*Image.asset(
                                'assets/images/code.png',
                                fit: BoxFit.cover,
                                width: 130,
                                height: (width < 1185) ? 60 : 200,
                              ),*/
                                ),
                            const Spacer(),
                            Container(
                              width: (width < 1185) ? 110 : 130,
                              color: const Color.fromARGB(255, 15, 82, 136)
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
                                      'SQLite',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 15, 82, 136),
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
                                      'Firebase',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 15, 82, 136),
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
                                      'API Rest',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 15, 82, 136),
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
                      : const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                textAlign: TextAlign.center,
                                'DATASYNC',
                                style: TextStyle(
                                    letterSpacing: 4,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Spacer(),
                            Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.sync_lock,
                                  size: 140,
                                ) /*Image.asset(
                                'assets/images/code.png',
                                fit: BoxFit.cover,
                                width: 140,
                                height: 170,
                              ),*/
                                ),
                            Spacer(),
                          ],
                        ),
                ),
              ),
              MouseRegion(
                onEnter: (_) => setState(() => _isHoveredFlutter = true),
                onExit: (_) => setState(() => _isHoveredFlutter = false),
                cursor: SystemMouseCursors.click,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: (width < 650) ? 20 : 0),
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
                              child: Image.asset('assets/images/flutter.png',
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
                                  ? (MediaQuery.of(context).size.width - 60) / 2
                                  : 150,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 229, 241, 252)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Icon(
                                          Icons.smartphone_rounded,
                                          color:
                                              Color.fromARGB(255, 15, 82, 136),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
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
                                        padding:
                                            const EdgeInsets.only(left: 20),
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
                                        padding: EdgeInsets.only(left: 10),
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
                                        padding: EdgeInsets.only(left: 20),
                                        child: Icon(
                                          Icons.computer,
                                          color:
                                              Color.fromARGB(255, 15, 82, 136),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
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
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 6,
                right: MediaQuery.of(context).size.width / 6,
                top: 10),
            child: Text(
              'Mais mon expertise réside dans la transformation de vos idées en une excellente expérience mobile à l\'aide de Flutter, tout en assurant une synchronisation fluide des données via les API SQLite, Firebase ou REST.',
              softWrap: true,
              style: TextStyle(
                  letterSpacing: 2,
                  color: widget.isBright
                      ? const Color.fromARGB(255, 133, 133, 133)
                      : Colors.white,
                  fontSize:
                      (MediaQuery.of(context).size.width < 1000) ? 18 : 26),
            ),
          ),
          const Spacer(),
        ],
      )),
    );
  }
}
