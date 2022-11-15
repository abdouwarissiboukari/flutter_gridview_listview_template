import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marseille_view/main.dart';
import 'package:marseille_view/place.dart';

import 'itemDetailsPage.dart';

String? appBarTitle;
Widget? appBarIcon;
BuildContext? pageContext;
Size size = MediaQuery.of(pageContext!).size;
Orientation orientation = MediaQuery.of(pageContext!).orientation;

void initializeComponet() {
  size = MediaQuery.of(pageContext!).size;
  orientation = MediaQuery.of(pageContext!).orientation;
}

Widget nameText(String string) {
  return Text(
    string,
    style: TextStyle(color: appColor),
    maxLines: 1,
    softWrap: true,
    textScaleFactor: 0.9,
  );
}

Widget crossBody(Widget widget) {
  return widget;
}

Text crossTitleText() {
  if (appBarTitle != null) {
    return Text(appBarTitle!);
  } else {
    return Text((isiOS) ? "Marseille iOS App" : "Merseille Android App");
  }
}

Widget crossLeading() {
  if (appBarIcon != null) {
    return IconButton(
        onPressed: () {
          appBarTitle = null;
          appBarIcon = null;
          Navigator.of(pageContext!).pop();
        },
        icon: appBarIcon!);
  } else {
    return Icon((isiOS) ? Icons.home : Icons.home_outlined);
  }
}

Widget androidScaffold(Widget widget) {
  return Scaffold(
    appBar: AppBar(
      leading: crossLeading(),
      title: crossTitleText(),
    ),
    body: crossBody(widget),
  );
}

Widget iOSScaffold(Widget widget) {
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      backgroundColor: appColor,
      leading: crossLeading(),
      middle: crossTitleText(),
    ),
    child: crossBody(widget),
  );
}

Widget crossScaffold(Widget widget) {
  return (isiOS) ? iOSScaffold(widget) : androidScaffold(widget);
}

onItemDetailsPage({required BuildContext context, required Place place}) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: ((context) => ItemDetailPage(place))));
}
