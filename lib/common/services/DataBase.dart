import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grona/common/services/BaseWidget.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/locator.dart';
import 'package:grona/merchant/home.dart';
import '../../constant.dart';

class DataBase extends BaseWidget{
  Firestore _record = Firestore.instance;
  Navigation _navigation = locator<Navigation>();

  Future createCustomerRecord({String name,String email}) async {
    setBusy(true);
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    await _record.collection('customer').document(_user.phoneNumber).setData({
      'name': name,
      'email':email
    });
    setBusy(false);
    _navigation.replaceAllNavigateTo(CustomerHomeRoute);
  }

  Future createMerchantRecord({String name,shopName,address,district,pinCode,bool grocery,bool pharmacy})async{
    setBusy(true);
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    await _record.collection('Testing-merchant').document(_user.phoneNumber).setData({
      'name':name,
      'shopname':shopName,
      'address':address,
      'dirtrict':district,
      'pincode':pinCode,
      'grocery':grocery,
      'pharmacy':pharmacy,

    });
    setBusy(false);
    _navigation.replaceAllNavigateTo(HomeViewRoute);
  }
}