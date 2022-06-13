import 'package:flutter/material.dart';
import 'package:my_app/answer/answer.dart';
//import  'dart:ui' as ui;
import 'package:my_app/bottombar.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/item.dart';
import 'package:my_app/login.dart';
import 'package:my_app/profile_page/ProfileBaseScreen.dart';
import 'package:my_app/text_editor/textEditor/main.dart';
//import 'package:my_app/profile_page.dart';
import 'package:my_app/text_editor/text_editor.dart';
import 'package:my_app/app_bar/appbar.dart';
import 'package:my_app/page/page_ui.dart';
import 'package:my_app/comment/comment_page.dart';
import 'package:universal_html/js.dart';
import 'package:flutter/services.dart';
import 'package:my_app/question/question.dart';
import 'package:my_app/answer/comment/comment.dart' as com;
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';



ScrollController controller1 = ScrollController();
ScrollController controller= ScrollController(); //controller1;
late BuildContext context;
 bool isvisible = true;
//MATERIAL
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(login());
  controller=controller1;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(

    statusBarColor: Colors.black,

  ));

}
//void main() => runApp( login());
//runApp(MyApp());
//runApp(MyAppprofile());
//runApp(MyApp3());
//runApp(mycomment());
//runApp(myAnswer());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new MaterialApp(color: Colors.black,
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),//ThemeData.dark(),
      theme: new ThemeData(
       // backgroundColor: Colors.black,

        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        //buttonColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.white),
        primaryTextTheme: TextTheme(
         // bodyText1: TextStyle(color: Colors.black,fontFamily: "Aveny")
        ),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))
      ),
      home: new myhome()
    );
  }
}
//END OF MATERIAL
class myhome extends StatefulWidget{
  @override
  myhomestate createState() => myhomestate();
}

//HOME TOP BOTTOM BAR
class myhomestate extends State<myhome>{//StatelessWidget{

  //late ScrollController controller;
  /*final _kTabPages = <Widget>[
    const Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];
  final _kTabs = <Tab>[
    const Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
    const Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
    const Tab(icon: Icon(Icons.forum), text: 'Tab3'),
  ];*/


  /*final topBar =  DefaultTabController(
  length: _kTabs.length,
  child: Scaffold(
  appBar: AppBar(
  title: const Text('appbar title'),
  backgroundColor: Colors.cyan,
  // If `TabController controller` is not provided, then a
  // DefaultTabController ancestor must be provided instead.
  // Another way is to use a self-defined controller, c.f. "Bottom tab
  // bar" example.
  bottom: TabBar(
  tabs: _kTabs,
  ),
  ),
  body: TabBarView(
  children: _kTabPages,
  ),
  ),
  );

  new AppBar (
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.camera_alt),
    title: SizedBox(
      height: 35.0,child: new Icon(Icons.air),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.send),
      )
    ]
  );*/
 @override
 void initState() {
   controller.addListener(listen);
   super.initState();
 }
 @override
 void dispose() {
   controller.removeListener(listen);
   super.dispose();
 }

 void listen(){
   final direction = controller.position.userScrollDirection;
   if(direction == ScrollDirection.forward) {
     show();//print("forward");
   }else if (direction == ScrollDirection.reverse){
     hide();//print("reverse");
   }
 }

 void show() {
   if (!isvisible) setState(() {
     isvisible = true; //print("inside show $isVisible");
   //});
   items.add(new Mylist(
       user_image: new NetworkImage(
           "https://m.media-amazon.com/images/M/MV5BYjFjZGRjMWYtZTA5MS00OTZkLWI1MjctNDQ2NmQzMWM1NzRhXkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_UY317_CR0,0,214,317_AL__QL50.jpg"),
       post_image: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80"
       ,user_name: "Mohan Lal",
       )
   );
   });
 }
 void hide (){
   if(isvisible) setState(() {
     isvisible = false;//print("inside hide $isvisible");
   });
 }

  void add_widget(){
   setState((){
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
    );
   }
   );
  }

 @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: App_bar[ind],
        /*AppBar(
            title: Text("MitStacK"),
            titleSpacing: 00.0,
            centerTitle: true,
            toolbarHeight: 50.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(360)),
            elevation: 0.00,
            backgroundColor: Colors.red,
          actions: [
            IconButton(
                onPressed:(){add_widget();
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
           /* bottom:  Container(
                    color: Colors.blue,
                    height: 60.0,
                    alignment: Alignment.center,
                    child: new HomePage()
                    )),*/
        body: IndexedStack(
            index:ind,
            children:page
          ),//new Body(),
        bottomNavigationBar: AnimatedContainer(
          color: Colors.red,
          duration: const Duration(milliseconds: 300),
          height: 40,//isvisible ? 40.0 : 0.0,
          alignment: Alignment.center,
          child: //new HomePage(),
          BottomAppBar(
            color: Colors.black,
            child: //new HomePage()
             new Row(
              // alignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.home,
                    color: (ind==0)?Colors.white : Colors.grey,
                  ),
                  onPressed: () { setState(() => ind = 0);
                    controller=controller1;
                    },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search,
                    color: (ind==1)?Colors.white : Colors.grey,
                  ),
                  onPressed: () { setState(() => ind = 1);
                    controller=controller_ques;
                    },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box,
                    color: (ind==2)?Colors.white : Colors.grey,
                  ),
                  onPressed: () { setState(() => ind = 2);},
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: (ind==3)?Colors.white : Colors.grey,
                  ),
                  onPressed: () { setState(() => ind = 3);},
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box,
                    color: (ind==4)?Colors.white : Colors.grey,
                  ),
                  onPressed: () { setState(() => ind = 4);Alert obj=new Alert(context: context);obj.gett(context);
                    controller=controller_pro;
                  }
                ),
              ],
            ),
          ),
        ));
  }
}
//END OF HOME

//BODY
class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(child: InstaList())
      ],
    );
  }
}
//END OF BODY


//LISTVIEW
class InstaList extends StatefulWidget {
  @override
  _InstalistState createState() => _InstalistState();

}

class _InstalistState extends State<InstaList>{

 /* @override
  void initState() {
    controller.addListener(listen);
    super.initState();
  }
  @override
  void dispose() {
    controller.removeListener(listen);
    super.dispose();
  }

  void listen(){
    final direction = controller.position.userScrollDirection;
      if(direction == ScrollDirection.forward) {
        show();print("forward");
      }else if (direction == ScrollDirection.reverse){
        hide();print("reverse");
      }
  }

  void show(){
    if(!isVisible) setState(() {
      myhomestate.isVisible = true;print("inside show $isVisible");
    });
  }
  void hide (){
    if(isVisible) setState(() {
      myhomestate.isVisible = false;print("inside hide $isVisible");
    });
  }
*/

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {

//    var deviceSize = MediaQuery.of(context).size;

     return ListView.builder(
        itemCount: items.length,
        controller: controller,
        itemBuilder: (context,index) { return items[index];
           /*return new Column(
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
                              image: new NetworkImage("https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")
                            ),
                          ),
                        ),
                        new SizedBox(
                          width: 10.0,
                        ),
                        new Text(
                          "sooraj",
                          textDirection: TextDirection.ltr,
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
                  child: new Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                    fit: BoxFit.cover,
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
                    textDirection: TextDirection.ltr,
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
                            hintTextDirection: TextDirection.ltr
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
          );*/
        }
    );
  }
}
//END OF LISTVIEW