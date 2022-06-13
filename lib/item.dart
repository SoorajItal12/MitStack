import 'package:flutter/material.dart';
import 'package:my_app/comment/comment_page.dart';
import 'package:my_app/text_editor/text_editor.dart';

 class Mylist extends StatefulWidget{
   final NetworkImage user_image;
   final String post_image;
   final String user_name;
   const Mylist({
     Key? key,
     required this.user_image,
     required this.post_image,
     required this.user_name,
 }):super(key:key);
   @override
   MylistState createState() => MylistState();

 }

 class MylistState extends State<Mylist>{
   bool isPressed = false;
   @override
   Widget build(BuildContext context){
     return new Column(
         mainAxisAlignment: MainAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[ Container(
           color:Colors.black,
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
                           fit: BoxFit.cover,//fill,
                           image: widget.user_image//new NetworkImage("https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")
                       ),
                     ),
                   ),
                   new SizedBox(
                     width: 10.0,
                   ),
                   new Text(
                     widget.user_name,
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
             child:new Image.network(widget.post_image,//"https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
               fit: BoxFit.cover,
             ),
           ),
           Container(
             color: Colors.black,
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

           Container(
             color: Colors.black,
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
             child: TextButton(
               child:Text(
               "5 Answers",
               textDirection: TextDirection.ltr,
               style: TextStyle(fontWeight: FontWeight.bold),
             ),
               onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => mycomment())
                 );
               },
           ),
           ),
           Container(
             color: Colors.black,
             padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 new Container(
                     height: 20.0,
                     width: 20.0,
                     decoration: new BoxDecoration(
                       shape: BoxShape.circle,
                       image: new DecorationImage(
                           fit: BoxFit.cover,
                           image:widget.user_image, //new NetworkImage("")
                       ),
                     )
                 ),
                 new SizedBox(
                   width: 2.0,
                 ),
                 Expanded(
                   child: new TextField(
                     decoration: new InputDecoration(
                         border: InputBorder.none,
                         hintText: "Add a comment",
                         hintTextDirection: TextDirection.ltr,

                     ),
                   ),
                 )
               ],
             ),
           ),
           Container(
             color: Colors.black,
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
             child: Text("1 day ago ",style: TextStyle(color: Colors.grey)),
           ),
           SizedBox(width: 50,)
         ]
     );

   }
 }


 List <Widget> items = [
   new Mylist(
     user_image: new NetworkImage("https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg"),
     post_image: "https://www.yourtango.com/sites/default/files/styles/header_slider/public/image_blog/instagram-captions-engagement.jpg?itok=Ugi2X-UZ",//"https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"
     user_name: "sooraj",
   ),new Mylist(
     user_image: new NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7e/Virat_Kohli.jpg"),
     post_image: "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
     user_name: "Kohli",
   ),
   new Mylist(user_image: new NetworkImage("https://m.media-amazon.com/images/M/MV5BZDk1ZmU0NGYtMzQ2Yi00N2NjLTkyNWEtZWE2NTU4NTJiZGUzXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY1200_CR107,0,630,1200_AL_.jpg"),
       post_image: "https://images.squarespace-cdn.com/content/v1/585174d6893fc0a6ea9567ab/1537365663766-SKXOENZGGYKI95CG916G/ke17ZwdGBToddI8pDm48kKKPzNC1pd5EwhDtJFdEcXoUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8PaoYXhp6HxIwZIk7-Mi3Tsic-L2IOPH3Dwrhl-Ne3Z2mxGOWoiEtYlj1y8uCs380-4Wg86iwZgYfMpFyqLFaCUKMshLAGzx4R3EDFOm1kBS/How+To+Take+Beautiful+Instagram+Photos+%2F%2F+Ebook+by+Olivia+Bossert+%2F%2F+www.oliviabossert.com+%2F%2F+social+media+tips%2C+Instagram+tips%2C+Instagram+photography+tips%2C+Instagram+followers%2C+grow+your+Instagram%2C+Instagram+theme%2C+Instagram+grid%2C+social+media+photography%2C+photography+tips%2C+smartphone+photography+tips%2C+marketing+tips%2C+small+business+tips%2C+cheap+ebook+on+Instagram%2C+ebook+about+Instagram%2C+ebook+about+Instagram+photography%2C+ebook+about+photography%2C+ebook+about+smartphone+photography%2C+ebook+about+branding+photography%2C+olivia+bossert+photography%2C+instagram+advice%2C+photography+advice%2C+marketing+advice?format=original",
       user_name: "Sharuh Khan",
   ),
  new Mylist(user_image: new NetworkImage("https://cdn.dnaindia.com/sites/default/files/styles/full/public/2020/10/24/933430-alia-bhatt-50-million.jpeg"),
      post_image: "https://i.pinimg.com/736x/55/33/f0/5533f0a2a91f32f1eaf03c55ca807f69.jpg",
      user_name: "Aliha Bhut",
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


 ];