import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String previewImageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Color.fromARGB(255, 28, 66, 109))),
            width: double.infinity,
            alignment: Alignment.center,
            child: previewImageUrl == null
                ? Text(
                    "No Location Chosen",
                    textAlign: TextAlign.center,
                  )
                : Image.network(
                    previewImageUrl,
                    fit: BoxFit.cover,
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.location_on_outlined),
                label: Text("Current Location")),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map_outlined),
                label: Text("Select Location"))
          ],
        )
      ],
    );
  }
}
