import 'package:flutter/foundation.dart';
import 'package:snap_app/models/place.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier {
  List<Place> items = [];

  List<Place> get Items {
    return [...items];
  }

  void addPlace(String title, File image) {
    final newPlace =
        Place(id: DateTime.now().toString(), image: image, title: title);
    items.add(newPlace);
    notifyListeners();
  }
}
