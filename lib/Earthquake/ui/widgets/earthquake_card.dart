import 'package:flutter/material.dart';
import 'package:sismo_app/Earthquake/model/earthquake_model.dart';

class EarthquakeCard extends StatelessWidget {
  final Events earthquake;

  const EarthquakeCard({
    Key? key,
    required this.earthquake,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return earthquakeCard with image, magnitude, place and time in a stack widget with the data inside
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        // left: 20,
        // right: 20,
      ),
      height: 100,
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "${earthquake.magnitude?['value']}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 10,
                ),
                Text(
                  '4.2',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '10km S of La Serena, Chile',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '2021-05-10 12:00:00',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
