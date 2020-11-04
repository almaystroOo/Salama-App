import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../ScopedModel/main.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Map<String, dynamic> _locatinData = {
    'city': null,
    'locality': null,
    'firstStreet': null,
    'secondStreet': null,
    // 'Date': DateTime.now().toString()
    //'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'الخرطوم';
  /* @override
  Widget build(BuildContext context) {
    return Container();
  }*/
  // Widget _cityDropDown() {
  //   return DropdownButton<String>(
  //     hint: Text('State :'),
  //     value: dropdownValue,
  //     icon: Icon(Icons.arrow_downward),
  //     iconSize: 24,
  //     elevation: 16,
  //     style: TextStyle(color: Colors.deepPurple),
  //     underline: Container(
  //       height: 2,
  //       color: Colors.deepPurpleAccent,
  //     ),
  //     onChanged: (String newValue) {
  //       setState(() {
  //         dropdownValue = newValue;
  //       });
  //     },
  //     items: <String>['الخرطوم', 'بحري', 'أمدرمان'].map((String value) {
  //       return DropdownMenuItem<String>(value: value, child: Text(value));
  //     }).toList(),

  //     //onChanged: null
  //   );
  // }

  Widget _cityField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty || value.length < 5) {
          return 'Enter a valid city name';
        }
        return null;
      },
      onSaved: (value) {
        print('city =' + '$value');
        setState(() {
          _locatinData['city'] = value;
          print(_locatinData['city'] + 'city name');
        });
      },
      decoration: InputDecoration(
          //  icon: Icon(Icons.verified_user),
          labelText: 'city :',
          hintText: ' Enter city ',
          filled: true,
          fillColor: Colors.white24),
    );
  }

  Widget _localityField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter a valid locality name';
        }
        return null;
      },
      onSaved: (value) {
        print('locality' + '$value');
        setState(() {
          _locatinData['locality'] = value;
          //   print(_locatinData['Phone Number'] + 'Phone Number /Phone Number');
        });
      },
      decoration: InputDecoration(
          //   icon: Icon(Icons.verified_user),
          labelText: 'locality :',
          hintText: 'Enter accident locality ',
          filled: true,
          fillColor: Colors.white24),
    );
  }

  Widget _firstStreetField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter a valid first Street name';
        }
        return null;
      },
      onSaved: (value) {
        print('firstStreet' + '$value');
        setState(() {
          _locatinData['firstStreet'] = value;
          //   print(_locatinData['Phone Number'] + 'Phone Number /Phone Number');
        });
      },
      decoration: InputDecoration(
          //   icon: Icon(Icons.verified_user),
          labelText: 'first street  name :',
          hintText: 'Enter the street name ',
          filled: true,
          fillColor: Colors.white24),
    );
  }

  Widget _secondStreetField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty || value.length < 5) {
          return 'Enter a valid first street name ';
        }
        return null;
      },
      onSaved: (value) {
        print('firstStreet=' + '$value');
        setState(() {
          _locatinData['secondStreet'] = value;
          //   print(_locatinData['Car Number'] + 'Car Number /Car Number');
        });
      },
      decoration: InputDecoration(
          //   icon: Icon(Icons.verified_user),
          labelText: 'second street name :',
          hintText: 'Enter your the second street name ',
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
  //         _locatinData[' Date'] = value;
  //         //   print(_locatinData['Date'] + 'Date /Date');
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
  _nextButton(Function addLocationDetails, Function createDocument,
      dynamic getData) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    //  print('${_userData['email']}' + '${_userData['password']}');
    _formKey.currentState.save();
    addLocationDetails(
      _locatinData['city'],
      _locatinData['locality'],
      _locatinData['firstStreet'],
      _locatinData['secondStreet'],
    );
    print(getData);
    await createDocument();
    createDocument().then((dynamic succes) {
      Navigator.pushReplacementNamed(context, '/preCamera');
    });
    // Navigator.pushReplacementNamed(context, '/rptstatus');
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
          title: Text('Location Details'),
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
                                  _cityField(),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  _localityField(),
                                  _firstStreetField(),
                                  _secondStreetField(),
                                  // _cityDropDown(),
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
                            return model.isLoading
                                ? Center(child: CircularProgressIndicator())
                                : RaisedButton(
                                    splashColor: Colors.white,
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    child: Text('Next'),
                                    onPressed: () {
                                      print(model.getData);
                                      _nextButton(model.addLocationDetails,
                                          model.createDocument, model.getData);
                                      // Navigator.pushReplacementNamed(
                                      //     context, '/preCamera');
                                      // _nextButton(
                                      //     model.addStatementPartA, model.getData);

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
