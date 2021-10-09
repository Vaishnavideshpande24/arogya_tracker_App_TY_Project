import 'file:///C:/Users/vaishnavi/Desktop/arogyatracker/lib/Extra/PostHomePage.dart';
import 'package:arogyatracker/tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arogyatracker/authentications.dart';
import 'package:arogyatracker/signupScreen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'Adminlogin.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void login() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      signin(email, password, context).then((value) {
        if (value != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TasksPage(),
              ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
             Image.asset('assets/download.jpg'),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Login Here",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              Container(

                width: MediaQuery.of(context).size.width * 0.90,
                child: Form(
                  key: formkey,
                  child: Column(

                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(

                            border: OutlineInputBorder(), labelText: "Email"),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "This Field Is Required"),
                          EmailValidator(errorText: "Invalid Email Address"),
                        ]),
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password"),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Password Is Required"),
                            MinLengthValidator(6,
                                errorText: "Minimum 6 Characters Required"),
                          ]),
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                      ),
                      RaisedButton(
                        // passing an additional context parameter to show dialog boxs
                        onPressed: login,
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          "User Login",
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () => googleSignIn().whenComplete(() async {
                  FirebaseUser user = await FirebaseAuth.instance.currentUser();

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => TasksPage(uid:user.uid)));
                }),
                child: Image(
                  image: AssetImage('assets/googlepic.png'),
                  width: 300.0,
                  height: 50.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              InkWell(
                onTap: () {
                  // send to login screen
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  "Sign Up Here",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
