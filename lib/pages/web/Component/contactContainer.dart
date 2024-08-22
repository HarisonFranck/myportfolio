import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:myportfolio/utils/Utilities.dart';

class ContactContainer extends StatefulWidget {
  const ContactContainer({required this.isBright});

  final bool isBright;

  @override
  State<ContactContainer> createState() => _ContactContainerState();
}

class _ContactContainerState extends State<ContactContainer> {
  bool _isHoveredLinkedIn = false;
  bool _isHoveredEmail = false;
  bool _isHoveredGithub = false;
  bool _isHoveredWhatsapp = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
          margin:
              const EdgeInsets.only(top: 50, left: 100, right: 100, bottom: 20),
          height: 400, // Remplacez cela par votre propre contenu
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 2.5,
                  color: widget.isBright ? Colors.transparent : Colors.white)),
          child: Row(
            children: [
              const Spacer(),
              Container(
                width: (width < 1076)
                    ? MediaQuery.of(context).size.width / 2.5
                    : MediaQuery.of(context).size.width / 2.8,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHoveredLinkedIn = true),
                      onExit: (_) => setState(() => _isHoveredLinkedIn = false),
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: () {
                            Utilities().urlLaunch(
                                'https://www.linkedin.com/in/mauriat-franck-462640272');
                            /*const String textToCopy = "@Mauriat Franck";
                            Clipboard.setData(const ClipboardData(text: textToCopy));
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content:
                                  Text('Nom LinkedIn copié dans le presse-papiers'),
                            ));*/
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
                                        fontWeight: (_isHoveredLinkedIn)
                                            ? FontWeight.bold
                                            : FontWeight.w700,
                                        fontSize:
                                            (_isHoveredLinkedIn) ? 22 : 18,
                                        color: widget.isBright
                                            ? const Color.fromARGB(
                                                255, 38, 94, 131)
                                            : Colors.white,
                                        letterSpacing: 4),
                                  ),
                                  const Spacer(),
                                ],
                              ))),
                    ),
                    const Spacer(),
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHoveredEmail = true),
                      onExit: (_) => setState(() => _isHoveredEmail = false),
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
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
                                        fontWeight: (_isHoveredEmail)
                                            ? FontWeight.bold
                                            : FontWeight.w700,
                                        fontSize: (_isHoveredEmail) ? 22 : 18,
                                        color: widget.isBright
                                            ? const Color.fromARGB(
                                                255, 39, 114, 175)
                                            : Colors.white,
                                        letterSpacing: 4),
                                  ),
                                  const Spacer(),
                                ],
                              ))),
                    ),
                    const Spacer()
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.9,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(children: [
                  const Spacer(),
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHoveredWhatsapp = true),
                    onExit: (_) => setState(() => _isHoveredWhatsapp = false),
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
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
                            width: 320,
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
                                      fontWeight: (_isHoveredWhatsapp)
                                          ? FontWeight.bold
                                          : FontWeight.w700,
                                      fontSize: (_isHoveredWhatsapp) ? 22 : 18,
                                      color: widget.isBright
                                          ? const Color.fromARGB(
                                              255, 39, 114, 175)
                                          : Colors.white,
                                      letterSpacing: 4),
                                ),
                              ],
                            ))),
                  ),
                  const Spacer(),
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHoveredGithub = true),
                    onExit: (_) => setState(() => _isHoveredGithub = false),
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          Utilities().urlLaunch(
                              "https://github.com/HarisonFranck?fbclid=IwY2xjawEy5LBleHRuA2FlbQIxMAABHWYYb_UJR5JpKQGJoUmuq8iUNNjVg6Tk4O0WxQ_GYXgACYiRmfBX9yfk_A_aem_ooAUy5_J0sQZzz7DF4hvLg");
                        },
                        child: Container(
                            height: 35,
                            width: 300,
                            child: Row(
                              children: [
                                const SizedBox(width: 15),
                                Image.asset(
                                  "assets/images/github.png",
                                  fit: BoxFit.cover,
                                  width: 40,
                                  height: 35,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'HarisonFranck',
                                  style: TextStyle(
                                      fontWeight: (_isHoveredGithub)
                                          ? FontWeight.bold
                                          : FontWeight.w700,
                                      fontSize: (_isHoveredGithub) ? 22 : 18,
                                      color: widget.isBright
                                          ? const Color.fromARGB(
                                              255, 39, 114, 175)
                                          : Colors.white,
                                      letterSpacing: 4),
                                ),
                              ],
                            ))),
                  ),
                  const Spacer(),
                ]),
              ),
              const Spacer(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 56, 56, 56).withOpacity(0.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "©Harison Franck Mauriat, 2024",
                style: TextStyle(
                    color: widget.isBright ? Colors.black : Colors.grey,
                    fontSize: 22,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 300,
                child: Row(
                  children: [
                    Text(
                      'made with:',
                      style: TextStyle(
                          color: widget.isBright ? Colors.black : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const FlutterLogo(
                      size: 50,
                    ),
                    Image.asset(
                      "assets/images/firebase.png",
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
