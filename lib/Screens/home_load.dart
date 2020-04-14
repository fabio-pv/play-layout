import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:play_layout/Screens/home.dart';

class HomeLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              height: 100,
              width: 100,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 8.0,
                    backgroundColor: Colors.purple,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.purple[300]),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Play Layout',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
