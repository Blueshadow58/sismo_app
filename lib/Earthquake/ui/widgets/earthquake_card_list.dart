import 'package:flutter/material.dart';
import 'package:sismo_app/Earthquake/model/earthquake_model.dart';

class EarthquakeCardList extends StatelessWidget {
  final EarthquakeModel model;
  const EarthquakeCardList({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: ListView.builder(
        itemCount: model.events!.length,
        itemBuilder: (context, index) {
          var event = model.events![index];
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text("Magnitud ${event.magnitude}"),
                    Text("Profundidad: ${event.depth}"),
                    Text("Fecha: ${event.utcDate}"),

                    // Text("Url: ${model.events![index].url}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
