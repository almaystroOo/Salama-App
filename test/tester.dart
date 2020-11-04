import 'dart:io';
import 'package:appwrite/appwrite.dart';

void main() {
  // Init SDK
  Client client = Client();
  Storage storage = Storage(client);

  client
          .setEndpoint('https://[HOSTNAME_OR_IP]/v1') // Your API Endpoint
          .setProject('5df5acd0d48c2') // Your project ID
      ;

  Future result = storage.createFile(
    file:
        await MultipartFile.fromFile('./path-to-files/image.jpg', 'image.jpg'),
    read: [],
    write: [],
  );

  result.then((response) {
    print(response);
  }).catchError((error) {
    print(error.response);
  });
}
