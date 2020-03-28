import 'package:flutter/material.dart';
import 'package:flutternewsapp/View/Sports News/SportsGallery.dart' as gallery;
import 'package:flutternewsapp/View/Sports News/SportsALLNews.dart' as allnews;

class SportsNews extends StatefulWidget {
  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    controller=new TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('International News'),
        backgroundColor: Color(0xFF272b4a),
        bottom: TabBar(
            controller: controller,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.view_headline),
                text: "Local News",),
              Tab(icon: Icon(Icons.image),
                text: "Local News Gallery",)
            ]),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          allnews.SportsNews(),
          gallery.SportsNewsGallery()
        ],
      ),
    );
  }
}
