import 'package:flutter/material.dart';
import 'package:sismo_app/widgets/earthquake.dart';

// Card list widget for displaying earthquake data
class EarthquakeList extends StatelessWidget {
  const EarthquakeList({super.key, required this.earthquakes});

  final List<EarthquakeCard> earthquakes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: earthquakes,
    );
  }
}
