import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sismo_app/Earthquake/bloc/earthquake_bloc.dart';
import 'package:sismo_app/Earthquake/model/earthquake_model.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final EarthquakeBloc _earthquakeBloc = EarthquakeBloc();

  @override
  void initState() {
    _earthquakeBloc.add(GetEarthquakeList());
    super.initState();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    // target chile
    target: LatLng(-33.4488897, -70.6692655),

    zoom: 5,
  );

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      // margin: const EdgeInsets.all(8),
      child: BlocProvider(
        create: (_) => _earthquakeBloc,
        child: BlocListener<EarthquakeBloc, EarthquakeState>(
          listener: (context, state) {
            if (state is EarthquakeError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<EarthquakeBloc, EarthquakeState>(
            builder: (context, state) {
              if (state is EarthquakeInitial) {
                return _buildLoading();
              } else if (state is EarthquakeLoading) {
                return _buildLoading();
              } else if (state is EarthquakeLoaded) {
                return _showMap(state.earthquakeModel);
              } else if (state is EarthquakeError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _showMap(EarthquakeModel earthquake) {
    var events = earthquake.events;

    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        for (var i = 0; i < events!.length; i++)
          Marker(
            markerId: const MarkerId('marker_1'),
            position: LatLng(events[i].latitude!, events[i].longitude!),
            infoWindow: const InfoWindow(
              title: 'Marker 1',
              snippet: 'This is a snippet',
            ),
          ),
      },
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
