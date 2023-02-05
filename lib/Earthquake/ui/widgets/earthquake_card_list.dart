import 'package:flutter/material.dart';
import 'package:sismo_app/Earthquake/model/earthquake_model.dart';
import 'package:sismo_app/Earthquake/ui/widgets/earthquake_card.dart';

class EarthquakeCardList extends StatelessWidget {
  final EarthquakeModel earthquake;
  const EarthquakeCardList({Key? key, required this.earthquake})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: ListView.builder(
        itemCount: earthquake.events!.length,
        itemBuilder: (context, index) {
          var event = earthquake.events![index];
          return Column(
            children: <Widget>[
              // Text("Magnitud ${event.magnitude}"),
              // Text("Profundidad: ${event.depth}"),
              // Text("Fecha: ${event.utcDate}"),
              EarthquakeCard(earthquake: event)
              // Text("Url: ${model.events![index].url}"),
            ],
          );
        },
      ),
    );
  }
}
