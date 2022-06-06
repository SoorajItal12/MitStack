import 'package:flutter/material.dart';
import 'package:my_app/login.dart';
import 'package:my_app/main.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/profile_page/ProfileBaseScreen.dart';
import 'package:my_app/profile_page/gallary_screen.dart';
int selectBtn = 0;
int ind=0;
//bool isvisible=true;
class HomePage extends StatefulWidget
 {
 //  final Widget child;
 //  final ScrollController controller;
  // final Duration duration;
  const HomePage({
    Key? key,
   // required this.child ,
  //  required this.controller,
   // this.duration = const Duration(milliseconds:400 )
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  //int selectBtn = 0;
 // bool isVisible = true;

 /*   @override
    void initState() {
      super.initState();
      widget.controller.addListener(listen);
    }
  @override
  void dispose() {
      widget.controller.removeListener(listen);
      super.dispose();
  }

  void listen(){
      final direction = widget.controller.position.userScrollDirection;
      if(direction == ScrollDirection.forward) {
        show();
      }else if (direction == ScrollDirection.reverse){
        hide();
      }
  }

  void show(){
      if(!isVisible) setState(() {
        isVisible = true;
      });
  }
  void hide(){
      if(isVisible) setState(() {
        isVisible = false;
      });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparent,
      body:  Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: navigationBar(),
          )
        ],
      ),
    );
  }

    AnimatedContainer navigationBar() {
     return AnimatedContainer(
      height:  40.0,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(selectBtn == 0 ? 5.0 : 300.0),
          topRight: Radius.circular(selectBtn == navBtn.length - 1 ? 5.0 : 300.0),
          bottomLeft: Radius.circular(selectBtn == 0 ? 0.0 : 10.0 ),
          bottomRight: Radius.circular(selectBtn == navBtn.length -1 ? 0.0 : 10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < navBtn.length; i++)
            GestureDetector(
              onTap: () {// if(i==4)Navigator.pushReplacement(context,new MaterialPageRoute(builder: (context)=>new MyAppprofile()) );
              //if(i==0)Navigator.pushReplacement(context,new MaterialPageRoute(builder: (context)=>new MyApp()));
              setState(() => selectBtn = i);
              setState(() {//isvisible=true;//isVisible=isvisible;
                //selectBtn=i;
                ind=i;//if(i==4)controller=controller2;if(i==0)controller=controller1;
                print("selectBtn=$ind");
              });
          },
              child: iconBtn(i),
            ),
        ],
      ),
    );
  }


  SizedBox iconBtn(int i) {
    bool isActive = selectBtn == i ? true : false;
    var height = isActive ? 60.0 : 0.0;
    var width = isActive ? 50.0 : 0.0;
    return SizedBox(
      width: 75.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: const Duration(milliseconds: 600),
              child: isActive
                  ? CustomPaint(
                painter: ButtonNotch(),
              )
                  : const SizedBox(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              navBtn[i].imagePath,
              color: isActive ? Colors.red : Colors.grey,
              scale: 2.2,
            ),
          ),
          /*Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              navBtn[i].name,
              style: isActive ? bntText.copyWith(color: selectColor) : bntText,
            ),
          )*/
        ],
      ),
    );
    if(i==4)Navigator.pushReplacement(context,new MaterialPageRoute(builder: (context)=>new MyAppprofile()) );
    if(i==0)Navigator.pushReplacement(context,new MaterialPageRoute(builder: (context)=>new MyApp()));
  }
}


const TextStyle bntText = TextStyle(
  color: black,
  fontWeight: FontWeight.w500,
);


const Color black = Color(0xFF191555);
const Color white = Color(0xFFFFFFFF);
const Color bgColor =Colors.red; //Color(0xFFFFFFFF);//Colors.redAccent;//Color(0xFFFF0000);//(0xFF4448FF);
const Color selectColor = Colors.redAccent;/*Color(0xFFFFFFFF);//Color(0xFFFF0000);*///Color(0xFF4B3FFF);
const Color transparent = Color(0x00000000);


class ButtonNotch extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var dotPoint = Offset(size.width / 2, 2);

    var paint_1 = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;
    var paint_2 = Paint()
      ..color = white
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(7.5, 0, 12, 5);
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width - 12, 5);
    path.quadraticBezierTo(size.width - 7.5, 0, size.width, 0);
    path.close();
    canvas.drawPath(path, paint_1);
    canvas.drawCircle(dotPoint, 6, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Model {
  final int id;
  final String imagePath;
  final String name;

  Model({
    required this.id,
    required this.imagePath,
    required this.name,
  });
}

List<Model> navBtn = [
  Model(id: 0, imagePath: 'assets/icon/home.png', name: 'Home'),
  Model(id: 1, imagePath: 'assets/icon/search.png', name: 'Search'),
  Model(id: 2, imagePath: 'assets/icon/heart.png', name: 'Like'),
  Model(id: 3, imagePath: 'assets/icon/notification.png', name: 'notification'),
  Model(id: 4, imagePath: 'assets/icon/user.png', name: 'Profile'),
];

/*class ScrollToHideWidget extends StatefulWidget{
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  const ScrollToHideWidget({
    Key? key,
    required this.child ,
    required this.controller,
    this.duration = const Duration(milliseconds:400 )
  }) : super(key: key);

  @override
  _ScrollToHideWidgetState createstate() => _ScrollToHideWidgetState();

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();


}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget>{
  @override
  Widget build(BuildContext context) => AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? 70:0,
      child:
  );

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }
  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen(){
    final direction = widget.controller.position.userScrollDirection;
    if(direction == ScrollDirection.forward) {
      show();
    }else if (direction == ScrollDirection.reverse){
      hide;
    }
  }

  void show(){
    if(!isVisible) setState(() {
      isVisible = true;
    });
  }
  void hide (){
    if(isVisible) setState(() {
      isVisible = false;
    });
  }

}*/