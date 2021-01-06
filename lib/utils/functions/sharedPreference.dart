import 'package:shared_preferences/shared_preferences.dart';

saveData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('data', 'data');
}

// here we take the exemple of shared preferences functions 