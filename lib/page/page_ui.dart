import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/item.dart';
import 'package:my_app/profile_page/gallary_screen.dart';
import 'package:my_app/profile_page/igtv_screen.dart';
import 'package:my_app/profile_page/reels_screen.dart';
import 'package:my_app/profile_page/profile_header.dart';
import 'package:my_app/text_editor/text_editor.dart';
import 'package:my_app/question/question.dart';

  class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

  class _InstalistState extends State<InstaList> {

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
  itemBuilder: (context, index) {
  return items[index];
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

  ScrollController controller_pro=ScrollController();

List <Widget> page=[
  new Body(),
  new quespage(),
  new HomePage3(),
  new AppBar(),
  new DefaultTabController(
    length: 4,
    child: NestedScrollView(
      controller: controller_pro,
      headerSliverBuilder: (context, _) {
        return [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                profileHeaderWidget(context),
              ],
            ),
          ),
        ];
      },
      body: Column(
        children: <Widget>[
          Material(
            color: Colors.white,
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              indicatorWeight: 1,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.grid_on_sharp,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.question_mark_rounded,color: Colors.black,
                  ),//Image.asset(
                  //'assets/icons/igtv.png',
                  // height: 30,
                  // width: 30,
                  //  ),
                ),
                Tab(
                  icon: Icon(Icons.question_answer_outlined,color: Colors.black,), //Image.asset(
                  // 'assets/icons/reels.png',
                  // height: 25,
                  // width: 25,
                  // ),
                ) ,
                Tab(
                    icon: Icon(Icons.grid_3x3_rounded,color: Colors.black,
                    )
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Gallery(),
                Igtv(),
                Reels(),
                Gallery()
              ],
            ),
          ),
        ],
      ),
    ),
  ),
];