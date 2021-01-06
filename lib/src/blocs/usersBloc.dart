import 'dart:async';
import 'package:starter_flutter_bloc_pattern/src/models/userModel.dart';
import 'package:starter_flutter_bloc_pattern/src/repository/usersRepository.dart';
import 'mainBloc.dart';

class UsersBloc implements Bloc{

  final UserRepository _userRepository=UserRepository();

  final StreamController<UserListModel> _usersBlocStreamController=StreamController<UserListModel>.broadcast();
  Stream<UserListModel> get getUsersBlocStream => _usersBlocStreamController.stream;

 
  void getUsersBloc()async{
    UserListModel usersResult= await _userRepository.getUsers();
    _usersBlocStreamController.sink.add(usersResult);
  }
 
  void dispose(){
    _usersBlocStreamController.close();
  }
}

final usersBloc=UsersBloc();