import 'package:flutter/material.dart';
import 'package:marseille_view/crosswidget.dart';
import 'package:marseille_view/datasource.dart';
import 'package:marseille_view/main.dart';
import 'package:marseille_view/place.dart';

class ItemsPage extends StatefulWidget {
  @override
  ItemsPageState createState() {
    return ItemsPageState();
  }
}

class ItemsPageState extends State<ItemsPage> {
  @override
  initState() {
    super.initState();
    allPlaces = loadPlaces();
  }

  List<Place> allPlaces = [];

  List<Place> loadPlaces() {
    return DataSource().allPlaces();
  }

  @override
  Widget build(BuildContext context) {
    pageContext = context;
    initializeComponet();

    return crossScaffold(crossBodyChild());
  }

  Widget tile(int index) {
    return ListTile(
      leading: Text(index.toString()),
      title: nameText(allPlaces[index].name),
      trailing: Image.asset(
        allPlaces[index].getFolderPath(),
        width: size.width * 0.3,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget listItemWidget(int index) {
    return Dismissible(
      key: Key(index.toString()),
      child: InkWell(
        child: tile(index),
        onTap: () {
          onItemDetailsPage(context: context, place: allPlaces[index]);
        },
      ),
    );
  }

  Widget listViewSeparetedDismissible() {
    return ListView.separated(
        itemBuilder: (context, index) => listItemWidget(index),
        separatorBuilder: ((context, index) => Divider(
              color: appLightColor,
            )),
        itemCount: allPlaces.length);
  }

  Widget gridItemWidget(int index) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(5),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: size.width * 0.25,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        allPlaces[index].getFolderPath(),
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3))),
              ),
              // Image.asset(
              //   allPlaces[index].getFolderPath(),
              //   fit: BoxFit.fill,
              //   width: size.width * 0.25,
              //   height: size.width * 0.2,
              // ),
              nameText(allPlaces[index].name),
            ],
          ),
        ),
        onTap: () {
          onItemDetailsPage(context: context, place: allPlaces[index]);
        },
      ),
    );
  }

  Widget griViewBuilder() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 0),
      itemBuilder: (context, index) => gridItemWidget(index),
      itemCount: allPlaces.length,
    );
  }

  Widget crossBodyChild() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: (orientation == Orientation.portrait)
          ? listViewSeparetedDismissible()
          : griViewBuilder(),
    );
  }
}
