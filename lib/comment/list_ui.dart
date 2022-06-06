import 'package:flutter/material.dart';
//import 'package:back_button_interceptor/back_button_interceptor.dart';

class CommentList extends StatefulWidget{
  @override
  CommentlistState createState() =>CommentlistState();
}
class CommentlistState extends State<CommentList>{
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    /*return WillPopScope(
      onWillPop: ()async{
        Navigator.pop(context);
        return true;


      },
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "On Back pressed",
            style: new TextStyle(color: Colors.white),
          ),
        ),
        body: new Center(
          child: new Text("Home Page"),
        ),
      ),
    );*/

    /*Future<bool> myInterceptor(bool stopDefaultButtonEvent) {
      print("BACK BUTTON!"); // Do some stuff.
      return ;
    }

    @override
    void initState() {
      super.initState();
      BackButtonInterceptor.add(myInterceptor);
    }

    @override
    void dispose() {
      BackButtonInterceptor.remove(myInterceptor);
      super.dispose();
    }*/




    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[ Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new  Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Fname%2Fnm1860184%2F&psig=AOvVaw0aZzXLy9tjmw5amgnrjJMJ&ust=1651560778210000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjYq76dwPcCFQAAAAAdAAAAABAD"),
                            ),
                          ),
                        ),
                        new SizedBox(
                          width: 10.0,
                        ),
                        new Text(
                          "sooraj",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    new IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: null,
                    )
                  ],
                ),
              ),

                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child:Text(
                    "What is the difference between Que and Stack ?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.00,
                    ),

                  ),/*new Image.network("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Fname%2Fnm1860184%2F&psig=AOvVaw0aZzXLy9tjmw5amgnrjJMJ&ust=1651560778210000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjYq76dwPcCFQAAAAAdAAAAABAD",
                    fit: BoxFit.cover,
                  ),*/
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new IconButton(
                            icon: new Icon(Icons.favorite),
                            color: Colors.red,
                            onPressed: (){
                              setState((){
                                isPressed =!isPressed;
                              //  Navigator.of(context).pop();
                              });
                            },
                          ),
                          new SizedBox(
                            width: 16.0,
                          ),
                          new Icon(
                              Icons.comment
                          ),
                          new SizedBox(
                            width: 16.0,
                          ),
                          new Icon(Icons.airplanemode_active),
                        ],
                      ),
                      new Icon(
                          Icons.bookmark
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "5 Answers",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage("")),
                          )
                      ),
                      new SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: new TextField(
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a comment",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("1 day ago ",style: TextStyle(color: Colors.grey)),
                ),
              ]
          );



        }

    );
  }
}