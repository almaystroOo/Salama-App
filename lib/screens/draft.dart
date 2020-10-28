import 'package:flutter/material.dart';
import 'package:meals_app/ScopedModel/main.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Home_page.dart';

class PartAPage extends StatefulWidget {
  @override
  _PartAPageState createState() => _PartAPageState();
}

class _PartAPageState extends State<PartAPage> {
  Map<String, dynamic> _PartAData = {
    'Name': null,
    'PhoneNumber': null,
    'LicenseNumber': null,
    'CarNumber': null,
    'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /* @override
  Widget build(BuildContext context) {
    return Container();
  }*/

  Widget _NameField() {
    return TextFormField(
      validator: (value) {
        /* if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Enter  name';
        }
        return null;*/
      },
      onSaved: (value) {
        print('Name =' + '$value');
        setState(() {
          _PartAData['Name'] = value;
          print(_PartAData['Name'] + 'Namedate /Name');
        });
      },
      decoration: InputDecoration(
          //  icon: Icon(Icons.verified_user),
          labelText: 'Name :',
          hintText: 'Enter your Name ',
          filled: true,
          fillColor: Colors.white24),
    );
  }

  Widget _PhoneNumberField() {
    return TextFormField(
      validator: (value) {
        /*  if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Enter  Phone Number';
        }
        return null;*/
      },
      onSaved: (value) {
        print('Phone Number =' + '$value');
        setState(() {
          _PartAData['Phone Number'] = value;
          //   print(_PartAData['Phone Number'] + 'Phone Number /Phone Number');
        });
      },
      decoration: InputDecoration(
          //   icon: Icon(Icons.verified_user),
          labelText: 'Phone Number :',
          hintText: 'Enter your Phone Number ',
          filled: true,
          fillColor: Colors.white24),
    );
  }

  Widget _LicenseNumberField() {
    return TextFormField(
      validator: (value) {
        /*  if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Enter  License Number';
        }
        return null;*/
      },
      onSaved: (value) {
        print('License Number =' + '$value');
        setState(() {
          _PartAData['License Number'] = value;
          //   print(_PartAData['Phone Number'] + 'Phone Number /Phone Number');
        });
      },
      decoration: InputDecoration(
          //   icon: Icon(Icons.verified_user),
          labelText: 'License Number :',
          hintText: 'Enter your License Number ',
          filled: true,
          fillColor: Colors.white24),
    );
  }

  Widget _CarNumberField() {
    return TextFormField(
      validator: (value) {
        /*  if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Enter  Car Number';
        }
       return null;*/
      },
      onSaved: (value) {
        print('Car Number =' + '$value');
        setState(() {
          _PartAData['Car Number'] = value;
          //   print(_PartAData['Car Number'] + 'Car Number /Car Number');
        });
      },
      decoration: InputDecoration(
          //   icon: Icon(Icons.verified_user),
          labelText: 'Car Number :',
          hintText: 'Enter your Car Number ',
          filled: true,
          fillColor: Colors.white24),
    );
  }

  Widget _DateField() {
    return TextFormField(
      validator: (value) {
        /*  if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Enter  Car Number';
        }
       return null;*/
      },
      onSaved: (value) {
        print('Date  =' + '$value');
        setState(() {
          _PartAData[' Date'] = value;
          //   print(_PartAData['Date'] + 'Date /Date');
        });
      },
      decoration: InputDecoration(
          //   icon: Icon(Icons.verified_user),
          labelText: ' Date :',
          hintText: 'Enter Date ',
          filled: true,
          fillColor: Colors.white24),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final targetWidth = width > 550.0 ? 500.0 : width * 0.98;
    return Scaffold(
      body: Container(
          child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                    width: targetWidth,
                    child: Column(
                      children: [
                        _NameField(),
                        SizedBox(
                          height: 5.0,
                        ),
                        _PhoneNumberField(),
                        _LicenseNumberField(),
                        _CarNumberField(),
                      ],
                    )),
                ScopedModelDescendant<MainModel>(builder:
                    (BuildContext context, Widget child, MainModel model) {
                  /* return RaisedButton(
                        onPressed: () => _singIn(model.logIn),
                        child: Text('Next'),
                        color: Colors.white24,
                      );*/
                  return RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Next'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePage(/*dateData: formattedDate*/)),
                      );
                    },
                  );
                })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
