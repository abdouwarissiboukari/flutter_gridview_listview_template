import 'package:flutter/material.dart';
import 'package:marseille_view/ItemsPage.dart';
import 'package:marseille_view/main.dart';
import 'package:marseille_view/place.dart';
import 'crosswidget.dart';

class ItemDetailPage extends StatefulWidget {
  Place itemPlaceToDisplay;

  ItemDetailPage(this.itemPlaceToDisplay, {super.key});

  @override
  ItemDetailPageState createState() {
    return ItemDetailPageState();
  }
}

class ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    appBarTitle = widget.itemPlaceToDisplay.name;
    appBarIcon = Icon((isiOS) ? Icons.arrow_back_ios : Icons.arrow_back);
    pageContext = context;
    initializeComponet();
    return crossScaffold(crossBodyChild());
  }

  Widget crossBodyChild() {
    return (orientation == Orientation.portrait) ? detailColumn() : detailRow();
  }

  Widget detailColumn() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            widget.itemPlaceToDisplay.getFolderPath(),
            fit: BoxFit.fill,
            height: size.height * 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(widget.itemPlaceToDisplay.desc),
          )
        ],
      ),
    );
  }

  Widget detailRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          widget.itemPlaceToDisplay.getFolderPath(),
          fit: BoxFit.fill,
          width: size.width * 0.3,
          height: size.height,
        ),
        Container(
          height: size.height,
          width: size.width * 0.7,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.itemPlaceToDisplay.desc,
              ),
            ),
          ),
        )
      ],
    );
  }
}
