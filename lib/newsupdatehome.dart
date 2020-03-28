import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'latestpostdetail.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutternewsapp/Controller/InternationalNews.dart';
import 'package:flutternewsapp/Controller/LocalNews.dart';
import 'package:flutternewsapp/Controller/PoliticalNews.dart';
import 'package:flutternewsapp/Controller/SportsNews.dart';

class NewsUpdateHome extends StatefulWidget {
  @override
  _NewsUpdateHomeState createState() => _NewsUpdateHomeState();
}

class _NewsUpdateHomeState extends State<NewsUpdateHome> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      Firestore.instance.collection("LatestPost");

  @override
  void initState() {
    // TODO: implement initState
    subscription = collectionReference.snapshots().listen((datasnap) {
      setState(() {
        snapshot = datasnap.documents;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          'World Health Organization',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        //backgroundColor: Colors.white,
        backgroundColor: Color(0xFF008dc9),
        //iconTheme: new IconThemeData(color: Colors.black),
      ),

      //Drawer
      drawer: new Drawer(
        child: Container(
          // color: Colors.white,
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: new Text(
                    "News Update Catergory",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  accountEmail: null,
                  decoration: new BoxDecoration(color: Color(0xFF008dc9))),
              new ListTile(
                title: new Text(
                  "Health Topics",
                  style: TextStyle(fontSize: 17.0, color: Color(0xFF008dc9)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => InternationalNews()));
                },
                leading: new Icon(
                  Icons.next_week,
                  color: Color(0xFF008dc9),
                ),
              ),
              new ListTile(
                title: new Text(
                  "Countries",
                  style: TextStyle(fontSize: 17.0, color: Color(0xFF008dc9)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => SportsNews()));
                },
                leading: new Icon(
                  Icons.security,
                  color: Color(0xFF008dc9),
                ),
              ),
              new ListTile(
                title: new Text(
                  "Newsroom",
                  style: TextStyle(fontSize: 17.0, color: Color(0xFF008dc9)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => LocalNews()));
                },
                leading: new Icon(
                  Icons.next_week,
                  color: Color(0xFF008dc9),
                ),
              ),
              new ListTile(
                title: new Text(
                  "Emergencies",
                  style: TextStyle(fontSize: 17.0, color: Color(0xFF008dc9)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => PoliticalNews()));
                },
                leading: new Icon(
                  Icons.next_week,
                  color: Color(0xFF008dc9),
                ),
              ),
              new ListTile(
                title: new Text(
                  "Donation",
                  style: TextStyle(fontSize: 17.0, color: Colors.red),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => PoliticalNews()));
                },
                leading: new Icon(
                  Icons.next_week,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              new ListTile(
                title: new Text(
                  "About Us",
                  style: TextStyle(fontSize: 17.0, color: Color(0xFF008dc9)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => PoliticalNews()));
                },
                leading: new Icon(
                  Icons.next_week,
                  color: Color(0xFF008dc9),
                ),
              )
            ],
          ),
        ),
      ),
      //backgroundColor: Colors.white,
      backgroundColor: Colors.white,

      body: new ListView(
        children: <Widget>[
          //1st Container of Latest News Feed

          new Container(
            height: 190.0,
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          new Text(
                            "Latest Post",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 250,
                          ),
                          new Text(
                            "__",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFF008dc9),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 1.0,
                  ),
                  new Container(
                    height: 130.0,
                    //  width: 1500.0,
                    margin: EdgeInsets.only(top: 1.0),
                    //color: Color(0xFF222240),
                    color: Colors.white,
                    child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      //shrinkWrap: true,
                      itemCount: snapshot.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(30.0),
                              topRight: const Radius.circular(20.0),
                              bottomRight: const Radius.circular(20.0),
                              bottomLeft: const Radius.circular(30.0)),
                          child: Container(
                            // height: 120,
                            width: 300.0,
                            // color: Colors.lightBlue,
                            color: Color(0xFF008dc9),
                            margin: EdgeInsets.only(left: 10.0),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: new Image.network(
                                      snapshot[index].data["image"],
                                      fit: BoxFit.cover,
                                      height: 130.0,
                                    ),
                                  ),
                                ),
                                new SizedBox(
                                  width: 10.0,
                                ),
                                new Expanded(
                                    flex: 2,
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        InkWell(
                                          child: new Text(
                                            snapshot[index].data["title"],
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).push(
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        LatestPostDetails(
                                                            snapshot[index])));
                                          },
                                        ),
                                        new SizedBox(
                                          height: 5.0,
                                        ),
                                        new Text(
                                          snapshot[index].data["content"],
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        ),
                                        new SizedBox(
                                          height: 8.0,
                                        ),
                                        new Container(
                                          child: new Row(
                                            children: <Widget>[
                                              new Icon(
                                                Icons.remove_red_eye,
                                                color: Colors.deepOrange,
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              new Text(
                                                "View",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
          ),
          //End 1st Container of Latest News Feed

          //2nd Container Slider(Carousel)

          Container(
            margin: EdgeInsets.all(8.0),
            height: 200.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 2000),
                dotSize: 6.0,
                dotIncreasedColor: Color(0xFFFF335C),
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                borderRadius: true,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  NetworkImage(
                    'https://img.medscape.com/thumbnail_library/dt_200311_coronavirus_covid-19_pandemic_800x450.jpg',
                  ),

                  NetworkImage(
                      'https://i.ytimg.com/vi/NeDeOxb4ofg/maxresdefault.jpg?fakeurl=1&type=.jpg'),
                  NetworkImage(
                      'https://cdn02.allafrica.com/download/pic/main/main/csiid/00551581:c00fb0314bdbc61f71e888a56d825f4e:arc614x376:w735:us1.jpg'),
                  NetworkImage(
                      'https://www.daily-sun.com/assets/news_images/2020/01/21/Film_festival.jpg'),
                  NetworkImage(
                      'https://ipac-canada.org/photos/Ads/96_ad_2020YearOfMidwifeNurse.jpg'),

                  //   ExactAssetImage("assets/images/LaunchImage.jpg"),
                ],
              ),
            ),
          ),
          //End 2nd Container Slider(Carousel)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "COVID-19 Quick Link",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 1.0,
          ),

          //3rd Container button of news sections
          Container(
            margin: EdgeInsets.all(8.0),
            height: 250.0,
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF008dc9),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            InternationalNews()));
                              },
                              child: Text(
                                "Scam Alert",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF008dc9),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => SportsNews()));
                              },
                              child: Text(
                                "Public Advice",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF008dc9),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => SportsNews()));
                              },
                              child: Text(
                                "Health Workers",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF008dc9),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => LocalNews()));
                              },
                              child: Text(
                                "Country Guide",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF008dc9),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => PoliticalNews()));
                              },
                              child: Text(
                                "Situation Update",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF008dc9),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => PoliticalNews()));
                              },
                              child: Text(
                                "Research & Dev",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
