import 'package:flutter/material.dart';
// import 'package:generic_bloc_provider/generic_bloc_provider.dart';
// import 'package:sismo_app/Earthquake/bloc/bloc_earthquake.dart';
import 'package:sismo_app/Earthquake/ui/screen/home_earthquake.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //get data from api using dio and display it in a text
    return MaterialApp(
      title: 'Sismo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeEarthquake(),
    );
  }
}
