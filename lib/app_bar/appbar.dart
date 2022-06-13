import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/item.dart';
import 'package:my_app/main.dart';
import 'package:universal_html/js.dart';
late BuildContext _context;
class Alert {
    final BuildContext context;
  //  final ScrollController controller;
  // final Duration duration;
    Alert({
    Key? key,
     required this.context ,
    //  required this.controller,
    // this.duration = const Duration(milliseconds:400 )
  });
     gett(BuildContext context)=> _context=context;
}
//List<BuildContext>_context=[];

List <AppBar> App_bar=[
  AppBar(
    title: Text("MitStacK"),
    titleSpacing: 00.0,
    centerTitle: true,
    toolbarHeight: 40.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(360)),
    elevation: 0.00,
    /*actions: [
      IconButton(
          onPressed:(){
            items.add(
            Flexible(
              child:Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(left:100,right: 20),
                  child:Text(
                    "hi hi hello how are you aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),

            ),

          ); }
          , icon: Icon(Icons.add))
    ],*/
    backgroundColor: Colors.red[900],
    /* bottom:  Container(
                    color: Colors.blue,
                    height: 60.0,
                    alignment: Alignment.center,
                    child: new HomePage()
                    )*/
  ),


  AppBar(
    title: Text(
        "Questions",
        style: TextStyle(
          fontWeight: FontWeight.bold,

        ),
    ),

    titleSpacing: 40.0,
    centerTitle: false,
    toolbarHeight: 40.0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(360)),
    elevation: 0.00,
    backgroundColor: Colors.red[900],
    /*actions: <Widget>[
    IconButton(
      icon: Icon(Icons.comment),
      tooltip: 'Comment Icon',
      onPressed: () {
      },
    ),]*/
  ),
  AppBar(),
  AppBar(),
  AppBar(
    backgroundColor: Colors.red[900], //Colors.white,
    toolbarHeight: 40.0,
    //  titleSpacing: 40.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(360)),
      title: Text(
        "MitStacK",
          style:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
       ),
      centerTitle: true,
      elevation: 0,
      actions: [
      IconButton(
        icon: Icon(
          Icons.add_box_outlined,
          color: Colors.white,
          ),
        onPressed: (){
          showModalBottomSheet<void>(
            backgroundColor: Colors.grey[900],
              context: _context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              builder: (context){return Container(
                height: 500,
                child: Container(
                    padding: EdgeInsets.fromLTRB(30, 30, 20, 10),
                    alignment: Alignment.topCenter,
                    child:Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      minVerticalPadding: 15,
                      leading: new Icon(Icons.photo),
                      title: new Text('Photo'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      minVerticalPadding: 15,
                      leading: new Icon(Icons.music_note),
                      title: new Text('Music'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      minVerticalPadding: 15,
                      leading: new Icon(Icons.videocam),
                      title: new Text('Video'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      minVerticalPadding: 15,
                      leading: new Icon(Icons.share),
                      title: new Text('Share'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ))
              );});
        },
      ),
      IconButton(
        icon: Icon(
        Icons.menu,
        color: Colors.white,
        ),
        onPressed: () => print("Add"),
      )
    ],
  ),
];