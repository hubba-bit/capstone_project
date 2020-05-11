import 'package:bechdoapp/Auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({@required this.auth});
  final AuthBase auth;
  Future<void> _signOut() async{
    try{
      auth.signOut();

    }
     catch(e){
       print(e.toString());

     }
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar= Text('Search Here');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
        ),
   actions: <Widget>[
     IconButton(
       onPressed: (){
         setState(() {
           if(this.cusIcon.icon == Icons.search){
             this.cusIcon =Icon(Icons.cancel);
             this.cusSearchBar = TextField(textInputAction: TextInputAction.go,
               decoration: InputDecoration(
                 hintText: "Search Here",
               ),
               style: TextStyle(color: Colors.white),
             );


           }
           else{
             this.cusIcon = Icon (Icons.search);
             this.cusSearchBar = Text('');
           }
         });
       },
       icon: cusIcon,
     ),
    /* FlatButton*//*(

       child: Text(
         'Logout',
         style: TextStyle(
           fontSize: 16.0,
           color: Colors.white,
         ),
       ),
       onPressed: _signOut,

     )
*/
   ],
        elevation: 10.0,
        title:
       cusSearchBar,


        ),

      );

  }
  Widget _bodyContent(){
    return Container(

    );
  }
}