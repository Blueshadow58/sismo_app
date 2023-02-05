import 'package:sismo_app/Earthquake/model/earthquake_model.dart';
import 'earthquake_api_provider.dart';

class EarthquakeApiRepository {
  final _provider = EarthquakeApiProvider();

  Future<EarthquakeModel> fetchEarthquakeList() =>
      _provider.fetchEarthquakeList();
}

class NetworkError extends Error {}
