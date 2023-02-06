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
            spreadRadius: 1,
            offset: Offset(1, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 100,
            width: 90,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  // the color of the magnitude circle is based on the magnitude value
                  color: _getMagnitudeColor(earthquake.magnitude?.value),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Text(
                  "${earthquake.magnitude?.value}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 90),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // calculate the time since the earthquake happened using the date of the earthquake "local_date"
                        "Hace ${_getTimeSinceEarthquake(earthquake.localDate!)}",
                        // "${earthquake.localDate}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "${earthquake.localDate}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Profundidad: ${earthquake.depth} km",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${earthquake.geoReference}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // return the color of the magnitude circle based on the magnitude value
  Color _getMagnitudeColor(double? magnitude) {
    if (magnitude! >= 0 && magnitude < 2) {
      return Colors.green;
    } else if (magnitude >= 2 && magnitude < 4) {
      return Colors.yellow;
    } else if (magnitude >= 4 && magnitude < 6) {
      return Colors.orange;
    } else if (magnitude >= 6 && magnitude < 8) {
      return Colors.red;
    } else if (magnitude >= 8 && magnitude < 10) {
      return Colors.purple;
    } else {
      return Colors.black;
    }
  }

  String _getTimeSinceEarthquake(String date) {
    // get the current date and time
    var now = DateTime.now();
    // get the date and time of the earthquake
    var earthquakeDate = DateTime.parse(date);
    // calculate the difference between the current date and time and the earthquake date and time
    var difference = now.difference(earthquakeDate);
    // if the difference is less than an hour return the minutes
    if (difference.inHours < 1) {
      return "${difference.inMinutes} min";
    } else {
      // if the difference is more than an hour return the hours
      return "${difference.inHours} hrs";
    }
  }
}
