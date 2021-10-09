import 'package:arogyatracker/Aboutus.dart';
import 'package:arogyatracker/BMIScreen.dart';
import 'package:arogyatracker/Contactus.dart';
import 'package:arogyatracker/Search.dart';
import 'package:arogyatracker/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:arogyatracker/authentications.dart';
import 'package:arogyatracker/main.dart';
import 'package:provider/provider.dart';
import 'Adminlogin.dart';
import 'Contactus.dart';
import 'package:arogyatracker/Aboutus.dart';
import 'Database.dart';
import 'Extra/PhotoUpload.dart';
import 'SlotBooking.dart';
import 'form.dart';
import 'maps.dart';


class TasksPage extends StatefulWidget {
  final String uid;

  TasksPage({Key key, @required this.uid}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState(uid);
}

class _TasksPageState extends State<TasksPage> {


  final String uid;
  _TasksPageState(this.uid);

  var taskcollections = Firestore.instance.collection('tasks');
  String task;
  String phone;
  String address2;


    Stream<DocumentSnapshot> getData()async*{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    yield* Firestore.instance.collection('brews').document(user.uid).snapshots();
  }

  void showdialog(bool isUpdate, DocumentSnapshot userDocument) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    showDialog(
        context: context,
        builder: (context) {
      return Scaffold(
        //title: isUpdate ? Text("Update Data") : Text("Migrant's Data"),
          body:SingleChildScrollView(
          child: Form(
          key: formkey,
          autovalidate: true,
          child: Column(
              children: <Widget>[
              SizedBox(height: 30.0),
           Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Edit Phone number",
              ),
              validator: (_val) {
                if (_val.isEmpty) {
                  return "Can't Be Empty";
                } else {
                  return null;
                }
              },
              onChanged: (_val) {
                phone= _val;
              },
            ),
          ),

                RaisedButton(
                  color: Colors.blue,
                  onPressed: () async{
                    if (formkey.currentState.validate()) {
                      formkey.currentState.save();
                      if (isUpdate) {
                        FirebaseUser user = await FirebaseAuth.instance.currentUser();
                        Firestore.instance.collection('brews').document(user.uid).updateData({
                          'phonenum': phone,


                        });
                      }

                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Edit Phone no.",
                    style: TextStyle(
                      fontFamily: "tepeno",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
          ),
          ),
          ),



      );
        });
  }

  void showdialog1(bool isUpdate, DocumentSnapshot userDocument) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            //title: isUpdate ? Text("Update Data") : Text("Migrant's Data"),
            body:SingleChildScrollView(
              child: Form(
                key: formkey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30.0),

                 Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                  child: TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Edit Current Address",
                    ),
                    validator: (_val) {
                      if (_val.isEmpty) {
                        return "Can't Be Empty";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (_val) {
                      address2= _val;
                    },
                  ),
                ),
                SizedBox(height: 20),
                    RaisedButton(
                      color: Colors.blue,
                      onPressed: () async{
                        if (formkey.currentState.validate()) {
                          formkey.currentState.save();
                          if (isUpdate) {
                            FirebaseUser user = await FirebaseAuth.instance.currentUser();
                            Firestore.instance.collection('brews').document(user.uid).updateData({
                              'curraddress':address2,

                            });
                          }

                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Edit Location",
                        style: TextStyle(
                          fontFamily: "tepeno",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),



          );
        });
  }

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          elevation: 10.0,
          backgroundColor: Colors.white,
          bottom: TabBar(

            indicatorColor: Colors.black54,
            tabs: [
              Text('Data',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
              Text('Kids',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
              Text('Hospital',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),

            ],
          ),
          actions: <Widget>[
           IconButton(
             icon: Icon(Icons.exit_to_app,color: Colors.black),
             onPressed: () => signOutUser().then((value) {
               Navigator.of(context).pushAndRemoveUntil(
                   MaterialPageRoute(builder: (context) => HomePage()),
                       (Route<dynamic> route) => false);
             }),
           )
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer:Drawer(child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new Container(
              height: 280.0,

                child: new DrawerHeader(

                   child: Padding(
                     padding: const EdgeInsets.all(32.0),
                     child: FlatButton(
                        onPressed: () {

                        },
                        child: new Icon(
                          Icons.account_box,
                          color: Colors.white,
                          size: 150.0,
                        ),
                        shape: new CircleBorder(),
                        color: Colors.pink[300],
                      ),
                   )
                ),
                color:Colors.pink[300]),
            SizedBox(height: 4.0),
               ListTile(
                leading: Icon(Icons.home,color: Colors.black,size: 25.0,),
                title: Text('Home',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),

                ),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => TasksPage(),
                     ),
                   );
                 },
              ),
            SizedBox(height: 6.0),

            ListTile(
              leading: Icon(Icons.location_on,color: Colors.black,size: 25.0,),
              title: Text('My location',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Maps(),
                  ),
                );
              },
            ),
            SizedBox(height: 6.0),
               ListTile(
                leading: Icon(Icons.contact_mail,color: Colors.black,size: 25.0,),
                title: Text('Contact us',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => Contactus(),
                     ),
                   );
                 },
              ),

            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(Icons.shutter_speed,color: Colors.black,size: 25.0,),
              title: Text('Calculate BMI',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMICalculatorScreen(),
                  ),
                );
              },
            ),

            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(Icons.cancel,color: Colors.black,size: 25.0,),
              title: Text('Cancellation',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
            ),
            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(Icons.question_answer,color: Colors.black,size: 25.0,),
              title: Text('FAQ',
                style: TextStyle(
                  fontSize: 18.0,
                ),),

            ),
            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(Icons.info,color: Colors.black,size: 25.0,),
              title: Text('About',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Aboutus(),
                  ),
                );
              },
            ),
            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(Icons.person_add,color: Colors.black,size: 25.0,),
              title: Text('Admin Login',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>LoginPage(),
                  ),
                );
              },
            ),

          ],
        ),
        ),
        body: TabBarView(
          children: [


            StreamBuilder<DocumentSnapshot>(
              stream:getData(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                   if (!snapshot.hasData) {
                        return  CircularProgressIndicator();
                   }
                else if (snapshot.hasData) {
                     var userDocument = snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                        children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Container(
                                 width: 600,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                                child: ListTile(
                                  title: Column(
                                    children: <Widget>[
                                      Card(
                                        elevation: 8.0,
                                        child: Container(
                                          width: 500,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),

                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.person,color: Colors.pinkAccent,),
                                              SizedBox(width: 5.0,),
                                             Text(

                                              'First Name - ',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,

                                              ),
                                            ),
                                             SizedBox(width: 5.0,),
                                             Text(
                                              userDocument['firstname'],
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.pink,

                                              ),

                                            ),
                                          ],
                                          ),

                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Card(
                                        elevation: 8.0,
                                        child: Container(
                                          width: 500,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.person_outline,color: Colors.pinkAccent),
                                              SizedBox(width: 5.0,),
                                             Text(

                                              'Surname - ',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,

                                              ),
                                            ),

                                              SizedBox(width: 5.0,),
                                            Text(
                userDocument['lastname'],
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.pink,

                                              ),

                                            ),
                                          ],
                                          ),

                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      InkWell(
                                      onTap: () {
                                    // == Update
                                    showdialog(true, userDocument);
                                  },
                                        child: Card(
                                          elevation: 8.0,
                                          child: Container(
                                            width: 500,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.phone,color: Colors.pinkAccent),
                                                SizedBox(width: 5.0,),
                                               Text(

                                                'Phone Number - ',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,

                                                ),
                                              ),

                                             SizedBox(width: 5.0,),
                                             Text(
                                               userDocument['phonenum'],
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.pink,

                                                ),

                                              ),
                                                SizedBox(width: 8.0,),
                                                Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Icon(Icons.edit,color: Colors.blue,size: 20,)),
                                            ],
                                            ),

                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Card(
                                        elevation: 8.0,
                                        child: Container(
                                          width: 500,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.library_books,color: Colors.pinkAccent),
                                             SizedBox(width: 5.0,),
                                            Text(

                                              'Aadhar Number - ',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,

                                              ),
                                            ),

                                              SizedBox(width: 5.0,),
                                             Text(
                                              userDocument['aadharno'],
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.pink,

                                              ),

                                            ),
                                          ],
                                          ),

                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      InkWell(
                                        onTap: () {
                                    // == Update
                                    showdialog1(true, userDocument);
                                    },
                                        child: Card(

                                          elevation: 8.0,
                                          child: Container(
                                            width: 600,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Align(child: Icon(Icons.location_on,color: Colors.pinkAccent),
                                                    alignment: Alignment.topLeft,
                                                  ),
                                                  SizedBox(width: 5.0,),
                                                  Align(
                                                    child: Text(

                                                    'Current Address - ',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,

                                                    ),
                                                ),
                                                    alignment: Alignment.topCenter,
                                                  ),

                                               SizedBox(width: 5.0,),
                                                 Align(

                                                   child: Text(
                                                   userDocument['curraddress'],
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.pink,

                                                    ),

                                                ),
                                                   alignment: Alignment.topRight,
                                                 ),
                                                  SizedBox(width: 50.0,),
                                                  Align(
                                                    alignment: Alignment.bottomRight,
                                                      child: Icon(Icons.edit,color: Colors.blue,size: 10,)

                                                  ),
                                              ],
                                              ),
                                            ),

                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.0),

                                      Card(
                                        elevation: 8.0,
                                        child: Container(
                                           width: 500,
                                           height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],

                                            borderRadius: BorderRadius.circular(5.0),

                                          ),

                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                                                child: Align(child: Icon(Icons.home,color: Colors.pinkAccent),
                                                  alignment: Alignment.topLeft,
                                                ),
                                              ),
                                              SizedBox(width: 5.0,),
                                            Align(

                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                                                child: Text(

                                                  'Permanent Address - ',
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,

                                                  ),
                                                ),
                                              ),
                                              alignment: Alignment.topLeft,
                                            ),
                                              SizedBox(width: 8,),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                                                child: Align(
                                                  child: Text(
                                                userDocument['peraddress'],
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.pink,

                                                  ),

                                            ),
                                                  alignment: Alignment.topCenter,
                                                ),
                                              ),
                                          ],
                                          ),

                                        ),
                                      ),

                                      SizedBox(height: 5),
//                                    Center(
//                                      child: Container(
//                                        height: 35.0,
//                                        width: 200.0,
//                                        child: FloatingActionButton(
//
//                                          backgroundColor: Colors.pink[300],
//
//                                          child: Text('Update',style: TextStyle(color: Colors.white),),
//                                          shape: RoundedRectangleBorder(
//
//                                              borderRadius: BorderRadius.all(Radius.circular(15.0))
//                                          ),
//                                        ),
//                                      ),
//                                    ),







                                    ],
                                  ),
//                                onLongPress: () {
//                                  // delete
//                                        getData()
//                                      .delete();
//                                },
//                                onTap: () {
//                                  // == Update
//                                  showdialog(true, ds);
//                                },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                else if (snapshot.error) {
                  return Text('No Data Available ');
                }

                else {
                  return Text('No Data Available ');
                }
              },
            ),

           // Icon(Icons.insert_chart),
            StreamBuilder<DocumentSnapshot>(
              stream:getData(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return  Text("Loading");
                }
                else if (snapshot.hasData) {
                  var userDocument1 = snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[

                        SizedBox(height: 25,),
                        Text('Immunization Status :-',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontFamily: 'Pacifico',
                          ),

                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Container(
                                width: 600,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                                child: ListTile(
                                  title: Column(
                                    children: <Widget>[
                                      Card(
                                        elevation: 8.0,
                                        child: Container(
                                          width: 500,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),

                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.person,color: Colors.pinkAccent,),
                                              SizedBox(width: 5.0,),
                                              Text(

                                                'Child 1 Name - ',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,

                                                ),
                                              ),
                                              SizedBox(width: 5.0,),
                                              Text(
                                                userDocument1['child1'],
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.pink,

                                                ),

                                              ),
                                            ],
                                          ),

                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Card(
                                        elevation: 8.0,
                                        child: Container(
                                          width: 500,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.person_outline,color: Colors.pinkAccent),
                                              SizedBox(width: 5.0,),
                                              Text(

                                                'Polio Status -  ',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,

                                                ),
                                              ),

                                              SizedBox(width: 5.0,),
                                              Text(
                                                userDocument1['polio1'],
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.pink,

                                                ),

                                              ),
                                            ],
                                          ),

                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      InkWell(
                                        onTap: () {
                                          // == Update
                                          //showdialog(true, userDocument1);
                                        },
                                        child: Card(
                                          elevation: 8.0,
                                          child: Container(
                                            width: 500,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.phone,color: Colors.pinkAccent),
                                                SizedBox(width: 5.0,),
                                                Text(

                                                  'DTap Status - ',
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,

                                                  ),
                                                ),

                                                SizedBox(width: 5.0,),
                                                Text(
                                                  userDocument1['Dtap1'],
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.pink,

                                                  ),

                                                ),
                                                SizedBox(width: 8.0,),
                                                Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Icon(Icons.edit,color: Colors.blue,size: 20,)),
                                              ],
                                            ),

                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 25.0),
                                      Divider(color: Colors.black,),
                                      SizedBox(height: 25.0),
                                      Card(
                                        elevation: 8.0,
                                        child: Container(
                                          width: 500,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.library_books,color: Colors.pinkAccent),
                                              SizedBox(width: 5.0,),
                                              Text(

                                                'Child 2 Name -',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,

                                                ),
                                              ),

                                              SizedBox(width: 5.0,),
                                              Text(
                                                userDocument1['child2'],
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.pink,

                                                ),

                                              ),
                                            ],
                                          ),

                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      InkWell(
                                        onTap: () {
                                          // == Update
                                          //showdialog1(true, userDocument);
                                        },
                                        child: Card(

                                          elevation: 8.0,
                                          child: Container(
                                            width: 500,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Align(child: Icon(Icons.location_on,color: Colors.pinkAccent),
                                                    alignment: Alignment.topLeft,
                                                  ),
                                                  SizedBox(width: 5.0,),
                                                  Align(
                                                    child: Text(

                                                      'Polio Status- ',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,

                                                      ),
                                                    ),
                                                    alignment: Alignment.topCenter,
                                                  ),

                                                  SizedBox(width: 5.0,),
                                                  Align(

                                                    child: Text(
                                                      userDocument1['polio2'],
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.pink,

                                                      ),

                                                    ),
                                                    alignment: Alignment.topRight,
                                                  ),
                                                  SizedBox(width: 50.0,),
                                                  Align(
                                                      alignment: Alignment.bottomRight,
                                                      child: Icon(Icons.edit,color: Colors.blue,size: 20,)

                                                  ),
                                                ],
                                              ),
                                            ),

                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.0),

                                      Card(
                                        elevation: 8.0,
                                        child: Container(
                                          width: 500,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],

                                            borderRadius: BorderRadius.circular(5.0),

                                          ),

                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                                                child: Align(child: Icon(Icons.home,color: Colors.pinkAccent),
                                                  alignment: Alignment.topLeft,
                                                ),
                                              ),
                                              SizedBox(width: 5.0,),
                                              Align(

                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                                                  child: Text(

                                                    'DTap Status ',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,

                                                    ),
                                                  ),
                                                ),
                                                alignment: Alignment.topLeft,
                                              ),
                                              SizedBox(width: 8,),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                                                child: Align(
                                                  child: Text(
                                                    userDocument1['Dtap2'],
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.pink,

                                                    ),

                                                  ),
                                                  alignment: Alignment.topCenter,
                                                ),
                                              ),
                                            ],
                                          ),

                                        ),
                                      ),

                                      SizedBox(height: 5),
//                                    Center(
//                                      child: Container(
//                                        height: 35.0,
//                                        width: 200.0,
//                                        child: FloatingActionButton(
//
//                                          backgroundColor: Colors.pink[300],
//
//                                          child: Text('Update',style: TextStyle(color: Colors.white),),
//                                          shape: RoundedRectangleBorder(
//
//                                              borderRadius: BorderRadius.all(Radius.circular(15.0))
//                                          ),
//                                        ),
//                                      ),
//                                    ),







                                    ],
                                  ),
//                                onLongPress: () {
//                                  // delete
//                                        getData()
//                                      .delete();
//                                },
//                                onTap: () {
//                                  // == Update
//                                  showdialog(true, ds);
//                                },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return CircularProgressIndicator();
                }
                else if(snapshot.hasData==null){
                  return Text('No Data Available ');
                }
                else {
                  return CircularProgressIndicator();
                }
              },
            ),

            ListView(
              children:<Widget>[
                SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: RaisedButton(
                   color: Colors.pink[200],
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search(),
                      ),
                    );
                  },
                   child: Text('Search hospitals',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 15.0,
                     fontWeight: FontWeight.bold,
                   ),
                   ),
              ),
               ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    color: Colors.blue[200],
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //builder: (context) => Search(),
                        ),
                      );
                    },
                    child: Text('Search Maternity homes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

    ],
            )

          ],
        ),
      ),
    );
  }}