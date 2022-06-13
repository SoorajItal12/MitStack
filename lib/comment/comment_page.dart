import 'package:flutter/material.dart';
import 'package:my_app/comment/list_ui.dart';


class mycomment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home:comment_ui(),
    );
  }
}
class comment_ui extends StatefulWidget {
  @override
  comment_ui_state createState() => comment_ui_state();
}

class comment_ui_state extends State<comment_ui>
{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
            title: Text("Comment"),
            titleSpacing: 50.0,
            centerTitle: false,
            toolbarHeight: 50.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(360)),
            elevation: 0.00,
            backgroundColor: Colors.red,
          actions: <Widget>[
      IconButton(
      icon: Icon(Icons.comment),
      tooltip: 'Comment Icon',
      onPressed: () {
        },
    ),]
      ),
      body: CommentList(),

    );

  }
}