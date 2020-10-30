import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../ScopedModel/main.dart';

class PartAPage extends StatefulWidget {
  @override
  _PartAPageState createState() => _PartAPageState();
}

class _PartAPageState extends State<PartAPage> {
  Map<String, dynamic> _partAData = {
    'Name': null,
    'PhoneNumber': null,
    'LicenseNumber': null,
    'CarNumber': null,
    'Date': DateTime.now().toString()
    //'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /* @override
  Widget build(BuildContext context) {
    return Container();
  }*/

  Widget _nameField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty || value.length < 5) {
          return 'Enter a valid full name';
        }
        return null;
      },
      onSaved: (value) {
        print('Name =' + '$value');
        setState(() {
          _partAData['Name'] = value;
          print(_partAData['Name'] + 'Namedate /Name');
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

  Widget _phoneNumberField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty || value.length < 9) {
          return 'Enter a valid Phone Number';
        }
        return null;
      },
      onSaved: (value) {
        print('Phone Number =' + '$value');
        setState(() {
          _partAData['PhoneNumber'] = value;
          //   print(_partAData['Phone Number'] + 'Phone Number /Phone Number');
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

  Widget _licenseNumberField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty || value.length < 5) {
          return 'Enter a valid license Number';
        }
        return null;
      },
      onSaved: (value) {
        print('License Number =' + '$value');
        setState(() {
          _partAData['LicenseNumber'] = value;
          //   print(_partAData['Phone Number'] + 'Phone Number /Phone Number');
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

  Widget _carNumberField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty || value.length < 5) {
          return 'Enter a valid Car Number';
        }
        return null;
      },
      onSaved: (value) {
        print('Car Number =' + '$value');
        setState(() {
          _partAData['CarNumber'] = value;
          //   print(_partAData['Car Number'] + 'Car Number /Car Number');
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

  // Widget _DateField() {
  //   return TextFormField(
  //     validator: (value) {
  //       /*  if (value.isEmpty ||
  //           !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
  //               .hasMatch(value)) {
  //         return 'Enter  Car Number';
  //       }
  //      return null;*/
  //     },
  //     onSaved: (value) {
  //       print('Date  =' + '$value');
  //       setState(() {
  //         _partAData[' Date'] = value;
  //         //   print(_partAData['Date'] + 'Date /Date');
  //       });
  //     },
  //     decoration: InputDecoration(
  //         //   icon: Icon(Icons.verified_user),
  //         labelText: ' Date :',
  //         hintText: 'Enter Date ',
  //         filled: true,
  //         fillColor: Colors.white24),
  //   );
  // }
  _nextButton(Function addStatementPartA, dynamic getData) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    //  print('${_userData['email']}' + '${_userData['password']}');
    _formKey.currentState.save();
    addStatementPartA(_partAData['Name'], _partAData['LicenseNumber'],
        _partAData['PhoneNumber'], _partAData['CarNumber'], _partAData['Date']);
    print(getData);
    Navigator.pushReplacementNamed(context, '/partB');
  }

  DecorationImage _backgroundDecoration() {
    return DecorationImage(
        image: AssetImage('assets/loginback.png'), fit: BoxFit.fill);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final targetWidth = width > 550.0 ? 500.0 : width * 0.90;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              }),
          title: Text('Part A Details'),
          centerTitle: true,

          actions: [],
          //actions: [IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {})],
        ),
        backgroundColor: Colors.white,
        body: Container(
            decoration: BoxDecoration(image: _backgroundDecoration()),
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                              width: targetWidth,
                              child: Column(
                                children: [
                                  _nameField(),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  _phoneNumberField(),
                                  _licenseNumberField(),
                                  _carNumberField(),
                                ],
                              )),
                          ScopedModelDescendant<MainModel>(builder:
                              (BuildContext context, Widget child,
                                  MainModel model) {
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
                                _nextButton(
                                    model.addStatementPartA, model.getData);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           HomePage(/*dateData: formattedDate*/)),
                                // );
                              },
                            );
                          })

                          // RaisedButton(
                          //   color: Colors.green,
                          //   onPressed: () {
                          //     Navigator.pushReplacementNamed(context, '/partA');
                          //   },
                          //   child: Text('New Statement '),
                          // ),
                          // RaisedButton(
                          //   onPressed: () {},
                          //   child: Text('Query Statement '),
                          //   color: Colors.green,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}
