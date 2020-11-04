//import 'dart:html';
import 'dart:async';
import 'dart:io';
import 'package:scoped_model/scoped_model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:meals_app/ScopedModel/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ReportStatusPage extends StatefulWidget {
  @override
  _ReportStatusPageState createState() => _ReportStatusPageState();
}

class _ReportStatusPageState extends State<ReportStatusPage> {
  DecorationImage _backgroundDecoration() {
    return DecorationImage(
        image: AssetImage('assets/loginback.png'), fit: BoxFit.fill);
  }

  Widget _buildCards(List<dynamic> statments, MainModel model) {
    Widget productCard;
    if (statments.length > 0) {
      productCard = ListView.builder(
        itemCount: statments.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            color: Colors.grey,
            child: ListTile(
              leading: Text('${model.statments[index]["id"]}'),
              title: Text('Statement Puplisher : ' +
                  '${model.statments[index]["parta_name"]}'),
              subtitle:
                  Text('Created on :' + '${model.statments[index]["Date"]}'),
              trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/imageViewer');
                  }),
            ),
          );
          //return Text('${model.statments[index]["city"]}');
        },
      );
    } else {
      productCard = Center(
        child: Text(
          'There is no statements yet',
          style: TextStyle(
              //  fontStyle: FontStyle.normal,
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      );
    }
    return productCard;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.9;
    double c_height = MediaQuery.of(context).size.height * 0.9;
    return Scaffold(
        appBar: AppBar(
          title: Text('Accidents Statement '),
          centerTitle: true,
          leading: ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  print(model.statments);
                  Navigator.pushReplacementNamed(context, '/home');
                });
          }),
        ),
        // title: Text('Part A Details'),
        //  centerTitle: true,
        // actions: [
        // ScopedModelDescendant<MainModel>(
        //     builder: (BuildContext context, Widget child, MainModel model) {
        //   return IconButton(
        //       icon: Icon(Icons.exit_to_app),
        //       onPressed: () async {
        //         await model.logout();
        //         Navigator.pushReplacementNamed(context, '/login');
        //       });
        //   })
        // ],

        backgroundColor: Colors.white,
        body: ListView(shrinkWrap: true, children: [
          Container(
            decoration: BoxDecoration(image: _backgroundDecoration()),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: c_width,
              height: c_height,
              child: ScopedModelDescendant<MainModel>(builder:
                  (BuildContext context, Widget child, MainModel model) {
                return _buildCards(model.statments, model);
              }),
              //  Center(
              //   child: Column(
              //    // mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       // Text(
              //       //   'You have no any submited statment yet ! ',

              //       // ),

              //       // }),
              //       // Text(
              //       //   ' will be proccesed soon  !',
              //       //   style: TextStyle(
              //       //       //  fontStyle: FontStyle.normal,
              //       //       color: Colors.black,
              //       //       fontSize: 15,
              //       //       fontWeight: FontWeight.bold),
              //       // ),
              //       SizedBox(
              //         height: 20,
              //       ),
              //       RaisedButton(
              //         textColor: Colors.white,
              //         color: Colors.green,
              //         child: Text('Finish'),
              //         onPressed: () {
              //           Navigator.pushReplacementNamed(context, '/home');
              //           // Navigator.push(
              //           //   context,
              //           //   MaterialPageRoute(
              //           //       builder: (context) =>
              //           //           HomePage(/*dateData: formattedDate*/)),
              //           // );
              //         },
              //       )
              //       // new Text(
              //       //     "Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ",
              //       //     textAlign: TextAlign.left),
              //       // new Text(
              //       //     "Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2",
              //       //     textAlign: TextAlign.left),
              //     ],
              //   ),
              // ),
            ),
          ),
        ]));
  }
}
//     return Container();
//   }
// }
