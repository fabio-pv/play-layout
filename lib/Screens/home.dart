import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:play_layout/Models/post.dart';
import 'package:play_layout/Screens/home_detail.dart';
import 'package:play_layout/Screens/home_list.dart';
import 'package:play_layout/Screens/home_load.dart';
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
      backgroundColor: widget.posts.length == 0 ? Colors.purple : null,
      appBar: AppBar(
        elevation: widget.posts.length == 0 ? 0 : null,
        title: widget.posts.length == 0 ? null : Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: widget.posts.length == 0
          ? HomeLoad()
          : HomeList(
              posts: widget.posts,
              showDetails: this.showDetail,
            ),
    );
  }
}
