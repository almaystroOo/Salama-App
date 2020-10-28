import 'package:flutter/material.dart';
import 'package:meals_app/ScopedModel/main.dart';
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

//import '';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
          title: 'Flutter Demo',
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
            '/Camera': (context) => CameraPage(),
            '/review': (context) => ReviewPage(),
            '/sigUp': (context) => SignUpPage()
          },
          home: ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
            model.init();
            return model.isLoggedIn ? HomePage() : SignUpPage();
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
