import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PoliticalNewsGallery extends StatefulWidget {
  @override
  _PoliticalNewsGalleryState createState() => _PoliticalNewsGalleryState();
}

class _PoliticalNewsGalleryState extends State<PoliticalNewsGallery> {
  Future getAllimage() async {
    var firestore = Firestore.instance;
    QuerySnapshot snap =
    await firestore.collection("InternationalAllNews").getDocuments();
    return snap.documents;
  }

  Future<Null> getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getAllimage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222240),
      body: FutureBuilder(
        future: getAllimage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: getRefresh,
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(6.0),
                      height: 300.0,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              child: Image.network(snapshot.data[index].data["image"],
                                height: 300.0,
                                fit: BoxFit.cover,),
                            ),
                          ),
                          Positioned(
                            top: 40.0,
                            left: 30.0,
                            child: Container(
                              height: 50.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0)
                                  )
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("International News",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  ),),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            );
          }
        },
      ),
    );
  }
}
