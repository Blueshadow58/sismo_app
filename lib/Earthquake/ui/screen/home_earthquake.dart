import 'package:sismo_app/Earthquake/bloc/earthquake_bloc.dart';
import 'package:sismo_app/Earthquake/model/earthquake_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sismo_app/Earthquake/ui/widgets/earthquake_card_list.dart';

// import 'package:sismo_app/Earthquake/ui/widgets/earthquake_card.dart';
// import 'package:sismo_app/Earthquake/ui/widgets/earthquake_card_list.dart';

class HomeEarthquake extends StatefulWidget {
  const HomeEarthquake({super.key});

  @override
  HomeEarthquakeState createState() => HomeEarthquakeState();
}

class HomeEarthquakeState extends State<HomeEarthquake> {
  final EarthquakeBloc _earthquakeBloc = EarthquakeBloc();

  @override
  void initState() {
    _earthquakeBloc.add(GetEarthquakeList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sismo App')),
      body: _buildListEarthquake(),
    );
  }

  Widget _buildListEarthquake() {
    return Container(
      margin: const EdgeInsets.all(8.0),
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
                return _buildCard(context, state.earthquakeModel);
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

  Widget _buildCard(BuildContext context, EarthquakeModel model) {
    // return EarthquakeCardList(model: model);
    return ListView.builder(
      itemCount: model.events!.length,
      itemBuilder: (context, index) {
        print(model.events![index].magnitude?['value']);
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Magnitud ${model.events![index].magnitude}"),
                  Text("Profundidad: ${model.events![index].depth}"),
                  Text("Fecha: ${model.events![index].utcDate}"),

                  // Text("Url: ${model.events![index].url}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
