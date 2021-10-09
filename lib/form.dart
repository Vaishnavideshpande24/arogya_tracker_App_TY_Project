import 'package:arogyatracker/Adminlogin.dart';
import 'package:arogyatracker/tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Database.dart';
import 'authentications.dart';


 class TasksPages extends StatefulWidget {


  @override
  _TasksPagesState createState() => _TasksPagesState();
}

class _TasksPagesState extends State<TasksPages>  {

     String uid;


     Stream<DocumentSnapshot> getData()async*{
       FirebaseUser user = await FirebaseAuth.instance.currentUser();
       yield* Firestore.instance.collection('brews').document(user.uid).snapshots();
     }


//   void inputData() async {
//     final FirebaseUser user = await auth.currentUser();
//     final uid = user.uid;
//
//   }



  var taskcollections = Firestore.instance.collection('brews');
  String fname; // First Name
  String lname; // Last Name
  String phone; // Phone number
  String aadhar; // Aadhar number
  String address1; // Permanent Address
  String address2; //Current Address
  String numchild; //Children number
  String name1; //Children number
  String polioc1; //Children number
  String dtapc1; //Children number
  String name2; //Children number
  String polioc2; //Children number
  String dtapc2; //Children number





  void showdialog(bool isUpdate, DocumentSnapshot ds) {
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
                          labelText: "Migrant First Name",
                        ),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val) {
                          fname= _val;
                        },
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Migrant Surname",
                        ),
                        validator: (_val1) {
                          if (_val1.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val1) {
                          lname = _val1;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Phone number",
                        ),
                        validator: (_val2) {
                          if (_val2.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val2) {
                          phone = _val2;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Aadhar Unique number",
                        ),
                        validator: (_val3) {
                          if (_val3.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val3) {
                          aadhar = _val3;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Permanent Address",
                        ),
                        validator: (_val4) {
                          if (_val4.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val4) {
                          address1 = _val4;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Current Address",
                        ),
                        validator: (_val5) {
                          if (_val5.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val5) {
                          address2 = _val5;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Number of vaccine req children ",
                        ),
                        validator: (_val6) {
                          if (_val6.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val6) {
                          numchild = _val6;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name child-1",
                        ),
                        validator: (_val7) {
                          if (_val7.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val7) {
                          name1 = _val7;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Polio Vaccine Status -1",
                        ),
                        validator: (_val8) {
                          if (_val8.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val8) {
                          polioc1 = _val8;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "DTap status -1",
                        ),
                        validator: (_val9) {
                          if (_val9.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val9) {
                          dtapc1= _val9;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name Child-2",
                        ),
                        validator: (_val10) {
                          if (_val10.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val10) {
                          name2= _val10;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Polio status -2",
                        ),
                        validator: (_val11) {
                          if (_val11.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val11) {
                          polioc2 = _val11;
                        },

                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "DTap Status -2",
                        ),
                        validator: (_val12) {
                          if (_val12.isEmpty) {
                            return "Can't Be Empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_val12) {
                          dtapc2= _val12;
                        },

                      ),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      color: Colors.purple,
                      onPressed: () async{
                        if (formkey.currentState.validate()) {
                          formkey.currentState.save();
                          if (isUpdate) {
                            taskcollections
                                .document()
                                .collection('task')
                                .document(ds.documentID)
                                .updateData({
                              'task': fname,
                              'history':lname,
                              'time': DateTime.now(),
                            });
                          } else  {
                            //  insert
                            FirebaseUser user = await FirebaseAuth.instance.currentUser();
                            DatabaseService(uid: user.uid).updateUserData(fname,lname,phone,aadhar,address1,address2,numchild,name1,polioc1,dtapc1,name2,polioc2,dtapc2);
                          }

                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Add",
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showdialog(false, null),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: Icon(Icons.power_settings_new,color: Colors.black,),
          onPressed: (){

            Navigator.of(context).pushAndRemoveUntil(
              // the new route
              MaterialPageRoute(
                builder: (BuildContext context) => TasksPage(),
              ),

              // this function should return true when we're done removing routes
              // but because we want to remove all other screens, we make it
              // always return false
                  (Route route) => false,
            );
          },
        ),

        title: Text(
          'Migrant Data',
          style: TextStyle(
            fontFamily: "Pacifico",
            color: Colors.black,


          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            splashColor: Colors.transparent,
            highlightColor: Colors.black,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TasksPage(),
                ),
              );
            },
          ),
        ],

      ),
   body:  new StreamBuilder<DocumentSnapshot>(
    stream: getData(), //returns a Stream<DocumentSnapshot>
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (!snapshot.hasData) {
    return new Text("Loading");
    }
    var userDocument = snapshot.data;
    //return new Text(userDocument["firstname"]);
      return new Column(
        children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue[200],
            borderRadius: BorderRadius.circular(
                5.0),
          ),
                                        child: ListTile(
                                          leading: Text(

                                            'First Name - ',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,

                                            ),
                                          ),
                                          title: Text(
                                           userDocument["firstname"],
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.pink,

                                            ),

                                          ),
                                        ),

                                      ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(
                  5.0),
            ),
            child: ListTile(
              leading: Text(

                'Surname - ',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
              title: Text(
                userDocument["lastname"],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.pink,

                ),

              ),
            ),

          ),
          SizedBox(height: 10,),

          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(
                  5.0),
            ),
            child: ListTile(
              leading: Text(

                'Aadhar no.  ',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
              title: Text(
                userDocument["aadharno"],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.pink,

                ),

              ),
            ),

          ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(
                  5.0),
            ),
            child: ListTile(
              leading: Text(

                'Phone no. - ',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
              title: Text(
                userDocument["phonenum"],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.pink,

                ),

              ),
            ),

          ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(
                  5.0),
            ),
            child: ListTile(
              leading: Text(

                'Permanent Addr- ',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
              title: Text(
                userDocument["peraddress"],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.pink,

                ),

              ),
            ),

          ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(
                  5.0),
            ),
            child: ListTile(
              leading: Text(

                'Current Addr-  ',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
              title: Text(
                userDocument["curraddress"],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.pink,

                ),

              ),
            ),

          ),
        ],
      );
    }
    ),

//      body: FutureBuilder(
//        future: FirebaseAuth.instance.currentUser(),
//          builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
//            if (snapshot.hasData) {
//              return StreamBuilder(
//                stream: getData(),
//
//                builder: (context, snapshot) {
//                  if (snapshot.hasData) {
//                    return ListView.builder(
//                      itemCount: snapshot.data.documents.length,
//                      itemBuilder: (context, index) {
//                        DocumentSnapshot ds = snapshot.data
//                            .documents[index]; //First name
//
//
//                        return Padding(
//                          padding: const EdgeInsets.fromLTRB(
//                              0.0, 30.0, 0.0, 8.0),
//                          child: Center(
//                            child: SingleChildScrollView(
//                              child: Container(
//                                //  width: ,
//                                decoration: BoxDecoration(
//                                  color: Colors.white,
//                                  borderRadius: BorderRadius.circular(5.0),
//                                ),
//                                margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
//                                child: ListTile(
//                                  title: Column(
//                                    children: <Widget>[
//                                      Container(
//                                        decoration: BoxDecoration(
//                                          color: Colors.lightBlue[200],
//                                          borderRadius: BorderRadius.circular(
//                                              5.0),
//                                        ),
//
//                                        child: ListTile(
//                                          leading: Text(
//
//                                            'First Name - ',
//                                            style: TextStyle(
//                                              fontSize: 18.0,
//                                              color: Colors.black,
//                                              fontWeight: FontWeight.bold,
//
//                                            ),
//                                          ),
//                                          title: Text(
//                                            ds['firstname'],
//                                            style: TextStyle(
//                                              fontSize: 18.0,
//                                              color: Colors.pink,
//
//                                            ),
//
//                                          ),
//                                        ),
//
//                                      ),
//                                      SizedBox(height: 10.0),
//                                      Container(
//                                        decoration: BoxDecoration(
//                                          color: Colors.lightBlue[200],
//                                          borderRadius: BorderRadius.circular(
//                                              5.0),
//                                        ),
//                                        child: ListTile(
//                                          leading: Text(
//
//                                            'Surname - ',
//                                            style: TextStyle(
//                                              fontSize: 18.0,
//                                              color: Colors.black,
//                                              fontWeight: FontWeight.bold,
//
//                                            ),
//                                          ),
//                                          title: Text(
//                                            ds['lastname'],
//                                            style: TextStyle(
//                                              fontSize: 18.0,
//                                              color: Colors.pink,
//
//                                            ),
//
//                                          ),
//                                        ),
//
//                                      ),
//                                      SizedBox(height: 10.0),
//                                      Container(
//                                        decoration: BoxDecoration(
//                                          color: Colors.lightBlue[200],
//                                          borderRadius: BorderRadius.circular(
//                                              5.0),
//                                        ),
//                                        child: ListTile(
//                                          leading: Text(
//
//                                            'Phone Number - ',
//                                            style: TextStyle(
//                                              fontSize: 18.0,
//                                              color: Colors.black,
//                                              fontWeight: FontWeight.bold,
//
//                                            ),
//                                          ),
//                                          title: Text(
//                                            ds['phonenum'],
//                                            style: TextStyle(
//                                              fontSize: 18.0,
//                                              color: Colors.pink,
//
//                                            ),
//
//                                          ),
//                                        ),
//
//                                      ),
//                                      SizedBox(height: 10.0),
//                                      Container(
//                                        decoration: BoxDecoration(
//                                          color: Colors.lightBlue[200],
//                                          borderRadius: BorderRadius.circular(
//                                              5.0),
//                                        ),
//                                        child: ListTile(
//                                          leading: Text(
//
//                                            'Aadhar Number - ',
//                                            style: TextStyle(
//                                              fontSize: 18.0,
//                                              color: Colors.black,
//                                              fontWeight: FontWeight.bold,
//
//                                            ),
//                                          ),
//                                          title: Text(
//                                            ds['aadharno'],
//                                            style: TextStyle(
//                                              fontSize: 18.0,
//                                              color: Colors.pink,
//
//                                            ),
//
//                                          ),
//                                        ),
//
//                                      ),
//                                      SizedBox(height: 10.0),
//                                      Container(
//                                        decoration: BoxDecoration(
//                                          color: Colors.lightBlue[200],
//                                          borderRadius: BorderRadius.circular(
//                                              5.0),
//                                        ),
//                                        child: ListTile(
//                                          leading: Text(
//
//                                            'Current Address - ',
//                                            style: TextStyle(
//                                              fontSize: 18.0,
//                                              color: Colors.black,
//                                              fontWeight: FontWeight.bold,
//
//                                            ),
//                                          ),
//                                          title: Text(
//                                            ds['curraddress'],
//                                            style: TextStyle(
//                                              fontSize: 15.0,
//                                              color: Colors.pink,
//
//                                            ),
//
//                                          ),
//                                        ),
//
//                                      ),
//                                      SizedBox(height: 10.0),
//
//                                      Container(
//                                        decoration: BoxDecoration(
//                                          color: Colors.lightBlue[200],
//                                          borderRadius: BorderRadius.circular(
//                                              5.0),
//                                        ),
//
//                                        child: ListTile(
//                                          leading: Text(
//
//                                            'Permanent Address - ',
//                                            style: TextStyle(
//                                              fontSize: 18.0,
//                                              color: Colors.black,
//                                              fontWeight: FontWeight.bold,
//
//                                            ),
//                                          ),
//                                          title: Text(
//                                            ds['peraddress'],
//                                            style: TextStyle(
//                                              fontSize: 15.0,
//                                              color: Colors.pink,
//
//                                            ),
//
//                                          ),
//                                        ),
//
//                                      ),
//
//
//                                    ],
//                                  ),
//                                  onLongPress: () {
//                                    // delete
//                                    DatabaseService().brewCollection
//                                        .document(uid)
//                                        .delete();
//                                  },
//                                  onTap: () {
//                                    // == Update
//                                    showdialog(true, ds);
//                                  },
//                                ),
//                              ),
//                            ),
//                          ),
//                        );
//                      },
//                    );
//                  } else if (snapshot.hasError) {
//                    return CircularProgressIndicator();
//                  } else {
//                    return CircularProgressIndicator();
//                  }
//                },
//              );
//            }
//            else{
//              return Text('Loading user data...');
//            }
//          }
//      ),
    );
  }
}
