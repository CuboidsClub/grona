import 'package:flutter/material.dart';
import 'package:grona/consumer/models/AccountModels.dart';

class MyAccWidget extends StatelessWidget {
  final icon, txt;
  const MyAccWidget(this.icon, this.txt);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 15, bottom: 6),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
          ),
          Text(
            "   " + txt,
            style: TextStyle(fontSize: 22, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class AccountRaisedBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: 60,
      margin: EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: MediaQuery.of(context).size.width / 4,
          right: MediaQuery.of(context).size.width / 4),
      child: RaisedButton(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        onPressed: AccountModels().logoutBtn(),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 28,
            ),
            Text(
              "   Logout",
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
