import 'package:dio/dio.dart';
import 'package:sismo_app/widgets/earthquake.dart';

class EarthquakeApi {
  final Dio _dio = Dio();

  void getHttp() async {
    try {
      var response = await Dio().get('http://www.google.com');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
