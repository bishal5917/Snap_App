import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnapSaver'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
    );
  }
}
