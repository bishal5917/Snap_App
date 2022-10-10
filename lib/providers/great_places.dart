import 'package:flutter/foundation.dart';
import 'package:snap_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> items = [];

  List<Place> get Items {
    return [...items];
  }
}
