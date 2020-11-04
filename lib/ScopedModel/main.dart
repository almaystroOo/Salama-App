//import 'package:meals_app/Models/userModel.dart';
import 'package:scoped_model/scoped_model.dart';
// import './connectedModels.dart';
//import '../ScopedModel/connectedModels.dart';
import 'package:appwrite/appwrite.dart';
import '../models/userModel.dart';
//import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
//import 'package:http/http.dart' as http;
import 'dart:convert';
// import '../consts/constants.dart';
// import '../screens/LoginPage.dart';
import '../Models/statementModel.dart';
import 'dart:io';

class MainModel extends Model {
  bool _isLoading = false;
  bool isdone = false;
  bool notdone = false;
  String errMsg;
  String doneMsg;
  Client client = Client();
  Storage storage;
  Account account;
  Database database;
  bool _isLoggedIn;
  User _user;
  String _error;
  bool _created;
  String _userId;
  List<String> _imagesPath = [];
  List<Map<String, dynamic>> _statments = [];
  final Map<String, dynamic> _data = new Map<String, dynamic>();
  String collectionID = "5f95781c139dd";
  //final Map<String, dynamic> dataB = new Map<String, dynamic>();
  List<Map<String, dynamic>> get statments => List.from(_statments);
  bool get isCreated => _created;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  List get imagePath => _imagesPath;
  Map<String, dynamic> get getData => _data;
  String get userId => _userId;
  User get userr => _user;
  String get error => _error;

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

//  StatementFields _statement;

  //String get userId => _userId;
  init() async {
    _isLoggedIn = false;

    _user = null;
    Client client = Client();
    account = Account(client);
    storage = Storage(client);
    database = Database(client);
    client.setEndpoint('http://192.168.0.102/v1').setProject('5f9018d83a0a0');

    // Future result = storage.createFile(
    //   file: await MultipartFile.fromFile(
    //       './path-to-files/image.jpg', 'image.jpg'),
    //   read: [],
    //   write: [],
    // );
    return await _checkIsLoggedIn();
  }

  _checkIsLoggedIn() async {
    try {
      _user = await _getAccount();
      _isLoggedIn = true;
      notifyListeners();
      print('_Check is logged in :' + '$_isLoggedIn');

      return false;
    } catch (e) {
      print(e.message);
    }
  }

  Future<User> _getAccount() async {
    try {
      Response<dynamic> res = await account.get();
      //print('account get user');
      if (res.statusCode == 201) {
        // print('account get');
        // print(User.fromJson(res.data));
        print(User.fromJson(res.data));
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
      Response response =
          await account.create(email: email, password: password);
      print(response);
      print(response.headers);
      print(response.statusCode);
      print(response.statusMessage);
      _created = true;
      print(isCreated.toString() + 'iscreated :');
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      print(error);
    }
  }

  // uploadImages(String email, String password) async {
  //   _isLoading = true;
  //   _created = false;
  //   notifyListeners();

  //     // print(result);
  //     // print(result.headers);
  //     // print(response.statusCode);
  //     // print(result.statusMessage);
  //     _created = true;
  //     print(isCreated.toString() + 'iscreated :');
  //     notifyListeners();
  //   } catch (error) {
  //     print(error.message);
  //   }
  // }

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
    // _isLoggedIn = false;
    notifyListeners();
    try {
      Response response =
          await account.createSession(email: email, password: password);
      // return result.then(() {
      print(response.data);
      print(response.headers);
      print(response.statusCode);
      print(response.statusMessage);
      //  _isLoggedIn = true;
      //_user = await _getAccount();
      // notifyListeners();
      if (response.statusCode == 201 || response.statusCode == 200) {
        // String responseData = json.decode(response.);
        doneMsg = response.statusMessage;
        print('done msg condition' + doneMsg);

        isdone = true;

        // notifyListeners();
        _userId = response.data["\$id"];
        print(_userId);
        // _user = await _getAccount();
        //  print(_user);
        //print('$_user' + ' user from login method');
        _isLoading = false;
        _isLoggedIn = true;
        notifyListeners();
        return true;
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

  logout() async {
    try {
      Response res = await account.deleteSession(sessionId: 'current');
      print(res.statusCode);
      _isLoggedIn = false;
      _user = null;
      notifyListeners();
    } catch (e) {
      // _error = e.message;
      notifyListeners();
    }
  }

  void addImagePath(String path) {
    _imagesPath.add(path);
    print('imagePath');
    print(imagePath);
  }

  void addStatementPartA(String partAname, String partAlicense,
      String partAphone, String partAplate, String date) {
    _data["id"] = _userId;
    _data[StatementFields.partA_name] = partAname;
    _data[StatementFields.partA_license] = partAlicense;
    _data[StatementFields.partA_phone] = partAphone;
    _data[StatementFields.partA_plate] = partAplate;
    _data[StatementFields.date] = date;
  }

  void addStatementPartB(String partBname, String partBlicense,
      String partBphone, String partBplate, String status) {
    //data[StatementFields.id] = '1';
    _data[StatementFields.partb_name] = partBname;
    _data[StatementFields.partB_license] = partBlicense;
    _data[StatementFields.partB_phone] = partBphone;
    _data[StatementFields.partB_plate] = partBplate;
    _data[StatementFields.status] = status;
  }

  void addLocationDetails(
      String city, String locality, String firstStreet, String secondStreet) {
    _data[StatementFields.city] = city;
    _data[StatementFields.locality] = locality;
    _data[StatementFields.firstStreet] = firstStreet;
    _data[StatementFields.secondStreet] = secondStreet;
  }
//  Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data[StatementFields.id] = _userId;
//     data[StatementFields.partA_name] = _data[StatementFields.partA_name];
//     data[StatementFields.partA_license] = this.partAlicense;
//     data[StatementFields.partA_phone] = this.partAphone;
//     data[StatementFields.partA_plate] = this.partAplate;
//     data[StatementFields.date] = this.date;
//     data[StatementFields.partb_name] = this.partBname;
//     data[StatementFields.partB_license] = this.partBlicense;
//     data[StatementFields.partB_phone] = this.partBphone;
//     data[StatementFields.partB_plate] = this.partBplate;
//     data[StatementFields.status] = this.status;
//     data[StatementFields.city] = this.city;
//     data[StatementFields.locality] = this.locality;
//     data[StatementFields.firstStreet] = this.firstStreet;
//     data[StatementFields.secondStreet] = this.secondStreet;

//     return data;
//   }
  Future createDocument() async {
    try {
      _isLoading = true;
      print('data from create');
      print(_data);
      // var toDoc = Statement.toJson();
      var jsonVar = json.encode(_data);
      print(jsonVar + 'json var ');
      print(userId);
      _statments.add(_data);
      print(_statments);
      // Response result = await database.createDocument(
      //   collectionId: '$collectionID',
      //   data: {getData},
      //   read: ["user:$_userId"],
      //   write: ["user:$_userId"],
      // );
      // print(result.statusCode);
      // print(result.statusMessage);
      // print(result.data);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
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
// class StatementModel extends ConnectedModel {}

// class ConnectedModel extends MainModel {
//   // Function log;
//   // User authedUser;
//   // ConnectedModel(this.log);

// class UserModel extends ConnectedModel {
//   // User authedUser;
//   //Constants _const = Constants();

//   // var responser;
//   // final User _user;
