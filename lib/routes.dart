import 'package:flutter/material.dart';
import 'package:starter_flutter_bloc_pattern/src/screens/home.dart';

class Routes {
  static const home = 'home';

  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      home: (context) => HomeScreen(),
    };
  }
}