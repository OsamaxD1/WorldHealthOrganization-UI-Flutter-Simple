import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:async';

class LatestPostDetails extends StatefulWidget {
  DocumentSnapshot snapshot;

  LatestPostDetails(this.snapshot);

  @override
  _LatestPostDetailsState createState() => _LatestPostDetailsState();
}

class _LatestPostDetailsState extends State<LatestPostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Post Detail"),
        backgroundColor: Color(0xFF008dc9),
      ),
      backgroundColor: Color(0xFF008dc9),
      body: new ListView(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(10.0),
            height: 250.0,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: new Image.network(
                widget.snapshot.data["image"],
                height: 250.0,
              ),
            ),
          ),

          //Text Container Description
          new SizedBox(
            height: 6.0,
          ),
          new Container(
            color: Color(0xFF008dc9),
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new CircleAvatar(
                        child: new Text(
                          widget.snapshot.data["title"][0],
                          style: TextStyle(fontSize: 21.0),
                        ),
                        backgroundColor: Color(0xFF222240),
                      ),
                      new SizedBox(
                        width: 5.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: new Text(
                          widget.snapshot.data["title"],
                          style: TextStyle(fontSize: 19.0, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                new SizedBox(
                  height: 10.0,
                ),
                new Text(
                  widget.snapshot.data["content"],
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
