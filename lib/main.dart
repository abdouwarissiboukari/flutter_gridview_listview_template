import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marseille_view/ItemsPage.dart';

String title = "";
Color appColor = Colors.deepOrange;
Color appLightColor = Colors.deepOrange.shade300;
bool isiOS = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    isiOS = (platform == TargetPlatform.iOS);

    title = (isiOS) ? "Marseille iOS App" : "Merseille Android App";

    return (isiOS) ? iOSApp() : androidApp();
  }

  Widget androidApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: appColor as MaterialColor,
      ),
      home: ItemsPage(),
    );
  }

  Widget iOSApp() {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: CupertinoThemeData(
        primaryColor: appColor as MaterialColor,
      ),
      home: ItemsPage(),
    );
  }
}
