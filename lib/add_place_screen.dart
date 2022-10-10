import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snap_app/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Snaps'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Enter Title"),
                    controller: titleController,
                  ),
                  SizedBox(height: 20),
                  ImageInput()
                ]),
              ),
            )),
            OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Add Snap',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.all(10) //<-- SEE HERE
                    ))
          ]),
    );
  }
}
