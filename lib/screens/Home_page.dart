import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../ScopedModel/main.dart';
import './LoginPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Widget homePage() {
  return Container(child: Center(child: Text('welcome to your app')));
}

class _HomePageState extends State<HomePage> {
  DecorationImage _backgroundDecoration() {
    return DecorationImage(
        image: AssetImage('assets/loginback.png'), fit: BoxFit.fill);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accidents Statement '),
        centerTitle: true,
        actions: [
          ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () async {
                  await model.logout();
                  Navigator.pushReplacementNamed(context, '/login');
                });
          })
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(image: _backgroundDecoration()),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/partA');
                },
                child: Text('New Statement '),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Query Statement '),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
    // ScopedModelDescendant<MainModel>(
    //     builder: (BuildContext context, Widget child, MainModel model) {
    //   // model.init();
    //   return model.isLoggedIn ? homePage() : LoginPage();
    // });
  }
}
