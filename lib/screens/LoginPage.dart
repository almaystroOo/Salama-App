// import 'dart:html';
import 'package:meals_app/ScopedModel/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic> _userData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DecorationImage _backgroundDecoration() {
    return DecorationImage(
        image: AssetImage('assets/loginback.png'), fit: BoxFit.fill);
  }

  Widget _logoImage() {
    return Container(
      height: 150,
      child: Image.asset('assets/logo.png'),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Enter A valid Username or Licence number ';
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

  void _singIn(Function login) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    print('${_userData['email']}' + '${_userData['password']}');
    login(_userData['email'], _userData['password']);
    _formKey.currentState.save();
    Navigator.pushReplacementNamed(context, '/home');

    //IMPLEMENT LOGIN FUCTION AND PUSH PAGE
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final targetWidth = width > 550.0 ? 500.0 : width * 0.98;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: _backgroundDecoration(),
      ),
      child: Center(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _logoImage(),
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
                    ScopedModelDescendant<MainModel>(builder:
                        (BuildContext context, Widget child, MainModel model) {
                      return RaisedButton(
                        onPressed: () => _singIn(model.logIn),
                        child: Text('Create'),
                        color: Colors.white24,
                      );
                    })
                  ],
                ))),
      ),
    ));
  }
}
