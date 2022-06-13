import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tuple/tuple.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:my_app/item.dart';

//import '../universal_ui/universal_ui.dart';
//import 'read_only_page.dart';

@override
/*void initState() {
 // controller.addListener(listen);
  super.initState();
}
@override
void dispose() {
  //controller.removeListener(listen);
  super.dispose();
}*/

 QuillController? _controllertext= QuillController.basic();
final FocusNode _focusNodetext = FocusNode();

class TextPage_ui extends StatefulWidget {
  @override
  TextPage_uiState createState() => TextPage_uiState();
}

class TextPage_uiState extends State<TextPage_ui> {
 // QuillController? _controllertext;
 // final FocusNode _focusNodetext = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadFromAssets();
  }

  Future<void> _loadFromAssets() async {
    try {
      final result = await rootBundle.loadString('');
      final doc = Document.fromJson(jsonDecode(result));
      setState(() {
        _controllertext = QuillController(
            document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    } catch (error) {
      final doc = Document()
        ..insert(0, 'Say something here...!');
      setState(() {
        _controllertext = QuillController(
            document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    }
  }

  void addWidget(){
     setState(() {
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

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Type answer"),
        toolbarHeight:40,
        backgroundColor: Colors.grey[900],
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
            ),
            child: Text("post"),
            onPressed: (){
              addWidget();
            },
          ),
          SizedBox(width: 10,)
        ],

      ),
      body: text_home(),
    );
  }

}

class text_home extends StatefulWidget{
  @override
  text_homestate createState() => text_homestate();
}

class text_homestate extends State<text_home>{
  Widget build(BuildContext context){
    return
       Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
         // Expanded(
           //   child:
          SizedBox(height: 10,),

         Expanded(
           flex: 15,
           //fit: FlexFit.tight,
           child:
         //SafeArea(child:
         ListView(children:[
         Container(
           color: Colors.black,
                child:    Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    new  Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage("https://everythingbarca.com/wp-content/uploads/getty-images/2017/07/1231862540.jpeg"),
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
                            "Harry Kane",
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
                              ])
                        ]
                    ),
                  ],
                ),
              ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
         // Flexible(
          //  fit: FlexFit.loose,
            //child:
           // Container(
             // color: Colors.black,
             // padding: EdgeInsets.symmetric(horizontal: 20),
         //     child:
               Text(
                "What is the difference between Que and Stack ?What is the purpose of Gradle?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.00,
                ),
              ),),
           // ),
          //),//),
          SizedBox(height: 10,),
          //),
        Container(
    padding: const EdgeInsets.only(left: 16, right: 16),
       // child:
        //  Expanded(
         //   flex: 15,
            //child:
              //Container(
               // height: 200,
              //color: Colors.black,
              //padding: const EdgeInsets.only(left: 16, right: 16),
              child: quilleditor(),
            ),//),
          ]),),//),
          Container(
              color: Colors.grey[900],
              child: Row(

                children: [
                  SizedBox(width: 10,),

                  Container(
                      child:
                  Expanded(child:
                 // ListView.builder(
                   //   scrollDirection: Axis.horizontal,
                     // itemBuilder:(context,index) {
                         SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                          child:  Container(
                              height: 50,
                              child:toolbar()
                          ),
                        ),
                      ))
                ],
              ),
          ),
        ],
      );
  }

}

  Widget quilleditor() {
    return QuillEditor(
        controller: _controllertext!,
        focusNode: _focusNodetext,
        scrollController: ScrollController(),
        scrollable: true,
        padding: EdgeInsets.zero,
        autoFocus: false,
        readOnly: false,
        expands: false
    );
  }

    Widget toolbar(){
      return QuillToolbar.basic(
        controller: _controllertext!,
        // provide a callback to enable picking images from device.
        // if omit, "image" button only allows adding images from url.
        // same goes for videos.
        onImagePickCallback: _onImagePickCallback,
        onVideoPickCallback: _onVideoPickCallback,
        // uncomment to provide a custom "pick from" dialog.
        // mediaPickSettingSelector: _selectMediaPickSetting,
        showAlignmentButtons: true,
        toolbarSectionSpacing: 1,
        showFontSize: false,
        showStrikeThrough: false,
        showInlineCode: false,
        showColorButton: false,
        showBackgroundColorButton: false,
        showQuote: false,
        showIndent: true,
        showCodeBlock: false,
      );
    }

    Future<String> _onImagePickCallback(File file) async {
      // Copies the picked file from temporary cache to applications directory
      final appDocDir = await getApplicationDocumentsDirectory();
      final copiedFile =
      await file.copy('${appDocDir.path}/${basename(file.path)}');
      return copiedFile.path.toString();
    }

    Future<String> _onVideoPickCallback(File file) async {
      // Copies the picked file from temporary cache to applications directory
      final appDocDir = await getApplicationDocumentsDirectory();
      final copiedFile =
      await file.copy('${appDocDir.path}/${basename(file.path)}');
      return copiedFile.path.toString();
    }

