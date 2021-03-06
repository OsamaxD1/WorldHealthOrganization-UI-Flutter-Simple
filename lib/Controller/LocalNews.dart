import 'package:flutter/material.dart';
import 'package:flutternewsapp/View/Local News/LocalGallery.dart' as gallery;
import 'package:flutternewsapp/View/Local News/LocalALLNews.dart' as allnews;

class LocalNews extends StatefulWidget {
  @override
  _LocalNewsState createState() => _LocalNewsState();
}

class _LocalNewsState extends State<LocalNews> with SingleTickerProviderStateMixin{
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
          allnews.LocalNews(),
          gallery.LocalNewsGallery()
        ],
      ),
    );
  }
}
