import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/profile_page/gallary_screen.dart';
import 'package:my_app/profile_page/igtv_screen.dart';
import 'package:my_app/profile_page/reels_screen.dart';
import 'package:my_app/profile_page/profile_header.dart';
import 'package:my_app/bottombar.dart';


class MyAppprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Instagram Profile Page Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileBaseScreen(),
    );
  }
}
bool isVisible=true;
class ProfileBaseScreen extends StatefulWidget {
  @override
  _ProfileBaseScreenState createState() => _ProfileBaseScreenState();
}

class _ProfileBaseScreenState extends State<ProfileBaseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AnimatedContainer(
        color: Colors.red,
        duration: const Duration(milliseconds: 300),
          child: new HomePage(),
    height: isVisible ? 50.0 : 0.0,
    alignment: Alignment.center,),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,//[200],
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.redAccent[400], //Colors.white,
            toolbarHeight: 100.0,
          //  titleSpacing: 40.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(360)),
            title: Text(
              "MitStacK",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                ),
                onPressed: (){
                  showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.grey,
                      builder: (context){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: new Icon(Icons.photo),
                              title: new Text('Photo'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.music_note),
                              title: new Text('Music'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.videocam),
                              title: new Text('Video'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.share),
                              title: new Text('Share'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
              ElevatedButton(
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: (){
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.amber,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  /*showModalBottomSheet(
                     // elevation: 50,
                      context: context,
                      builder: (BuildContext context) {return Container(
                        height: 500,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: new Icon(Icons.photo),
                              title: new Text('Photo'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.music_note),
                              title: new Text('Music'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.videocam),
                              title: new Text('Video'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.share),
                              title: new Text('Share'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )
                      );})*/;
                },
              )
            ],
          ),
        ),
      ),
      body: DefaultTabController(
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
              Container(
                color: Colors.black,
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.grid_on_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.question_mark_rounded,//color: Colors.white,
                      ),//Image.asset(
                        //'assets/icons/igtv.png',
                       // height: 30,
                       // width: 30,
                    //  ),
                    ),
                    Tab(
                      icon: Icon(Icons.question_answer_outlined,), //Image.asset(
                       // 'assets/icons/reels.png',
                       // height: 25,
                       // width: 25,
                     // ),
                    ) ,
                    Tab(
                      icon: Icon(Icons.grid_3x3_rounded,//color: Colors.white,
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
    );
  }
}