import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grona/consumer/models/CartModels.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  DocumentSnapshot data;
  CartPage(this.data);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartPageModel cartModel = CartPageModel();
  @override
  void initState() {
    print(widget.data.documentID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.phone, color: Colors.white),
              onPressed: cartModel.launchCaller(widget.data.documentID))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Text("data")),
          Container(
              height: 100,
              child: Row(
                children: <Widget>[
                  RaisedButton(onPressed: null),
                ],
              ))
        ],
      ),
    );
  }
}
