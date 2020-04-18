import 'package:flutter/material.dart';
import 'package:grona/consumer/views/account.dart';
import 'package:grona/consumer/views/orders.dart';
import 'package:grona/consumer/views/store.dart';

class ConsumerHome extends StatefulWidget {
  @override
  _ConsumerHomeState createState() => _ConsumerHomeState();
}

class _ConsumerHomeState extends State<ConsumerHome> {
  int _selectedPage = 0;
  final pages = [Stores(), Orders(), ConsumerAccount()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.store), title: Text("Stores")),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), title: Text("Orders")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text("Account")),
        ],
      ),
    );

    // return
    // Scaffold(
    //   body: pages[_selectedPage],
    //   bottomNavigationBar: BottomNavigationBar(
    //       backgroundColor: Colors.white,
    //       selectedItemColor: Color(0xFF0194BA),
    //       unselectedItemColor: Color(0xFF0e3e69),
    //       type: BottomNavigationBarType.fixed,
    //       currentIndex: _selectedPage,
    //       onTap: (index) => setState(() {
    //             _selectedPage = index;
    //           }),
    //       items: [
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.store), title: Text("Stores")),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.library_books), title: Text("Orders")),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.person_outline), title: Text("Account")),
    //       ]),
    // );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
