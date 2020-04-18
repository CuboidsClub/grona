import 'package:cloud_firestore/cloud_firestore.dart';

class StoresModel {
  var myPin;
  StoresModel(this.myPin);
  Future getData() async {
    var _storeData = await Firestore.instance
        .collection("merchants")
        .where("pin", isEqualTo: myPin)
        .getDocuments();
    return _storeData;
  }

  onRefresh(ctrl) async {
    // monitor network fetch
    getData();
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    ctrl.refreshCompleted();
    await Future.delayed(Duration(milliseconds: 1000));
  }

  onLoading(ctrl) async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    ctrl.loadComplete();
  }
}
