import 'package:flutter/material.dart';

// Card widget for displaying earthquake data
class EarthquakeCard extends StatelessWidget {
  const EarthquakeCard(
      {super.key,
      required this.magnitude,
      required this.place,
      required this.time,
      required this.url});

  final double magnitude;
  final String place;
  final int time;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(magnitude.toString()),
            ),
            title: Text(place),
            subtitle: Text(time.toString()),
          )
        ],
      ),
    );
  }
}
