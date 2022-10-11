import 'package:flutter/material.dart';
import 'package:snap_app/add_place_screen.dart';
import 'package:snap_app/places_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:snap_app/providers/great_places.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: PlacesListScreen(),
        routes: {'/add_place': (ctx) => AddPlaceScreen()},
      ),
    );
  }
}
