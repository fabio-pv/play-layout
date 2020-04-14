import 'package:flutter/material.dart';
import 'package:play_layout/Models/post.dart';

class HomeList extends StatefulWidget {
  List<Post> posts;
  Function showDetails;

  HomeList({Key key, this.posts, this.showDetails}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
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
                widget.showDetails(post);
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
