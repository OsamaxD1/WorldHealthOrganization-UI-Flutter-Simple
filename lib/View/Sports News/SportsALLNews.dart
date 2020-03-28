import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutternewsapp/View/Sports News/Sports_Details.dart';

class SportsNews extends StatefulWidget {


  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  Future getallPost() async {
    var firestore = Firestore.instance;

    QuerySnapshot snap =
    await firestore.collection("InternationalAllNews").getDocuments();
    return snap.documents;
  }

  Future<Null> onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getallPost();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222240),
      body: FutureBuilder(
        future: getallPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                "Data Loading..",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: ValueKey(index),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.indigo,
                        icon: Icons.share,
                        //onTap: () => _showSnackBar('Share'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.grey,
                        icon: Icons.delete_sweep,
                      )
                    ],
                    // dismissal: SlidableDismissal(child: SlidableDrawerDismissal() ),
                    child: Container(
                      height: 170.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF272b4a)),
                      margin: EdgeInsets.all(6.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                snapshot.data[index].data["image"],
                                height: 170.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                //Heading and Description container
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[index].data["title"],
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        snapshot.data[index].data["content"],
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white
                                        ),),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 18.0,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      //First Container
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.deepOrange,
                                            ),
                                            SizedBox(width: 5.0,),
                                            Text(snapshot
                                                .data[index].data["view"] +
                                                " Views",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white
                                              ),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15.0,),
                                      //Second Container
                                      Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(14.0),
                                            color: Colors.blueGrey),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                new MaterialPageRoute(
                                                    builder: (context) =>SportsDetail_News(snapshot.data[index])));
                                          },
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Text(
                                                "View Details",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    actionPane: SlidableDrawerActionPane(),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
