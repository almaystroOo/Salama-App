import 'package:flutter/material.dart';
import 'package:meals_app/ScopedModel/main.dart';
import 'package:meals_app/screens/SplashScreen.dart';
import './screens/Home_page.dart';
import './screens/CameraPage.dart';
import './screens/LocationPage.dart';
import './screens/LoginPage.dart';
import './screens/PartAPage.dart';
import './screens/PartBPage.dart';
import './screens/ReportStatusPage.dart';
import './screens/ReviewPage.dart';
import 'package:scoped_model/scoped_model.dart';
import './screens/SignUp.dart';
import 'dart:async';
import 'dart:io';
import './screens/preCamera.dart';
import 'package:camera/camera.dart';
//import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import './screens/submitScreen.dart';
import './screens/cameraOne.dart';
import './screens/cameraFour.dart';
import './screens/cameraThree.dart';
import './screens/cameraTwo.dart ';
import './screens/imageViewer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

// Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MyApp(
    firstCamera: firstCamera,
  ));
}

class MyApp extends StatelessWidget {
  final firstCamera;

  const MyApp({Key key, this.firstCamera}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
          title: 'Salama App',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              color: Colors.green,
              actionsIconTheme: IconThemeData(color: Colors.white),
            ),
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // initialRoute: '/home',
          routes: {
            '/home': (context) => HomePage(),
            '/rptstatus': (context) => ReportStatusPage(),
            '/login': (context) => LoginPage(),
            '/partA': (context) => PartAPage(),
            '/partB': (context) => PartBPage(),
            '/location': (context) => LocationPage(),
            '/Camera': (context) => TakePictureScreen(camera: firstCamera),
            '/cameraOne': (context) =>
                TakeOnePictureScreen(camera: firstCamera),
            '/cameraTwo': (context) =>
                TakeTwoPictureScreen(camera: firstCamera),
            '/cameraThree': (context) =>
                TakeThirdPictureScreen(camera: firstCamera),
            '/cameraFour': (context) =>
                TakeFourthPictureScreen(camera: firstCamera),
            '/review': (context) => ReviewPage(),
            '/signUp': (context) => SignUpPage(),
            '/preCamera': (context) => PreCamera(),
            '/submit': (context) => SubmitPage(),
            '/imageViewer': (context) => ImageViewer()
          },
          home: ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
            //  return LocationPage();
            return SplashScreen(model.init, model.isLoggedIn);
          }),
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return HomePage();
              },
            );
          }),
    );
  }
}
