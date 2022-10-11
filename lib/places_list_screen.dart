import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_app/providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  // const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnapSaver'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/add_place');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text("No Snaps Added yet"),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                    ? ch
                    : ListView.builder(
                        itemCount: greatPlaces.items.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlaces.items[index].image),
                          ),
                          title: Text(greatPlaces.items[index].title),
                          onTap: () {},
                        ),
                      )),
      ),
    );
  }
}
