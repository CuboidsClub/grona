import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:grona/consumer/models/AccountModels.dart';
import 'package:shape_of_view/shape_of_view.dart';
import '../components/AccountWidgets.dart';

class ConsumerAccount extends StatefulWidget {
  @override
  _ConsumerAccountState createState() => _ConsumerAccountState();
}

class _ConsumerAccountState extends State<ConsumerAccount> {
  AccountModels acctModel = AccountModels();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ShapeOfView(
              child: Container(
                padding: EdgeInsets.only(top: 60),
                color: Colors.blue,
                alignment: Alignment.center,
              ),
              elevation: 4,
              height: 200,
              shape: DiagonalShape(
                  position: DiagonalPosition.Bottom,
                  direction: DiagonalDirection.Left,
                  angle: DiagonalAngle.deg(angle: 20)),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 75, left: MediaQuery.of(context).size.width / 3),
              child: CircularProfileAvatar(
                "",
                radius: 60,
                child: Image.asset(
                  "assets/user.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 30, left: 25, right: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black26,
                ),
              ]),
          height: 400,
          child: Column(
            children: <Widget>[
              MyAccWidget(Icons.perm_identity, acctModel.name),
              Divider(),
              MyAccWidget(Icons.phone, acctModel.mobile),
              Divider(),
              MyAccWidget(Icons.alternate_email, acctModel.email),
              Divider(),
              MyAccWidget(Icons.location_city, "Nandyal"),
              Divider(),
              MyAccWidget(Icons.pin_drop, acctModel.pin)
            ],
          ),
        ),
        AccountRaisedBtn()
      ],
    );
  }
}
