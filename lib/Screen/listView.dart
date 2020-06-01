

import 'dart:html';

import 'package:bechdoapp/Screen/adsPost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';


class ListScreen extends StatefulWidget {

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  List<IconData> _icons = [
    Icons.directions_car,
    Icons.smartphone,
    Icons.pets,
    Icons.home,
    Icons.business_center,
    Icons.laptop_chromebook,
  ];

  Widget _buildIcon(int index) {
    return Container(
      height: 55.0,
      width: 55.0,
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .splashColor,
        borderRadius: BorderRadius.circular(30.0),

      ),
      child: Icon(_icons[index], size: 30.0, color: Theme
          .of(context)
          .accentColor,
      ),
    );
  }


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
        ),
        body: Column(

          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera, size: 30.0,
              ),

            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0, top: 16.0),
              child: Text('What would you like to find?', style: TextStyle(
                fontSize: 30.0, fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIcon(0),
                _buildIcon(1),
                _buildIcon(2),
                _buildIcon(3),
                _buildIcon(4),
                _buildIcon(5),


              ],
            ),

            /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                */
            SizedBox(
              height: 22.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('posts').snapshots(),
                  builder:
                      (BuildContext,
                      AsyncSnapshot<QuerySnapshot> querySnapshot) {
                    if (querySnapshot.hasError) return Text('some eror');
                    if (querySnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Container(
                        child: Center(
                          child: Text('Loading....'),
                        ),
                      );
                    } else {
                      final list = querySnapshot.data.documents;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(

                            child: ListTile(

                              leading: CircleAvatar(
                                radius: 25.0,
                               /* child: (_image != null) ? Image.file(
                                    _image, fit: BoxFit.fill) :
                                Image.network(''),*/
                              ),

                              title: Text(list[index]['title']),
                              // subtitle: Text(list[index]['subtitle']),
                              /* isThreeLine: true,
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(list[index]['subtitle']),
                                Text(list[index]['price']),
                              ],
                            ),*/
                              // leading: Image.network(),
                              subtitle: Text(list[index]['subtitle']),


                              trailing: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(top: 10.0),),
                                  Text('Rs.'),
                                  Text(list[index]['price']),
                                ],
                              ),

                              // isThreeLine: true,
                              /*onTap: () {
                                  (list[index]['price']);
                                }*/

                            ),
                          );
                        },
                        itemCount: list.length,
                      );
                    }
                  }),
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
          ),],*/ /*

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
              "https://pluralsight.imgix.net/paths/path-icons/csharp-e7b8fcd4ce.png?w=70",
          price: 100),
      MenuTileDetail(
          title: "Node developer",
          subtitle: "Need node developer internee",
          url:
              "https://hackr.io/tutorials/flutter/logo-flutter.svg?ver=1579862938"),*/ /*

    ];

    List<ListTile> tiles = <ListTile>[];

    for (var item in tileDetails) {
      // ignore: unnecessary_statements
      tiles.add(ListTile(
        leading: Image.network(item.url),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(item.Title),
            Text(item.price.toString()),
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
/*

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File _image;
  @override
  Widget build(BuildContext context) {
    Future getImage () async{
      // ignore: deprecated_member_use
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image =image as File ;
        print('Image path $_image');
      });
    }
    return Scaffold(
      body: Container(

        child: IconButton(icon: Icon(Icons.camera, size: 30.0,),
            onPressed:(){
              getImage();
            }),

      ),
    );
  }
}
}

 */
