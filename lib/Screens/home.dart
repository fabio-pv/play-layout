import 'package:flutter/material.dart';
import 'package:play_layout/Models/post.dart';
import 'package:play_layout/Services/homeService.dart';

class Home extends StatefulWidget {
  var posts = new List<Post>();

  Home() {
    posts = [];
  }

  @override
  _HomeState createState() => _HomeState(new HomeService());
}

class _HomeState extends State<Home> {
  final HomeService homeService;

  _HomeState(this.homeService) {
    load();
  }

  Future load() async {
    try {
      final posts = await this.homeService.retriveAll();

      setState(() {
        widget.posts = posts;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final post = widget.posts[index];
          return Text(post.title);
        },
      ),
    );
  }
}
