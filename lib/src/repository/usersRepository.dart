import 'dart:convert';

import 'package:starter_flutter_bloc_pattern/src/models/userModel.dart';
import 'package:starter_flutter_bloc_pattern/src/services/getUsersService.dart';
import 'package:starter_flutter_bloc_pattern/utils/widgets/toast.dart';

class UserRepository {
  Future<UserListModel> getUsers() async {
    var usersResponseList = await getUsersService();
    var jsonUsersResponseList = jsonDecode(usersResponseList.body);
    if (usersResponseList.statusCode != 200) {
      showErrorToast(msg: jsonUsersResponseList["error"]);
    }
    return UserListModel.fromJson(jsonUsersResponseList);
  }
}
