import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[


          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('posts').snapshots(),
              builder: (BuildContext, AsyncSnapshot<QuerySnapshot> querySnapshot) {
                if (querySnapshot.hasError)
                  return Text('some eror');
                if (querySnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                else {
                  final list = querySnapshot.data.documents;
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:Text( list[index]['Title']),
                          subtitle: Text(list[index]['Description']),

                        );
                      },
                      itemCount:list.length,
                  );
                }
              }

            ),

          )
        ],

      ),


    );
  }
}





/*
import 'package:flutter/material.dart';
import 'package:bechdoapp/Auth.dart';
import 'package:bechdoapp/adsPost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdsListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AdsPost()));
          },
          elevation: 5.0,
          splashColor: Colors.blueGrey,
        ),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Jobs'),
          elevation: 17.0,
*/

/* actions: <Widget>[
        IconButton(onPressed: (){},
            icon: Icon(Icons.search),
          ),],*//*

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
              height: 15.0,
              width: 15.0,
            ),
          ),

        ));




  }






  List<Widget> getMenuTiles(SizedBox sizedBox) {
    List<MenuTileDetail> tileDetails = <MenuTileDetail>[




    */
/*  MenuTileDetail(
          title: "Software developer C#",
          subtitle: "Need experienced developer",
          url:
              "https://pluralsight.imgix.net/paths/path-icons/csharp-e7b8fcd4ce.png?w=70",
          price: 2000),
      MenuTileDetail(
          title: "Fluttter developer",
          subtitle: "Need experienced flutter developer",
          url:
              "https://pixabay.com/photos/flower-nature-flora-petal-summer-3140492/"),
      MenuTileDetail(
          title: "Node developer",
          subtitle: "Need node developer internee",
          url:
              "https://hackr.io/tutorials/flutter/logo-flutter.svg?ver=1579862938"),*//*

    ];

    List<ListTile> tiles = <ListTile>[];

    for (var item in tileDetails) {
      // ignore: unnecessary_statements
      tiles.add(ListTile(
        leading: CircleAvatar(
            // backgroundImage: AssetImage(item.url),
            ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(item.Title),
            Text("5000"),
          ],
        ),
        subtitle: Text(item.Description),
      ));
    }
    return tiles;
  }
}

class MenuTileDetail {
  final String Title;
  final String Description;
  final String url;
  final int Price;
  MenuTileDetail({this.Title, this.Description, this.url, this.Price});
}

class DateField {
  final int date;
  DateField({this.date});
}*/
