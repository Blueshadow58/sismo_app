import 'package:flutter/material.dart';
// import 'package:generic_bloc_provider/generic_bloc_provider.dart';
// import 'package:sismo_app/Earthquake/bloc/bloc_earthquake.dart';
import 'package:sismo_app/Earthquake/ui/screen/home_earthquake.dart';
import 'package:sismo_app/bottom_navigation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //get data from api using dio and display it in a text

    return const MaterialApp(
      home: BottomNavigation(),
    );

    // home: BottomNavigation(),
    // home: const HomeEarthquake(),
  }
}
