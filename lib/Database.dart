import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future<void> updateUserData(String firstname, String lastname,String phonenum,String aadharno,String peraddress,String curraddress,String childnum,String child1,String polio1,String Dtap1,String child2,String polio2,String Dtap2) async {
    return await brewCollection.document(uid).setData({
      'firstname': firstname,
      'lastname': lastname,
      'phonenum':phonenum,
      'aadharno':aadharno,
      'peraddress':peraddress,
      'curraddress':curraddress,
      'childnum':childnum,
      'child1':child1,
      'polio1':polio1,
      'Dtap1':Dtap1,
      'child2':child2,
      'polio2':polio2,
      'Dtap2':Dtap2,


    });
  }

}
