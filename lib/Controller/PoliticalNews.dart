import 'package:flutter/material.dart';
import 'package:flutternewsapp/View/Political News/PoliticalGallery.dart' as gallery;
import 'package:flutternewsapp/View/Political News/PoliticalALLNews.dart' as allnews;

class PoliticalNews extends StatefulWidget {
  @override
  _PoliticalNewsState createState() => _PoliticalNewsState();
}

class _PoliticalNewsState extends State<PoliticalNews> with SingleTickerProviderStateMixin{
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
                text: "Political News",),
              Tab(icon: Icon(Icons.image),
                text: "Political News Gallery",)
            ]),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          allnews.PoliticalNews(),
          gallery.PoliticalNewsGallery()
        ],
      ),
    );
  }
}
