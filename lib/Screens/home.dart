import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:play_layout/Models/post.dart';
import 'package:play_layout/Screens/home_detail.dart';
import 'package:play_layout/ScreensArguments/home_detail_argument.dart';
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

  void showDetail(Post post) {
    try {
      Navigator.pushNamed(
        context,
        HomeDetail.routeName,
        arguments: HomeDetailArgument(post),
      );
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15.0),
        itemCount: widget.posts.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final post = widget.posts[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {
                showDetail(post);
              },
              child: Container(
                padding: EdgeInsets.all(20.0),
                height: 100,
                child: Center(
                  child: Text(
                    post.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
