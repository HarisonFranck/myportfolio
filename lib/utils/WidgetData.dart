import 'package:flutter/material.dart';
import 'package:myportfolio/utils/Utilities.dart';

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
      GestureDetector(
        onTap: () {
          /*Utilities()
              .urlLaunch('https://github.com/HarisonFranck/TeamTech.git');*/
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: Color.fromARGB(255, 27, 78, 102)),
          child: const Center(
            child: Text(
              textAlign: TextAlign.center,
              'Dépôt GitHub actuellement en construction',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
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
            child: Text('Application Web de gestion des employés avec Flutter',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3)),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Utilities()
                  .urlLaunch('https://github.com/HarisonFranck/TeamTech.git');
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  color: Color.fromARGB(255, 27, 78, 102)),
              child: const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Cliquez ici pour accéder au dépôt GitHub',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
];
