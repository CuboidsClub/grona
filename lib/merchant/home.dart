import 'package:flutter/material.dart';
import 'package:grona/common/services/Authentication.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Color whatsAppGreen = Colors.blue;
  Color whatsAppGreenLight = Colors.blueAccent;

  TabController tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 3)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
            case 2:
              fabIcon = Icons.camera_enhance;
              break;
            case 3:
              fabIcon = Icons.camera_enhance;
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text("Grona"),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                tabs: <Tab>[
                  Tab(text: "On Going"),
                  Tab(text: "Completed"),
                  Tab(
                    text: "Rejected",
                  )
                ],
                controller: tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[Text("data"), Text("data2"), Text("data3")],
          controller: tabController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Signout'),
        onPressed: (){
          Authentication().signOut();
        },
      ),
    );
  }
}
