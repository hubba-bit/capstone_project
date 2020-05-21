import 'package:flutter/material.dart';
import 'package:bechdoapp/Auth.dart';

class AdsListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        elevation: 5.0,
        splashColor: Colors.blueGrey,
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Jobs'),
        elevation: 17.0,
        /* actions: <Widget>[
        IconButton(onPressed: (){},
            icon: Icon(Icons.search),
          ),],*/
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(


    children: getMenuTiles(

SizedBox(
  height:15.0,
  width:15.0,
),

      ),
    ));

  }

  List<Widget> getMenuTiles(SizedBox sizedBox) {
    List<MenuTileDetail> tileDetails = <MenuTileDetail>[
      MenuTileDetail(
          title: "Software developer C#",
          subtitle: "Need experienced developer",
          url:
              "https://pluralsight.imgix.net/paths/path-icons/csharp-e7b8fcd4ce.png?w=70",
      price: 2000),

          MenuTileDetail(
          title: "Fluttter developer",
          subtitle: "Need experienced flutter developer",
          url:"https://pixabay.com/photos/flower-nature-flora-petal-summer-3140492/"
          ),
      MenuTileDetail(
          title: "Node developer",
          subtitle: "Need node developer internee",
          url:
              "https://hackr.io/tutorials/flutter/logo-flutter.svg?ver=1579862938"),

    ];


    List<ListTile> tiles = <ListTile>[];

    for (var item in tileDetails) {

      // ignore: unnecessary_statements
      (tiles.add(ListTile
        (

        leading: CircleAvatar(

          backgroundImage: AssetImage(item.url),

        ),
        title: Text(item.title),
        subtitle: Text(item.subtitle),

      )));}
    return tiles;}}
    class MenuTileDetail {
  final String title;
  final String subtitle;
  final String url;
  final int price;
  MenuTileDetail({this.title, this.subtitle, this.url, this.price});

}
class DateField{
  final int date;
  DateField( {this.date});

}
