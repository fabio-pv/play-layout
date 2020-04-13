import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:play_layout/ScreensArguments/home_detail_argument.dart';

class HomeDetail extends StatelessWidget {
  static const routeName = '/home/detail';

  @override
  Widget build(BuildContext context) {
    final HomeDetailArgument args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        color: Colors.purple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                args.post.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                args.post.body,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
