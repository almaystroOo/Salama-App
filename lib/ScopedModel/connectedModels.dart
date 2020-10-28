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
  bool _isLoading = false;
  bool isdone = false;
  bool notdone = false;
  String errMsg;
  String doneMsg;
  Client client = Client();
  Account account;
  bool _isLoggedIn;

  String _error;
  bool _created;
  bool get isCreated => _created;
  bool get isLoading => _isLoading;
  bool get isLoggedIn {
    return _isLoggedIn;
  }

  User get user => _user;
  String get error => _error;
  User _user;
}

class UserModel extends ConnectedModel {
  // User authedUser;
  //Constants _const = Constants();

  // var responser;
  // final User _user;
  bool get isDone {
    return isdone;
  }

  bool get notDone {
    return notdone;
  }

  // Init SDK
  String get doneMssg {
    return doneMsg;
  }

  String get errMssg {
    return errMsg;
  }

  init() async {
    _isLoggedIn = false;

    _user = null;
    account = Account(client);
    client.setEndpoint('http://192.168.1.76/v1').setProject('5f9018d83a0a0');
    await _checkIsLoggedIn();
  }

  _checkIsLoggedIn() async {
    try {
      _user = await _getAccount();
      _isLoggedIn = true;
      notifyListeners();
    } catch (e) {
      print(e.message);
    }
  }

  Future<User> _getAccount() async {
    try {
      Response<dynamic> res = await account.get();
      if (res.statusCode == 201) {
        // print('account get');
        // print(User.fromJson(res.data));
        return User.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  createAccount(String email, String password) async {
    _isLoading = true;
    _created = false;
    notifyListeners();
    try {
      var response = await account.create(email: email, password: password);
      print(response);
      print(response.headers);
      print(response.statusCode);
      print(response.statusMessage);
      _created = true;
      print(isCreated.toString() + 'iscreated :');
      notifyListeners();
    } catch (error) {
      print(error.message);
    }
  }

  logIn(String email, String password) async {
    // String email;
    // // String password;
    // Client client = Client();
    // Account account = Account(client);

    // client
    //         .setEndpoint('http://192.168.1.76/v1') // Your API Endpoint
    //         .setProject('5f9018d83a0a0') // Your project ID
    //     ;
    _isLoading = true;
    isdone = false;
    notifyListeners();
    try {
      Response response =
          await account.createSession(email: email, password: password);
      // return result.then(() {
      print(response);
      print(response.headers);
      print(response.statusCode);
      print(response.statusMessage);
      _isLoggedIn = true;
      notifyListeners();
      if (response.statusCode == 201 || response.statusCode == 200) {
        // String responseData = json.decode(response.);
        doneMsg = response.statusMessage;
        print('done msg condition' + doneMsg);
        _isLoggedIn = true;
        isdone = true;
        // notifyListeners();
        _user = await _getAccount();
        _isLoading = false;
        notifyListeners();
        // return true;
      }
      // else if (response.statusCode != 200 || response.statusCode == 201) {
      //   //  Map<String, dynamic> responseData = json.decode(response.data);
      //   //responseData['message'] = errMsg;
      //   response.statusMessage = errMsg;
      //   isLoading = false;
      //   isdone = true;
      //   print(errMsg);
      //   notifyListeners();
      //   // return false;

    } catch (error) {
      _isLoading = false;
      notdone = true;
      error.response = errMsg;
      notifyListeners();
    }
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
