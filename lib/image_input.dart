import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.green)),
          child: storedImage != null
              ? Image.file(storedImage,
                  fit: BoxFit.cover, width: double.infinity)
              : Text("No Image Chosen"),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        TextButton.icon(
          icon: Icon(Icons.camera),
          label: Text("Take a Pic"),
          onPressed: () {},
        )
      ],
    );
  }
}
