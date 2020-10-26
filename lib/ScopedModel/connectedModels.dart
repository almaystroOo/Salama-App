import 'package:appwrite/appwrite.dart';
import '../models/userModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../consts/constants.dart';
import '../screens/LoginPage.dart';

class ConnectedModel extends Model {
  // Function log;
  // User authedUser;
  // ConnectedModel(this.log);
}

class UserModel extends ConnectedModel {
  bool isLoading = false;
  String errMsg;
  String doneMsg;
  // User authedUser;
  //Constants _const = Constants();

  // var responser;
  // final User _user;

  // Init SDK
  Future<bool> logIn(String email, String password) async {
    Client client = Client();
    Account account = Account(client);

    client
            .setEndpoint('http://192.168.1.76/v1') // Your API Endpoint
            .setProject('5f9018d83a0a0') // Your project ID
        ;
    isLoading = true;
    notifyListeners();
    return await account
        .create(
      email: email,
      password: password,
    )
        .then((response) {
      print(response);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // String responseData = json.decode(response.);
        response.statusMessage = doneMsg;
        print(doneMsg);
        isLoading = false;
        notifyListeners();
        return true;
      } else if (response.statusCode != 200) {
        //  Map<String, dynamic> responseData = json.decode(response.data);
        //responseData['message'] = errMsg;
        response.statusMessage = errMsg;
        isLoading = false;
        print(errMsg);
        notifyListeners();
        return false;
      }
    });
  }
}
// print(e['error']);

// result.then((response) {
//   print(response);
//   var resulter = jsonDecode(response);
//   print(resulter);
//   //  response = responser;
// }).catchError((error) {
//   print(error.response);
// });
//   }
// }

// authedUser = User(email: email, password: password);
// print(authedUser);

// // class Auth extends ConnectedModel {

// }
