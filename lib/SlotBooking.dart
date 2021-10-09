//import 'package:flutter/material.dart';
//
//class Bookslot extends StatefulWidget {
//  @override
//  _BookslotState createState() => _BookslotState();
//}
//
//class _BookslotState extends State<Bookslot> {
//  TextEditingController dateCtl = TextEditingController();
//  TextEditingController dateCtl2 = TextEditingController();
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        children: <Widget>[
//          SizedBox(height: 10.0,),
//          Padding(
//            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
//            child: TextFormField(
//              controller: dateCtl,
//              decoration: InputDecoration(
//                labelText: "From",
//                labelStyle: TextStyle(
//                  fontSize: 15.0,
//                ),
//              ),
//              onTap: () async{
//                DateTime date = DateTime(1900);
//                FocusScope.of(context).requestFocus(new FocusNode());
//
//                date = await showDatePicker(
//                    context: context,
//                    initialDate:DateTime.now(),
//                    firstDate:DateTime(1900),
//                    lastDate: DateTime(2100));
//
//                dateCtl.text = date.toIso8601String();},),
//          ),
//
//          SizedBox(height: 15),
//
//        ],
//      ),
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';



class Bookslot extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Bookslot> {

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2100)
    );

    if (picked != null && picked != _date) {
      print('Date selected: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _time
    );

    if (picked != null && picked != _time) {
      print('Time selected: ${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Book your slot here !!! ',
        style: TextStyle(
          fontFamily: 'Pacifico',
          color: Colors.blue,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        ),

        elevation: 1.0,
        backgroundColor: Colors.white,
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            Align(
              child: new Text('Date selected :-  ${_date.toString()}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(height: 20.0),
            new RaisedButton(
                color: Colors.pink[200],
                child: new Text('Select Date'),
                onPressed: () {
                  _selectDate(context);
                }
            ),
            SizedBox(height: 30.0),
            Align(
              child: new Text('Time selected :-  ${_time.toString()}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.topLeft,
            ),

            SizedBox(height: 20,),
            new RaisedButton(
                color: Colors.pink[200],
                child: new Text('Select Time'),
                onPressed: () {
                  _selectTime(context);
                }
            ),
            SizedBox(height: 35,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('To know about the booking confirmation please click on the button below',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 38,),
            RaisedButton(onPressed: () {
              sendMail();
            }, child: Text('Book now'),

              color: Colors.green,
            ),

          ],
        ),
      ),
    );
  }
}


sendMail() async {
  String username = 'deshpandevaishnavi2000@gmail.com';
  String password = 'Vpd@4250';

  final smtpServer = gmail(username, password);
// Use the SmtpServer class to configure an SMTP server:
// final smtpServer = SmtpServer('smtp.domain.com');
// See the named arguments of SmtpServer for further configuration
// options.

// Create our message.
  final message = Message()
    ..from = Address(username, 'Vaishnavi Deshpande')
    ..recipients.add('vaishnavi.deshpande18@vit.edu')
  // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
  //..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'Booking Confirmed on ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Dear User</h1>\n<p> Your Booking is confirmed  at your sceduled date and time. Please be available on time. Thankyou !!</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
