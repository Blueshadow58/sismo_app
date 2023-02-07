import 'package:flutter/material.dart';
import 'package:sismo_app/Earthquake/ui/screen/home_earthquake.dart';
import 'package:sismo_app/Earthquake/ui/screen/map_sample.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  static const String _title = 'Sismo App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeEarthquake(),
    MapSample()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(child: Text('Sismo App')),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        // change icon color
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(
          color: Colors.amber[700],
        ),

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Mapa',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
