import 'package:sismo_app/Earthquake/model/earthquake_model.dart';
import 'package:dio/dio.dart';

class EarthquakeApiProvider {
  final Dio _dio = Dio();
  final String _url = "https://api.xor.cl/sismo/recent";

  Future<EarthquakeModel> fetchEarthquakeList() async {
    try {
      Response response = await _dio.get(_url);
      return EarthquakeModel.fromJson(response.data);
    } catch (error) {
      // print("Exception occured: $error stackTrace: $stacktrace");
      return EarthquakeModel.withError("Data not found / Connection issue");
    }
  }
}
