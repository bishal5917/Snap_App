import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:snap_app/image_input.dart';
// import 'package:snap_app/location_input.dart';
import 'dart:io';

import 'package:snap_app/providers/great_places.dart';

class AddPlaceScreen extends StatefulWidget {
  // const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleController = TextEditingController();

  var _pickedImage;
  var locs;

  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void savePlace() {
    if (titleController.text.isEmpty && _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

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
                  ImageInput(selectImage),
                  // SizedBox(height: 20),
                  // LocationInput()
                ]),
              ),
            )),
            OutlinedButton(
                onPressed: savePlace,
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
