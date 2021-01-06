class UserModel {
  int userId;
  int id;
  String title;
  bool completed;
  

  UserModel(
      {this.userId,
      this.id,
      this.title,
      this.completed,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    completed = json["completed"];
   
  }
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
        "completed": completed,
       
      };
}

class UserListModel {
  List<UserModel> results;
  List<dynamic> rawData;
  dynamic error;

  UserListModel({this.results, this.rawData, this.error});

  UserListModel.fromJson(List<dynamic> json) {
    if (json != null) {
      results = List<UserModel>();
      rawData = json;
      results = (json as List).map((i) => UserModel.fromJson(i)).toList();
    }
  }
}
