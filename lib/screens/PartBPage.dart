import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../ScopedModel/main.dart';

class PartBPage extends StatefulWidget {
  @override
  _PartBPageState createState() => _PartBPageState();
}

class _PartBPageState extends State<PartBPage> {
  Map<String, dynamic> _partBData = {
    'Name': null,
    'PhoneNumber': null,
    'LicenseNumber': null,
    'CarNumber': null,
    'status': '1',
    // 'parta_name': null,
    // 'parta_license_number': null,
    // 'parta_phone_number': null,
    // 'parta_car_plate': null,
    // 'Date': DateTime.now().toString(),
    // 'Partb_name': null,
    // 'partb_phone_number': null,
    // 'partb_license_number': null,
    // 'partb_car_plate': null,
    // 'accident_status': true
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
          _partBData['Name'] = value;
          print(_partBData['Name'] + 'Namedate /Name');
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
          _partBData['PhoneNumber'] = value;
          //   print(_partBData['Phone Number'] + 'Phone Number /Phone Number');
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
          _partBData['LicenseNumber'] = value;
          //   print(_partBData['Phone Number'] + 'Phone Number /Phone Number');
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
          _partBData['CarNumber'] = value;
          //   print(_partBData['Car Number'] + 'Car Number /Car Number');
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
  //         _partBData[' Date'] = value;
  //         //   print(_partBData['Date'] + 'Date /Date');
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
    addStatementPartA(
        _partBData['Name'],
        _partBData['LicenseNumber'],
        _partBData['PhoneNumber'],
        _partBData['CarNumber'],
        _partBData['status']);
    print(getData);
    Navigator.pushReplacementNamed(context, '/location');
  }

  DecorationImage _backgroundDecoration() {
    return DecorationImage(
        image: AssetImage('assets/loginback.png'), fit: BoxFit.fill);
  }

  @override
  void initState() {
    ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      print(model.getData);
    });
    super.initState();
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
          title: Text('Part B Details'),
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
                                print(model.getData);
                                _nextButton(
                                    model.addStatementPartB, model.getData);
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
