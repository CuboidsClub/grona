import 'package:flutter/material.dart';
import 'package:grona/consumer/views/cartpage.dart';
import 'package:maps_launcher/maps_launcher.dart';

// ignore: must_be_immutable
class StoresList extends StatelessWidget {
  var snapshot;
  StoresList(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CartPage(snapshot.data.documents[index]))),
              contentPadding: EdgeInsets.all(8),
              leading: Text((index + 1).toString()),
              title: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(snapshot.data.documents[index].data["title"]),
              ),
              trailing: IconButton(
                tooltip: "Open Navigation",
                icon: Icon(
                  Icons.directions,
                  color: Colors.blue,
                  size: 30,
                ),
                onPressed: () => MapsLauncher.launchCoordinates(
                    double.parse(
                        snapshot.data.documents[index].data["loc"]["lat"]),
                    double.parse(
                        snapshot.data.documents[index].data["loc"]["lng"])),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text("Available : "),
                  snapshot.data.documents[index].data["groc"]
                      ? Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6)),
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
                              borderRadius: BorderRadius.circular(6)),
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
                              borderRadius: BorderRadius.circular(6)),
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
        });
  }
}
