import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Location example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Location _location = Location();
  late LocationData _locationData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPosition();
  }

  Future<void> _getPosition() async {
      try{
          _locationData = await _location.getLocation();
      }catch(e){
          print('get position error : $e ');
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your location is:',
            ),
          Text(
            _locationData == null ?'Waiting For Position ' : 'Latitude :${_locationData.latitude}',
            style:Theme.of(context).textTheme.headline4,
          ),
          Text(
            _locationData == null ?'Waiting For Position ' : 'Longitude :${_locationData.longitude}',
            style:Theme.of(context).textTheme.headline4,
          ),
          ],
        ),
      ),
    );
  }
}
