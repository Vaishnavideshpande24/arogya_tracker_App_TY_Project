import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 55.0,8.0),
            child: Center(
              child: Text('About Arogya Tracker',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Text('\t\t\n\t\t      This Application is part of our project and is specially designed for migrant users. \t\n\t\t     One of the primary aim is to reduce the mortality rate of infant specially the migrant infants through data-mining by means of app storing and Regulating the information is equally important for further analysis.\t\n\n\t\t   It is the problem statement of Ministry of health and Family welfare , Goverment of India to design an innovative system for tracking health of migrant children.\t\t\n\t\t     The main focus is monitor the infant health and check the immunization are given to her/him.',
              style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Pacifico',
              ),
              ),
          ),
      ),

    );
  }
}
