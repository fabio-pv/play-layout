import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home() {
    print('Home *********');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Bem vindo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.tealAccent,
      ),
    );
  }
}
