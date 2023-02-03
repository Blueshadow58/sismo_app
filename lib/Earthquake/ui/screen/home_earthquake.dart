import 'package:flutter/material.dart';

class HomeEarthquake extends StatelessWidget {
  const HomeEarthquake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earthquakes'),
      ),
      body: const Center(
        child: Text('Earthquakes'),
      ),
    );
  }
}
