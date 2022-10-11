import 'package:flutter/foundation.dart';
import 'package:snap_app/db/db_helper.dart';
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
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    items = dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
            ))
        .toList();
    notifyListeners();
  }
}
