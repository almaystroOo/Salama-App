// import 'dart:html';
import 'package:meals_app/ScopedModel/main.dart';
import 'package:meals_app/screens/Home_page.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../Models/userModel.dart';

class LoginPage extends StatefulWidget {
  //final Function login;

  //const LoginPage({Key key, this.login}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic> _userData = {
    'email': null,
    'password': null,
    // 'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DecorationImage _backgroundDecoration() {
    return DecorationImage(
        image: AssetImage('assets/loginback.png'), fit: BoxFit.fill);
  }

  Widget _logoImage() {
    return Container(
      height: 75,
      child: Image.asset('assets/logo.png'),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Enter A valid Username  ';
        }
        return null;
      },
      onSaved: (value) {
        print('usernamevalue =' + '$value');
        setState(() {
          _userData['email'] = value;
          print(_userData['email'] + ' userdate /email');
        });
      },
      decoration: InputDecoration(
          icon: Icon(Icons.verified_user),
          labelText: 'Email :',
          hintText: 'Enter your email ',
          filled: true,
          fillColor: Colors.white24),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value.isEmpty || value.length <= 6) {
          return 'passsword required and not to be less than six characters';
        }
        return null;
      },
      onSaved: (value) {
        setState(() {
          _userData['password'] = value;
        });
      },
      decoration: InputDecoration(
        icon: Icon(Icons.verified_user),
        labelText: 'Password :',
        filled: true,
        fillColor: Colors.white24,
        hintText: 'Enter your password here ',
      ),
    );
  }

  void _singIn(
    Function login,
    bool isLoggedIn,
    bool isLoading,
    String userId,
    // String userId,
    String doneMsg,
  ) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    //  print('${_userData['email']}' + '${_userData['password']}');
    _formKey.currentState.save();
    print(isLoggedIn);
    print('print first is loading ' + '$isLoading');
    login(_userData['email'], _userData['password']).then((dynamic done) {
      print('$userId' + 'from login page :');
      Navigator.pushReplacementNamed(context, '/home');
    });
    // print(login);
    // print('second is logged :' + '"$isLoggedIn');
    // //print('User id :' + userId);
    // // print(isDone);
    // // if (isLoggedIn) {
    // // print('done msg in login[page]: ' + doneMsg);
    // Navigator.pushReplacementNamed(context, '/home');
    // }
    // else {
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text('doneMsg')));
    //   print('notdone msg : ' + errMsg);
    //   }

    // print('not success');
    //});
    // .then((bool success) {

    //print('err msg : ' + errMsg);
    // if (success) {
    //   Scaffold.of(context).showSnackBar(SnackBar(content: Text(doneMsg)));
    //   Navigator.pushReplacementNamed(context, '/home');
    // } else {
    //   Scaffold.of(context).showSnackBar(SnackBar(content: Text(errMsg)));
    // }}
    // });
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return HomePage();
    // }));

    //IMPLEMENT LOGIN FUCTION AND PUSH PAGE
  }

  Widget _creatAccountButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? Center(child: CircularProgressIndicator())
            : RaisedButton(
                splashColor: Colors.white,
                // color: Theme.of(context).accentColor,
                onPressed: () {
                  print('first is logedIn ' + model.isLoggedIn.toString());
                  //print(model.isDone);
                  _singIn(model.logIn, model.isLoading, model.isLoggedIn,
                      model.userId, model.doneMssg);
                  print(model.isLoggedIn.toString());
                },

                child: Text('login'),
                color: Colors.white24,
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final targetWidth = width > 550.0 ? 500.0 : width * 0.98;
    return Scaffold(
        body: Container(
      // color: Colors.green,
      decoration: BoxDecoration(
        color: Colors.green,
        // image: _backgroundDecoration(),
      ),
      child: Center(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _logoImage(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: targetWidth,
                        child: Column(
                          children: [
                            _usernameField(),
                            SizedBox(
                              height: 5.0,
                            ),
                            _passwordField(),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    _creatAccountButton(),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/signUp');
                        },
                        child: Text(
                          'create account ',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ))
                    // ScopedModelDescendant<MainModel>(builder:
                    //     (BuildContext context, Widget child, MainModel model) {
                    //   return RaisedButton();
                    // })
                  ],
                ))),
      ),
    ));
  }
}
