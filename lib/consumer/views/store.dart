import 'package:flutter/material.dart';
import 'package:grona/consumer/components/StoresWidgets.dart';
import 'package:grona/consumer/models/StoresModel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Stores extends StatefulWidget {
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  StoresModel storesModel = StoresModel("518501");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: storesModel.getData(),
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
                  onRefresh: storesModel.onRefresh(_refreshController),
                  onLoading: storesModel.onLoading(_refreshController),
                  child: StoresList(snapshot));
            }
        }
      },
    ));
  }
}
