import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {


  Future queryData(String queryString) async {
    return Firestore.instance.collection('Hospitals')
        .where('City', isEqualTo: queryString).getDocuments();
  }
}