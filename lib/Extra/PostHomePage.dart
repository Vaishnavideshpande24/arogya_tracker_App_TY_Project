//import 'package:arogyatracker/loginScreen.dart';
//import 'package:flutter/material.dart';
//import 'Contactus.dart';
//import 'PhotoUpload.dart';
//import 'Posts.dart';
//import 'package:firebase_database/firebase_database.dart';
//
//import 'authentications.dart';
//import 'maps.dart';
//
//class PostHomePage extends StatefulWidget {
//  final String uid;
//  PostHomePage({Key key, @required this.uid}) : super(key: key);
//
//  @override
//  _PostHomePageState createState() => _PostHomePageState(uid);
//}
//
//class _PostHomePageState extends State<PostHomePage> {
//  final String uid;
//  _PostHomePageState(this.uid);
//
//  List<Posts> postsList = [];
//  TextEditingController dateCtl = TextEditingController();
//  TextEditingController dateCtl2 = TextEditingController();
//
//  @override
//  void initState() {
//    super.initState();
//    DatabaseReference postsRef = FirebaseDatabase.instance.reference().child(
//        "Posts");
//    postsRef.once().then((DataSnapshot snap) {
//      // data retrieve from keys generated
//      var KEYS = snap.value.keys;
//      var DATA = snap.value;
//
//      postsList.clear();
//
//      for (var individualKey in KEYS) {
//        Posts posts = new Posts
//          (
//          DATA[individualKey]['image'],
//          DATA[individualKey]['date'],
//          DATA[individualKey]['time'],
//          DATA[individualKey]['name'],
//          DATA[individualKey]['facility'],
//          DATA[individualKey]['community'],
//        );
//
//        postsList.add(posts);
//      }
//      setState(() {
//        print('Length : $postsList.length');
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        appBar: AppBar(
//          title:  Padding(
//            padding: const EdgeInsets.fromLTRB(30, 5.0, 20.0, 5.0),
//            child: new Text('Allihoop',style: TextStyle(
//              fontSize: 30.0,
//              fontWeight: FontWeight.bold,
//            ),),
//          ),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.power_settings_new,color: Colors.white,size: 28.0,),
//              onPressed: () => signOutUser().then((value) {
//                Navigator.of(context).pushAndRemoveUntil(
//                    MaterialPageRoute(builder: (context) => LoginScreen()),
//                        (Route<dynamic> route) => false);
//              }),
//            )
//          ],
//        ),
//        drawer: Drawer(child: ListView(
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//            new Container(
//                height: 280.0,
//
//                child: new DrawerHeader(
//
//                    child: Padding(
//                      padding: const EdgeInsets.all(32.0),
//                      child: FlatButton(
//                        onPressed: () {
//
//                        },
//                        child: new Icon(
//                          Icons.account_box,
//                          color: Colors.white,
//                          size: 150.0,
//                        ),
//                        shape: new CircleBorder(),
//                        color: Colors.pink[300],
//                      ),
//                    )
//                ),
//                color: Colors.pink[300]),
//            SizedBox(height: 4.0),
//            ListTile(
//              leading: Icon(Icons.home, color: Colors.black, size: 25.0,),
//              title: Text('Home',
//                style: TextStyle(
//                  fontSize: 18.0,
//                ),
//
//              ),
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => PostHomePage(),
//                  ),
//                );
//              },
//            ),
//            SizedBox(height: 6.0),
//
//            ListTile(
//              leading: Icon(Icons.location_on, color: Colors.black, size: 25.0,),
//              title: Text('My location',
//                style: TextStyle(
//                  fontSize: 18.0,
//                ),),
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => Maps(),
//                  ),
//                );
//              },
//            ),
//            ListTile(
//              leading: Icon(Icons.contact_mail, color: Colors.black, size: 25.0,),
//              title: Text('Contact us',
//                style: TextStyle(
//                  fontSize: 18.0,
//                ),),
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => Contactus(),
//                  ),
//                );
//              },
//            ),
//
//
//            SizedBox(height: 6.0),
//            ListTile(
//              leading: Icon(
//                Icons.add_circle, color: Colors.black, size: 25.0,),
//              title: Text('Create Facility',
//                style: TextStyle(
//                  fontSize: 18.0,
//                ),),
//
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => UploadPhotoPage(),
//                  ),
//                );
//              },
//            ),
//            SizedBox(height: 6.0),
//            ListTile(
//              leading: Icon(Icons.info, color: Colors.black, size: 25.0,),
//              title: Text('About Us',
//                style: TextStyle(
//                  fontSize: 18.0,
//                ),),
//
//            ),
//          ],
//        ),
//        ),
//        body: Column(
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
//              child: Align(
//                alignment: Alignment.topLeft,
//                child: Text('Facilities', style: TextStyle(
//                  fontSize: 25.0,
//                  fontWeight: FontWeight.bold,
//                )),
//              ),
//            ),
//            SizedBox(height: 15.0,),
//            Align(
//              alignment: Alignment.topCenter,
//              child: Padding(
//                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
//                child: Text(
//                    'Find out when facilities are available and book spaces in advance.',
//                    style: TextStyle(
//                      fontSize: 18.0,
//
//                    )),
//              ),
//            ),
//            SizedBox(height: 10.0,),
//            Padding(
//              padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
//              child: TextFormField(
//                controller: dateCtl,
//                decoration: InputDecoration(
//                  labelText: "From",
//                  labelStyle: TextStyle(
//                    fontSize: 15.0,
//                  ),
//                 ),
//                onTap: () async{
//                  DateTime date = DateTime(1900);
//                  FocusScope.of(context).requestFocus(new FocusNode());
//
//                  date = await showDatePicker(
//                      context: context,
//                      initialDate:DateTime.now(),
//                      firstDate:DateTime(1900),
//                      lastDate: DateTime(2100));
//
//                  dateCtl.text = date.toIso8601String();},),
//            ),
//
//            SizedBox(height: 15),
//
//            Padding(
//              padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
//              child: TextFormField(
//                controller: dateCtl2,
//                decoration: InputDecoration(
//                  labelText: "To",
//                  labelStyle: TextStyle(
//                    fontSize: 15.0,
//                  ),
//                ),
//                onTap: () async{
//                  DateTime date = DateTime(1900);
//                  FocusScope.of(context).requestFocus(new FocusNode());
//
//                  date = await showDatePicker(
//                      context: context,
//                      initialDate:DateTime.now(),
//                      firstDate:DateTime(1900),
//                      lastDate: DateTime(2100));
//
//                  dateCtl2.text = date.toIso8601String();},),
//            ),
//            SizedBox(height: 30),
//            Expanded(
//              child: Container(
//
//                child: postsList.length == 0
//                    ? new Text("No images available")
//                    : new ListView.builder
//                  (
//                    itemCount: postsList.length,
//                    itemBuilder: (_, index) {
//                      return GestureDetector(
//                        onTap: () {
//                          if (postsList.any((item) => item.isSelected)) {
//                            setState(() {
//                              postsList[index].isSelected =
//                              !postsList[index].isSelected;
//                            });
//                          }
//                        },
//                        onLongPress: () {
//                          setState(() {
//                            postsList[index].isSelected = true;
//                          });
//                        },
//
//                        child: Container(
//                            color: postsList[index].isSelected ?
//                            Colors.lightBlueAccent : Colors.white,
//                            child: PostsUI(
//                                postsList[index].image, postsList[index].date,
//                                postsList[index].time,postsList[index].name,postsList[index].facility,postsList[index].community)),
//
//
//                      );
//                    }
//                ),
//              ),
//            ),
//
//          ],
//        ),
//
//      ),
//    );
//  }
//
//  Widget PostsUI(String image, String date, String time,String name,String facility,String community) {
//    return new Card(
//      elevation: 10.0,
//      margin: EdgeInsets.all(10.0),
//
//      child: new Container
//        (
//        padding: EdgeInsets.all(10.0),
//
//        child: new Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//
//          children: <Widget>
//          [
//            new Row
//              (
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//              children: <Widget>[
//                new Text
//                  (
//                  facility,
//                  style: Theme
//                      .of(context)
//                      .textTheme
//                      .title,
//
//                  textScaleFactor: 1.5,
//                  textAlign: TextAlign.center,
//                ),
//                SizedBox(width: 10.0,),
//                new Text
//                  (
//                  date,
//                  style: Theme
//                      .of(context)
//                      .textTheme
//                      .subtitle,
//                  textAlign: TextAlign.center,
//                ),
//
//              ],
//            ),
//            SizedBox(height: 10.0,),
//            new Image.network(image, fit: BoxFit.cover),
//
//          ],
//        ),
//
//      ),
//    );
//  }
//}
