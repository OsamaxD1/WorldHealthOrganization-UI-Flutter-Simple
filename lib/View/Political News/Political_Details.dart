import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PoliticalDetail_News extends StatefulWidget {
  DocumentSnapshot snapshot;

  PoliticalDetail_News(this.snapshot);


  @override
  _PoliticalDetail_NewsState createState() => _PoliticalDetail_NewsState();
}

class _PoliticalDetail_NewsState extends State<PoliticalDetail_News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "International Newsasdas",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF222240),
      ),
      backgroundColor: Color(0xFF222240),
      body: ListView(
        children: <Widget>[
          //first container
          new Container(
            height: 250.0,
            margin: EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                widget.snapshot["image"],
                //      height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //    SizedBox(height: 1.0,),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(6.0),
            // decoration: BoxDecoration(
            //   color: Color(0xFF272b4a),
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(20.0),
            // topRight: Radius.circular(20.0))),
            child: Card(
              color: Color(0xFF272b4a),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          child: Text(widget.snapshot["title"][0]),
                        ),
                        SizedBox(width: 10.0,),
                        Container(
                          width: MediaQuery.of(context).size.width/1.3,
                          child: Text(widget.snapshot["title"],
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),),
                        )
                      ],
                    ),

                  ),
                  SizedBox(height: 7.0,),
                  Container(
                    margin: EdgeInsets.only(left: 7.0),
                    child: Text(widget.snapshot["view"]+" Views",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange
                      ),),
                  ),
                  SizedBox(height: 14.0,),
                  Container(
                    margin: EdgeInsets.only(left: 7.0),
                    child: Text("Description",style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Text(widget.snapshot["content"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                      ),),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
