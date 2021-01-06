
import 'package:flutter/material.dart';
import 'package:starter_flutter_bloc_pattern/src/screens/users.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tunisian Flutter Community"),),
      body: UserListScreen(),
    );
  }
}