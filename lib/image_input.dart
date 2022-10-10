import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  var storedImage;

  Future<void> takePicture() async {
    // final imageFile =
    //     await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    final picker = ImagePicker();
    final imageFile =
        await picker.getImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      storedImage = File(imageFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 400,
          width: 200,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.green)),
          child: storedImage != null
              ? Image.file(storedImage,
                  fit: BoxFit.cover, width: double.infinity)
              : Text(
                  "No Image Chosen",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        TextButton.icon(
          icon: Icon(Icons.camera),
          label: Text("Take a Pic"),
          onPressed: takePicture,
        )
      ],
    );
  }
}
