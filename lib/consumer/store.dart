import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'cartpage.dart';

class Stores extends StatefulWidget {
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future getData() async {
    var _storeData = await Firestore.instance
        .collection("merchants")
        .where("pin", isEqualTo: _mypin)
        .getDocuments();
    return _storeData;
  }

  void _onRefresh() async {
    // monitor network fetch
    getData();
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {});
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  var _mypin = 518501;
  // int slno;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else {
              return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: WaterDropHeader(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage(snapshot.data.documents[index]))),
                            contentPadding: EdgeInsets.all(8),
                            leading: Text((index + 1).toString()),
                            title: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                  snapshot.data.documents[index].data["title"]),
                            ),
                            trailing: IconButton(
                              tooltip: "Open Navigation",
                              icon: Icon(
                                Icons.directions,
                                color: Colors.blue,
                                size: 30,
                              ),
                              onPressed: () => MapsLauncher.launchCoordinates(
                                  double.parse(snapshot.data.documents[index]
                                      .data["loc"]["lat"]),
                                  double.parse(snapshot.data.documents[index]
                                      .data["loc"]["lng"])),
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Text("Available : "),
                                snapshot.data.documents[index].data["groc"]
                                    ? Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Text(
                                          "Groceries",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ))
                                    : SizedBox(),
                                snapshot.data.documents[index].data["eggs"]
                                    ? Container(
                                        margin: EdgeInsets.only(left: 8),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Text(
                                          "Eggs",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ))
                                    : SizedBox(),
                                snapshot.data.documents[index].data["med"]
                                    ? Container(
                                        margin: EdgeInsets.only(left: 8),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Text(
                                          "Medicines",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ))
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        );
                      }));
            }
        }
      },
    ));
  }
}
