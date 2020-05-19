import 'package:flutter/material.dart';

class AdsListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
         title:Text('Jobs'),
         elevation: 17.0,
         /* actions: <Widget>[
        IconButton(onPressed: (){},
            icon: Icon(Icons.search),
          ),],*/
      ),
        body: ListView(
      children: getMenuTiles(

      ),
    ));
  }

  List<Widget> getMenuTiles() {
    List<MenuTileDetail> tileDetails = <MenuTileDetail>[
      MenuTileDetail(
          title: "Software developer C#",
          subtitle: "Need experienced developer",
          url:
              "https://pluralsight.imgix.net/paths/path-icons/csharp-e7b8fcd4ce.png?w=70"),
      MenuTileDetail(
          title: "Fluttter developer",
          subtitle: "Need experienced flutter developer",
          url:
              "https://hackr.io/tutorials/flutter/logo-flutter.svg?ver=1579862938"),
      MenuTileDetail(
          title: "Node developer",
          subtitle: "Need node developer internee",
          url:
              "https://hackr.io/tutorials/flutter/logo-flutter.svg?ver=1579862938"),
    ];

    List<ListTile> tiles = <ListTile>[];

    for (var item in tileDetails) {
      tiles.add(ListTile(

        leading: CircleAvatar(
          backgroundImage: AssetImage(item.url),
        ),
        title: Text(item.title),
        subtitle: Text(item.subtitle),
      ));
    }

    return tiles;
  }
}

class MenuTileDetail {
  final String title;
  final String subtitle;
  final String url;

  MenuTileDetail({this.title, this.subtitle, this.url});
}
