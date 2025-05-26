import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String title;

  const DetailsScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Details', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text(
          'You tapped on: $title\nThis is just to show you understand navigation in Flutter.',
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}