import 'package:fluttertoast/fluttertoast.dart';

class AccountModels {
  String name = "Testing Raja";
  String mobile = "+91 9515792944";
  String email = "varunkumar@varunvorld.ml";
  String pin = "518501";

  logoutBtn() {
    Fluttertoast.showToast(msg: "Logout Called", gravity: ToastGravity.BOTTOM);
  }
}
