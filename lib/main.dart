import 'package:flutter/material.dart';
import 'package:starter_flutter_bloc_pattern/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var _defaultHome = Routes.home;
  runApp(MyApp(_defaultHome));
}

class MyApp extends StatefulWidget {
  var defaultHome;
  MyApp(this.defaultHome);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tunisian Flutter Community',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: Routes.routes(),
        initialRoute: widget.defaultHome);
  }
}
