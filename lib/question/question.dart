
import 'package:flutter/material.dart';
import 'package:my_app/answer/answer.dart';
import 'package:my_app/text_editor/textEditor/home_page.dart';


ScrollController controller_ques=ScrollController();
class quespage extends StatefulWidget {
  @override
  quespageState createState() => quespageState();

}

class quespageState extends State<quespage>{
  late OverlayEntry _popupDialog;
  @override
  Widget build(BuildContext context){
    return ListView.builder(
 //     controller: controller_ques,
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
              Flexible(
               child:GestureDetector(
                // behavior: HitTestBehavior.translucent,
                 onTap:  (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => (Answer_ui()))
                   );
                 },
                 child: Container(
                  //fit: FlexFit.loose,
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

               ),),
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
                Container(
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
                      ))
                    ],
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("1 day ago ",style: TextStyle(color: Colors.grey)),
                ),*/
              ]
          );



        }

    );

  }

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