import 'package:flutter/material.dart';
import 'package:myportfolio/l10n/l10n.dart';
import 'package:myportfolio/pages/mobile/HomeMobile.dart';
import 'package:myportfolio/pages/web/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      supportedLocales: L10n.all,
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      title: 'Mauriat\'s Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: (width < 1000) ? HomeMobile() : Home(),
    );
  }
}
