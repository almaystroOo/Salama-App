// import 'dart:html';
import 'package:meals_app/ScopedModel/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      height: 75,
      child: Image.asset('assets/logo.png'),
    );
  }

  Widget _userEmailField() {
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

  Widget _userNameField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty)
        //  ||
        //     !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        //         .hasMatch(value))
        {
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
          labelText: 'User name :',
          hintText: 'Enter your user name ',
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

  void _singUp(Function createAccount, bool isCreated) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print('${_userData['email']}' + '${_userData['password']}');
    await createAccount(_userData['email'], _userData['password'])
        .then((dynamic done) {
      print(isCreated);
      // if (isCreated) {
      Navigator.pushReplacementNamed(context, '/login');
    });

    // }

    //IMPLEMENT LOGIN FUCTION AND PUSH PAGE
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final targetWidth = width > 550.0 ? 500.0 : width * 0.98;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.green
          //image: _backgroundDecoration(),
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
                            _userNameField(),
                            SizedBox(
                              height: 15.0,
                            ),
                            _userEmailField(),
                            SizedBox(
                              height: 15.0,
                            ),
                            _passwordField(),
                            SizedBox(
                              height: 15.0,
                            ),
                          ],
                        )),
                    ScopedModelDescendant<MainModel>(builder:
                        (BuildContext context, Widget child, MainModel model) {
                      return RaisedButton(
                        onPressed: () =>
                            _singUp(model.createAccount, model.isCreated),
                        child: Text('SignUp'),
                        color: Colors.white24,
                      );
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text(
                          'login',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ))
                  ],
                ))),
      ),
    ));
  }
}
