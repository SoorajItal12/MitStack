import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class comment_ui extends StatefulWidget{
  @override
  commentState createState() => commentState();
}

bool replyVisible=true;

class commentState extends State<comment_ui>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Comments"),
    titleSpacing: 0,
    centerTitle: false,
    toolbarHeight:40,// isVisible_ans?40.0:0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(360)),
    elevation: 0.00,
    backgroundColor: Colors.red[900],
      ),
       body:commentpage() ,
    );
}
}

class commentpage extends StatefulWidget{
  @override
  commentpageState createState() => commentpageState();
}

class commentpageState extends State<commentpage>{
  @override
  Widget build(BuildContext context){
    return Column(children:[Expanded(child:
    Container(child:ListView.builder(
      itemCount: 2,
        itemBuilder:(context,index){
          return comment_list();
        }
    ),),),
      comment_box(),
    ]);
  }
  }

Widget comment_box(){
  return Container(
    alignment: FractionalOffset.bottomCenter,
    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
    child: Row(
        children:[
          Container(
              height: 35.0,
              width: 35.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage("https://everythingbarca.com/wp-content/uploads/getty-images/2017/07/1231862540.jpeg"),
                ),
              )
          ),
          SizedBox(width: 10,),
          Expanded(
            child:  TextField(
              decoration:  InputDecoration(
                border: InputBorder.none,
                hintText: "     Add a comment",
                hintTextDirection: TextDirection.ltr,
              ),
            ),
          ) ,
          TextButton(
            child: Text(
              "Post",
            ),
            onPressed:null,
          )
        ]
    ),
  );
}

class comment_list extends StatefulWidget{

  @override
  comment_listState createState() => comment_listState();
}

  class comment_listState extends State<comment_list>{
    Widget build(BuildContext context) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 70,
              color: Colors.black,
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new NetworkImage(
                                    "https://resources.premierleague.com/premierleague/photos/players/250x250/p14937.png") //NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Fname%2Fnm1860184%2F&psig=AOvVaw0aZzXLy9tjmw5amgnrjJMJ&ust=1651560778210000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjYq76dwPcCFQAAAAAdAAAAABAD"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Christiano Ronaldo",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  "Student",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),
                                ),
                                Text(
                                  " ."" 1 hour ago",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]
                  ),
                  IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed:  (){
                        _popupDialog = _createPopupDialog();
                        Overlay.of(context)!.insert(_popupDialog);
                      },
                  ),
                ],
              ),

            ),

            Flexible(
              child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(left: 50, right: 60),
                  child: Text(
                    "hi hi hello how are you aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),

            ),

            Container(
              alignment: Alignment.topLeft,
              color: Colors.black,
              child: Row(
                children: [
                  SizedBox(width: 50,),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.heart),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.heart),
                    onPressed: null,
                  ),
                  TextButton(
                    child: Text("Replies(2)"),
                    onPressed: null,
                  ),
                  TextButton(
                    child: Text("Hide Replies"),
                    onPressed: () {
                      replyVisible = !replyVisible;
                      print("hide button pressed $replyVisible");
                    },
                  ),
                ],
              ),
            ),

            Visibility(
              visible: replyVisible,
              maintainState: true,
              maintainInteractivity: true,
              maintainSize: true,
              maintainSemantics: true,
              maintainAnimation: true,
              child: Reply_list(context),
            ),
          ]
      );
    }
}

Widget Reply_list(BuildContext context){
  return Container(
    //alignment: Alignment.topLeft,
    child:  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:[
        Container(
          height: 70,
          color: Colors.black,
          padding: const EdgeInsets.fromLTRB(60.0, 16.0, 8.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            //  SizedBox(width: 0,),
              Row(
                  children:[
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage("https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR_BSXPlBjoBeJruSaCamv7kQuMNjoIIWX0CITXUVoapFCbRM9g")//NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Fname%2Fnm1860184%2F&psig=AOvVaw0aZzXLy9tjmw5amgnrjJMJ&ust=1651560778210000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjYq76dwPcCFQAAAAAdAAAAABAD"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Lionel Messi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text(
                              "Former Student",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              ),
                            ),
                            Text(
                              " ."" 1 hour ago",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ]
              ),
              IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed:(){
                    _popupDialog = _createPopupDialog();
                    Overlay.of(context)!.insert(_popupDialog);
                  },
              ),
            ],
          ),

        ),

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

        Container(
          alignment: Alignment.topLeft,
          color: Colors.black,
          child:Row(
            children: [
              SizedBox(width: 100,),
              IconButton(
                icon:Icon(FontAwesomeIcons.heart),
                onPressed: null,
              ),
              IconButton(
                icon:Icon(FontAwesomeIcons.heart),
                onPressed: null,
              ),
            ],
          ),
        ),

      ]
  ),
  );

}

late OverlayEntry _popupDialog;

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