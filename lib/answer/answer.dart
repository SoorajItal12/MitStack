import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/answer/comment/comment.dart';
import 'package:my_app/question/question.dart';
import 'package:my_app/app_bar/appbar.dart';
import 'package:my_app/profile_page/gallary_screen.dart';
import 'package:my_app/profile_page/igtv_screen.dart';
import 'package:my_app/profile_page/reels_screen.dart';
import 'package:my_app/bottombar.dart';
import 'package:my_app/answer/comment/comment.dart' as com;
import 'package:my_app/text_editor/textEditor/home_page.dart';


class myAnswer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home:Answer_ui(),
    );
  }
}

late OverlayEntry _popupDialog;
late ScrollController scrollcontroller_ans =ScrollController();
OverlayEntry _createPopupDialog() {
  return OverlayEntry(
    builder: (context) => AnimatedDialog(
      child: _createPopupContent(),
    ),
  );
}

Widget _createPopupContent() => Container(
  // color: Colors.black,
    height: 250,
    width: 250,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      border: Border.all(
        color: Colors.black87,
        width: 1,
      ),
    ),
    //  padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: .0),
    // child: ClipRRect(
    //   borderRadius: BorderRadius.circular(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: Text(
            "Report",
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),
          ),
          onPressed: null,
        ),
        SizedBox(height: 20,),
        Divider(
          thickness: 1, // thickness of the line
          indent: 20, // empty space to the leading edge of divider.
          endIndent: 20, // empty space to the trailing edge of the divider.
          color: Colors.grey, // The color to use when painting the line.
          height: 10,
        ),
        SizedBox(height: 20,),
        TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),
          ),
          onPressed: ()=>_popupDialog.remove(),
        ),
      ],
    )
  // )
);
bool isVisible_ans =true;

class Answer_ui extends StatefulWidget {
  @override
  Answer_ui_state createState() => Answer_ui_state();
}

class Answer_ui_state extends State<Answer_ui>
{

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text("Answers"),
          titleSpacing: 0,
          centerTitle: false,
          toolbarHeight: isVisible_ans?40.0:0,
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
      body: Answerpage(),
      bottomNavigationBar:  AnimatedContainer(
        color: Colors.red,
        duration: const Duration(milliseconds: 300),
        height: isVisible_ans ? 40.0 : 0.0,
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
                  color: Colors.white,
                ),
                onPressed: () { setState(() => ind = 0);},
              ),
              new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () { setState(() => ind = 1);},
              ),
              new IconButton(
                icon: Icon(
                  Icons.add_box,
                  color: Colors.white,
                ),
                onPressed: () { setState(() => ind = 2);},
              ),
              new IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () { setState(() => ind = 3);},
              ),
              new IconButton(
                  icon: Icon(
                    Icons.account_box,
                    color: Colors.white,
                  ),
                  onPressed: () { setState(() => ind = 4);Alert obj=new Alert(context: context);obj.gett(context);}
              ),
            ],
          ),
        ),
      ),

    );

  }
}

class Answerpage extends StatefulWidget {
  @override
  AnswerpageState createState() => AnswerpageState();

}

class AnswerpageState extends State<Answerpage> {
  bool upbutton=false;
  bool downbutton=false;
  @override
  void initState() {
    scrollcontroller_ans.addListener(listen);
    super.initState();
  }
  @override
  void dispose() {
    scrollcontroller_ans.removeListener(listen);
    super.dispose();
  }

  void listen(){
    final direction = scrollcontroller_ans.position.userScrollDirection;
    if(direction == ScrollDirection.forward) {
      show();print("forward");
    }else if (direction == ScrollDirection.reverse){
      hide();print("reverse");
    }
  }
  void show(){
    if(!isVisible_ans) setState(() {
      isVisible_ans = true;//print("inside show $isVisible");
    });
    /*  items.add(new Mylist(
       user_image: new NetworkImage("https://m.media-amazon.com/images/M/MV5BYjFjZGRjMWYtZTA5MS00OTZkLWI1MjctNDQ2NmQzMWM1NzRhXkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_UY317_CR0,0,214,317_AL__QL50.jpg"),
       post_image: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80"));
*/
  }
  void hide (){
    if(isVisible_ans) setState(() {
      isVisible_ans = false;//print("inside hide $isvisible");
    });
  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 1,
      child: NestedScrollView(
        controller: scrollcontroller_ans,
        headerSliverBuilder: (context, _) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
             // new Expanded(
             // width: double.infinity,
              //decoration: BoxDecoration(color: Colors.black),
                    answerHeaderWidget(context)
           // )
                //   profileHeaderWidget(context),
                ],
              ),
            ),
          ];
        },
        body:Column( children: [Container(
          alignment: Alignment.topCenter,
          height: 60,
          color: Colors.black,
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new  Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage("https://everythingbarca.com/wp-content/uploads/getty-images/2017/07/1231862540.jpeg")),
                  )
              ),
              new SizedBox(
                width: 10.0,
              ),
              Container(
                width: 250,
                height: 40,
                //  padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //   color: Colors.grey,
                  border: Border.all(
                    color: Colors.grey,
                    width: 3,
                  ),
                ),
                child: new TextButton(
                  child: Text(
                    "   Add a answer..",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ((TextPage_ui())))
                    );
                  },
                ),
              ),
            ],
          ),
        ),
          const Divider(
            thickness: 1, // thickness of the line
            indent: 20, // empty space to the leading edge of divider.
            endIndent: 20, // empty space to the trailing edge of the divider.
            color: Colors.grey, // The color to use when painting the line.
            height: 10, // The divider's height extent.
          ),
          Expanded(child: Container(
            color: Colors.black,
            child:ListView.builder(
               // controller: scrollcontroller_ans,
                itemCount: 10,
                itemBuilder: (context,index) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[ Container(
                        color: Colors.black,
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
                                        fit: BoxFit.cover,
                                        image: new NetworkImage("https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR_BSXPlBjoBeJruSaCamv7kQuMNjoIIWX0CITXUVoapFCbRM9g")//NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Fname%2Fnm1860184%2F&psig=AOvVaw0aZzXLy9tjmw5amgnrjJMJ&ust=1651560778210000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjYq76dwPcCFQAAAAAdAAAAABAD"),
                                    ),
                                  ),
                                ),
                                new SizedBox(
                                  width: 10.0,
                                ),Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:<Widget>[
                                      new Text(
                                        "Lionel Messi",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      new SizedBox(height: 10,),
                                      new Row(
                                          children:[
                                            new Text(
                                              "Former student",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey
                                              ),
                                            ),
                                            new Text(
                                              " ."" 30 min ago",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.grey
                                              ),
                                            )
                                          ])
                                    ]
                                ),
                              ],
                            ),
                            new IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: (){
                                _popupDialog = _createPopupDialog();
                                Overlay.of(context)!.insert(_popupDialog);
                              },
                            )
                          ],
                        ),
                      ),

                        //GestureDetector(child:
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            color: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child:Column(
                                children:[
                                  /*new Text(
                                    "What is the difference between Que and Stack ?What is the purpose of Gradle?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.00,
                                    ),
                                  ),/*new Image.network("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Fname%2Fnm1860184%2F&psig=AOvVaw0aZzXLy9tjmw5amgnrjJMJ&ust=1651560778210000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjYq76dwPcCFQAAAAAdAAAAABAD",
                    fit: BoxFit.cover,
                  ),*/
                                  new SizedBox(height: 10,),*/
                                  new Text(
                                    //"I could use a little help understanding the concepts behind Gradle(plugin v 0.7) in the context of Android Studio 0.4.0. I have not used Gradle before and it's causing me nothing but problems. I'm not seeing its purpose/benefit because I don't know enough about it.",
                                    "Some of your questions are general in that they speak to why build tools are a good thing as a general matter. Others get to Gradle specifically. I will try to address both categories as succinctly as possible while trying to avoid others' nitpicking terminology.Build tools like Maven, Gradle, SBT, Leiningen, etc. help to automate tasks that we would otherwise have to manually perform or manually automate. I use the latter to describe what I used to do with Ant--writing custom tasks to compile, run, generate Javadoc, etc. so the tasks could be automated for the future. By conforming to conventions originally defined by Maven and adopted by the others subsequently (like putting your source in src/main/java), this becomes possible. If I follow the conventions, the build tool can compile, run, generate Javadoc, test, and everything else with minimal extra work.Now to your questions (in order):"
                                    ,style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.00,
                                        color: Colors.grey[100]
                                    ),
                                  )
                                ]),),
                        ),
                        //onTap:  (){
                        //  Navigator.push(
                        //     context,
                        //    MaterialPageRoute(builder: (context) => (myAnswer()))
                        //  );
                        //  },
                        // ),
                        /*Padding(
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
                                //isPressed =!isPressed;
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
                ),*/
                        SizedBox(height: 10,),
                        Container(
                          color: Colors.black,
                          alignment:Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child:Container(
                            alignment:Alignment.center,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[900],
                            ),
                            //color:Colors.grey,
                            child :Row(
                          //    mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                new IconButton(
                                    color: (upbutton)?Colors.green : Colors.grey,
                                    onPressed: (){upbutton ? upbutton=false :upbutton=true;downbutton=false;},
                                    icon:Icon(FontAwesomeIcons.arrowUp)
                                ),
                                Text(
                                  "200",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,

                                  ),

                                ),
                            SizedBox(width:20),
                            new IconButton(
                                  color: (downbutton)?Colors.red : Colors.grey,
                                onPressed: (){upbutton=false;downbutton ? downbutton=false:downbutton=true;},
                                icon:Icon(FontAwesomeIcons.arrowDown)
                            ),
                            Text(
                              "30",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                                SizedBox(width:20),
                                new IconButton(
                                  //    color: Colors.white,
                                    onPressed: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => (com.comment_ui()))
                                      );
                                    },
                                    icon:Icon(FontAwesomeIcons.comment)
                                ),
                                Text(
                                  "2",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                                  ],
                                ),
                              ),
                          ),
                        /* Container(
          color: Colors.black,
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage("https://resources.premierleague.com/premierleague/photos/players/250x250/p14937.png")),
                  )
              ),
              new SizedBox(
                width: 10.0,
              ),
              Container(
                  width: 250,
                  height: 40,
                  //  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    //   color: Colors.grey,
                    border: Border.all(
                      color: Colors.grey,
                      width: 3,
                    ),
                  ),
                  child: new TextButton(
                    child: Text(
                      "   Add a answer..",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: (){},
                  ),
              )
            ],
          ),
        ),*/
                        /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("1 day ago ",style: TextStyle(color: Colors.grey)),
                ),*/
                      ]
                  );
                }
            ),
          ),
        ),


        ]),
      ),
    );
  }
    /*return DefaultTabController(
      length: 4,
      child: NestedScrollView(
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
                      Icons.question_mark_rounded, color: Colors.black,
                    ), //Image.asset(
                    //'assets/icons/igtv.png',
                    // height: 30,
                    // width: 30,
                    //  ),
                  ),
                  Tab(
                    icon: Icon(Icons.question_answer_outlined,
                      color: Colors.black,), //Image.asset(
                    // 'assets/icons/reels.png',
                    // height: 25,
                    // width: 25,
                    // ),
                  ),
                  Tab(
                      icon: Icon(Icons.grid_3x3_rounded, color: Colors.black,
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
    );*/

  }

Widget answerHeaderWidget(BuildContext context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[ Container(
        color: Colors.black,
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
                        fit: BoxFit.cover,
                        image: new NetworkImage("https://resources.premierleague.com/premierleague/photos/players/250x250/p14937.png")//NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Fname%2Fnm1860184%2F&psig=AOvVaw0aZzXLy9tjmw5amgnrjJMJ&ust=1651560778210000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjYq76dwPcCFQAAAAAdAAAAABAD"),
                    ),
                  ),
                ),
                new SizedBox(
                  width: 10.0,
                ),Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:<Widget>[
                      new Text(
                        "Christiano Ronaldo",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      new SizedBox(height: 10,),
                      new Row(
                          children:[
                            new Text(
                              "Student",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              ),
                            ),
                            new Text(
                              " ."" 1 hour ago",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey
                              ),
                            )
                          ])
                    ]
                ),
              ],
            ),
            new IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: (){
                _popupDialog = _createPopupDialog();
                Overlay.of(context)!.insert(_popupDialog);
              },
            )
          ],
        ),
      ),

        //GestureDetector(child:
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:Column(
                children:[
                  new Text(
                    "What is the difference between Que and Stack ?What is the purpose of Gradle?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.00,
                    ),
                  ),/*new Image.network("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Fname%2Fnm1860184%2F&psig=AOvVaw0aZzXLy9tjmw5amgnrjJMJ&ust=1651560778210000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjYq76dwPcCFQAAAAAdAAAAABAD",
                    fit: BoxFit.cover,
                  ),*/
                  new SizedBox(height: 10,),
                  new Text(
                    "I could use a little help understanding the concepts behind Gradle(plugin v 0.7) in the context of Android Studio 0.4.0. I have not used Gradle before and it's causing me nothing but problems. I'm not seeing its purpose/benefit because I don't know enough about it.",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.00,
                        color: Colors.grey[100]
                    ),
                  )
                ]),),
        ),
          //onTap:  (){
          //  Navigator.push(
           //     context,
            //    MaterialPageRoute(builder: (context) => (myAnswer()))
          //  );
        //  },
       // ),
        /*Padding(
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
                                //isPressed =!isPressed;
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
                ),*/
        SizedBox(height: 10,),
        Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "10 Answers",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
       /* Container(
          color: Colors.black,
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage("https://resources.premierleague.com/premierleague/photos/players/250x250/p14937.png")),
                  )
              ),
              new SizedBox(
                width: 10.0,
              ),
              Container(
                  width: 250,
                  height: 40,
                  //  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    //   color: Colors.grey,
                    border: Border.all(
                      color: Colors.grey,
                      width: 3,
                    ),
                  ),
                  child: new TextButton(
                    child: Text(
                      "   Add a answer..",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: (){},
                  ),
              )
            ],
          ),
        ),*/
        /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("1 day ago ",style: TextStyle(color: Colors.grey)),
                ),*/
      ]
  );


}


class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedDialogState();
}

class AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: Center(
        child: FadeTransition(
          opacity: scaleAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}