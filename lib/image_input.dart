import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'dart:io';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

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
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
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
