//import 'package:arogyatracker/tasks.dart';
//import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:intl/intl.dart';
//import 'package:image_picker/image_picker.dart';
//import 'dart:io';
//import 'package:firebase_storage/firebase_storage.dart';
//
//import 'PostHomePage.dart';
//
//
//class UploadPhotoPage extends StatefulWidget {
//  @override
//  _UploadPhotoPageState createState() => _UploadPhotoPageState();
//}
//
//class _UploadPhotoPageState extends State<UploadPhotoPage> {
//
//  File sampleImage;
//  String _myValue;
//  String _myValue1;
//  String _myValue2;
//  String url;
//
//  //for form
//  final formKey=new GlobalKey<FormState>();
//
////function to get image
//  Future getImage() async{
//    var  tempImage =await ImagePicker.pickImage(source: ImageSource.gallery);
//
//    setState(() {
//      sampleImage=tempImage;
//    });
//  }
//
//  //Button
//  bool validateAndSave(){
//    final form=formKey.currentState;
//
//    if(form.validate()){
//      form.save();
//      return true;
//    }
//    else{
//      return false;
//    }
//  }
//
//  void uploadStatusImage() async{
//    if(validateAndSave()){
//        final StorageReference postImageRef= FirebaseStorage.instance.ref().child("Post Images") ;
//        var timeKey=new DateTime.now();
//
//        final StorageUploadTask uploadTask=postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);
//
//        var Imageurl= await(await uploadTask.onComplete).ref.getDownloadURL();
//
//        url=Imageurl.toString();
//
//        print("Image Url ="+ url);
//
//        goToHomePage();
//        saveToDatabase(url);
//
//    }
//  }
////Realtime database
//  void saveToDatabase(url){
//
//    var dbTimeKey = new DateTime.now();
//    var formatDate=new DateFormat('MMM d, yyyy');
//    var formatTime=new DateFormat('EEEE, hh:mm aaa');
//
//    String date=formatDate.format(dbTimeKey);
//    String time=formatTime.format(dbTimeKey);
//
//    DatabaseReference ref =FirebaseDatabase.instance.reference();
//    var data=
//    {
//      "image":url,
//      "name":_myValue,
//      "facility":_myValue1,
//      "community":_myValue2,
//      "date":date,
//      "time":time,
//    };
//    ref.child("Posts").push().set(data);
//
//  }
//
//  void goToHomePage(){
//    Navigator.push(context,
//    MaterialPageRoute(builder: (context)
//    {
//      return new PostHomePage();
//    }
//    )
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//
//      appBar: new AppBar(
//        title: Center(child: new Text('Create Facility')),
//      ),
//      body: Padding(
//        padding: const EdgeInsets.all(15.0),
//        child: new Center(
//          child: sampleImage ==null ? Text('Please Submit Image of facility to register community'):enableUpload(),
//
//        ),
//      ),
//      floatingActionButton: new FloatingActionButton(
//          onPressed: getImage,
//        tooltip: 'Add Image',
//        child: new Icon(Icons.add_a_photo),
//      ),
//    );
//  }
//  Widget enableUpload(){
//   return SingleChildScrollView(
//     child: Container(
//       child: new Form(
//         key: formKey,
//
//         child: Column(
//           children: <Widget>[
//             Image.file(sampleImage,height: 200.0,width: 400.0),
//             SizedBox(height: 10.0),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
//               child: TextFormField(
//                 decoration: InputDecoration(labelText:'Name'),
//                 validator: (value){
//                   return value.isEmpty?'Name required':null;
//                 },
//                 onSaved: (value){
//                  return _myValue=value;
//                 },
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
//               child: TextFormField(
//                 decoration: InputDecoration(labelText:'Facility'),
//                 validator: (value){
//                   return value.isEmpty?'Facility required':null;
//                 },
//                 onSaved: (value){
//                   return _myValue1=value;
//                 },
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
//               child: TextFormField(
//                 decoration: InputDecoration(labelText:'Community'),
//                 validator: (value){
//                   return value.isEmpty?'Community required':null;
//                 },
//                 onSaved: (value){
//                   return _myValue2=value;
//                 },
//               ),
//             ),
//
//             SizedBox(height: 25.0),
//             RaisedButton(
//
//              child: Text('Create'),
//              disabledColor: Colors.blue,
//              onPressed: uploadStatusImage,
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
//  }
//}
