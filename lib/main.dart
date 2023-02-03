import 'package:flutter/material.dart';
import 'package:sismo_app/widgets/earthquake_list.dart';
import 'package:dio/dio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Dio _dio = Dio();
    dynamic _array = [];
    //get data from api using dio
    _dio
        .get(
            'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2021-01-01&endtime=2021-01-02')
        .then((value) => _array.add(value.data['features']));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Center(
          // iterate _array and create a list of earthquake cards
          child: Text(_array.toString()),
        ),
      ),
    );
  }
}
