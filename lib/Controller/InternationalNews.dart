import 'package:flutter/material.dart';
import 'package:flutternewsapp/View/International News/InternationalGallery.dart' as gallery;
import 'package:flutternewsapp/View/International News/InternationalALLNews.dart' as allnews;

class InternationalNews extends StatefulWidget {
  @override
  _InternationalNewsState createState() => _InternationalNewsState();
}

class _InternationalNewsState extends State<InternationalNews> with SingleTickerProviderStateMixin{
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
        title: Text('Scam Alert'),
        backgroundColor: Color(0xFF008dc9),
        bottom: TabBar(
            controller: controller,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.view_headline),
              text: "Daily Update",),
              Tab(icon: Icon(Icons.image),
              text: "Gallery",)
            ]),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          allnews.RiskNews(),
          gallery.RiskNewsGallery()
        ],
      ),
    );
  }
}
