import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //  height: MediaQuery.of(context).size.height / 2,
          color: Colors.green,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  height: 100,
                ),
                SizedBox(
                  height: 35,
                ),
                SpinKitFadingCircle(
                  duration: Duration(seconds: 600),
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Salama App, your way to a quick statment reporting ',
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          )),
    );
  }
}
