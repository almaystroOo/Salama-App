import 'package:appwrite/appwrite.dart';

void main() {
  // Init SDK
  Client client = Client();
  Account account = Account(client);

  client
          .setEndpoint('http://192.168.1.76/v1') // Your API Endpoint
          .setProject('5f9018d83a0a0') // Your project ID
      ;

  Future result = account.create(
    email: 'ahmed@gmail.com',
    password: 'pass',
  );

  result.then((response) {
    print(response);
    //response = responser;
  }).catchError((error) {
    print(error.response);
  });
}
// authedUser = User(email: email, password: password);
// print(authedUser);
