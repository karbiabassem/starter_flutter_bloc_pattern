import 'package:http/http.dart' as http;
import 'package:starter_flutter_bloc_pattern/config/endPoints.dart';
import 'package:starter_flutter_bloc_pattern/utils/widgets/toast.dart';

Future getUsersService() async{
  Map<String, String> headers = {
      "Content-type": "application/json",
  };
  try {
     var response= await http.get(EndPoint.TODOS,headers: headers);
     return response;
  } catch (error) {
    print("Error Get Users: $error");
    showErrorToast(msg: "Sorry,it's error");
  }
}