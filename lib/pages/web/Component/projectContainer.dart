import 'package:flutter/material.dart';

import '../../../utils/Utilities.dart';

class ThirdContainer extends StatefulWidget {
  const ThirdContainer({required this.isBright});

  final bool isBright;

  @override
  State<ThirdContainer> createState() => _ThirdContainerState();
}

class _ThirdContainerState extends State<ThirdContainer> {
  bool _isHoveredMed = false;
  bool _isHoveredResp = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      //margin: EdgeInsets.only(left: 120, right: 120),

      height: 1100, // Remplacez cela par votre propre contenu
      //color: const Color.fromARGB(255, 54, 54, 54),
      child: Padding(
          padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: MediaQuery.of(context).size.width / 6,
              right: MediaQuery.of(context).size.width / 6),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
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
                              widget.isBright ? Colors.black : Colors.white,
                          fontWeight: FontWeight.w800,
                          color: widget.isBright ? Colors.black : Colors.white),
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
                          fontSize: (MediaQuery.of(context).size.width < 1000)
                              ? 18
                              : 26,
                          fontWeight: FontWeight.w500,
                          color: widget.isBright
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
                          onEnter: (_) => setState(() => _isHoveredMed = true),
                          onExit: (_) => setState(() => _isHoveredMed = false),
                          cursor: SystemMouseCursors.click,
                          child: _isHoveredMed
                              ? GestureDetector(
                                  onTap: () {
                                    Utilities().urlLaunch(
                                        'https://github.com/HarisonFranck/Med-Scheduler-Front.git');
                                  },
                                  child: Container(
                                    height: (width < 1720) ? 325 : 370,
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 207, 207, 207),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurStyle: BlurStyle.solid,
                                              blurRadius: 8,
                                              color: Colors.grey)
                                        ],
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            height: 280,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
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
                                                color: const Color.fromARGB(
                                                        255, 233, 228, 228)
                                                    .withOpacity(0.6),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.white)),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.6,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  const Text(
                                                    'Med Scheduler',
                                                    //'Application mobile de prise de rendez-vous',
                                                    softWrap: true,
                                                    textAlign: TextAlign.center,
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
                                                        color: Color.fromARGB(
                                                            255, 27, 78, 102),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 3),
                                                  ),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: Colors.white
                                                            .withOpacity(0.8)),
                                                    child: const Text(
                                                      'Application mobile de gestion de rendez-vous pour clinique privée',
                                                      softWrap: true,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 27, 78, 102),
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 3),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12)),
                                                        color: Colors.white
                                                            .withOpacity(0.8)),
                                                    child: const Center(
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        'Cliquez ici pour accéder au dépôt GitHub',
                                                        style: TextStyle(
                                                          letterSpacing: 2,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurStyle: BlurStyle.solid,
                                              blurRadius: 8,
                                              color: Colors.grey)
                                        ],
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 280,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                'assets/images/winedge.png',
                                fit: BoxFit.cover,
                              ),
                              const Spacer(),
                              const Align(
                                alignment: Alignment.center,
                                child: Text('Application multiplateforme',
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
                      onEnter: (_) => setState(() => _isHoveredResp = true),
                      onExit: (_) => setState(() => _isHoveredResp = false),
                      cursor: SystemMouseCursors.click,
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
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurStyle: BlurStyle.solid,
                                              blurRadius: 8,
                                              color: Colors.grey)
                                        ],
                                        borderRadius: BorderRadius.circular(6)),
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
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Column(
                                              children: [
                                                const Spacer(),
                                                const Text(
                                                  'TechTeam',
                                                  //'Application mobile de prise de rendez-vous',
                                                  softWrap: true,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      shadows: [
                                                        Shadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    177,
                                                                    176,
                                                                    176),
                                                            blurRadius: 2)
                                                      ],
                                                      color: Color.fromARGB(
                                                          255, 27, 78, 102),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 3),
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: Colors.white
                                                            .withOpacity(0.8)),
                                                    child: const Text(
                                                      'Application web de gestion des employés',
                                                      softWrap: true,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 27, 78, 102),
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 3),
                                                    )),
                                                const Spacer(),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(12),
                                                              topRight: Radius
                                                                  .circular(
                                                                      12)),
                                                      color: Colors.white
                                                          .withOpacity(0.8)),
                                                  child: const Center(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Cliquez ici pour accéder au dépôt GitHub',
                                                      style: TextStyle(
                                                        letterSpacing: 2,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                      MediaQuery.of(context).size.width / 3.5,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      boxShadow: const [
                                        BoxShadow(
                                            blurStyle: BlurStyle.solid,
                                            blurRadius: 8,
                                            color: Colors.grey)
                                      ],
                                      borderRadius: BorderRadius.circular(6)),
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
    );
  }
}
