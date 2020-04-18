import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBase{
  Firestore _record = Firestore.instance;

  Future createCustomerRecord({String name,String email}) async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    await _record.collection('customer').document(_user.phoneNumber).setData({
      'name': name,
      'email':email
    });
  }

}