import 'package:flutter/material.dart';

class PreCamera extends StatefulWidget {
  @override
  _PreCameraState createState() => _PreCameraState();
}

class _PreCameraState extends State<PreCamera> {
  DecorationImage _backgroundDecoration() {
    return DecorationImage(
        image: AssetImage('assets/loginback.png'), fit: BoxFit.fill);
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text('Accidents Statement '),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/location');
            }),
        // title: Text('Part A Details'),
        //  centerTitle: true,
        // actions: [
        //   ScopedModelDescendant<MainModel>(
        //       builder: (BuildContext context, Widget child, MainModel model) {
        //     return IconButton(
        //         icon: Icon(Icons.exit_to_app),
        //         onPressed: () async {
        //           await model.logout();
        //           Navigator.pushReplacementNamed(context, '/login');
        //         });
        //   })
        // ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(image: _backgroundDecoration()),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: c_width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  ' Take a five pictures with your camera  ',
                  style: TextStyle(
                      //  fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ' which covers all accident parts !',
                  style: TextStyle(
                      //  fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text('Next'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Camera');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           HomePage(/*dateData: formattedDate*/)),
                    // );
                  },
                )
                // new Text(
                //     "Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ",
                //     textAlign: TextAlign.left),
                // new Text(
                //     "Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2",
                //     textAlign: TextAlign.left),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//     Container(
//         //  height: MediaQuery.of(context).size.height / 2,
//         color: Colors.green,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Image.asset(
//               //   "assets/logo.png",
//               //   height: 100,
//               // ),
//               SizedBox(
//                 height: 35,
//               ),
//               // SpinKitFadingCircle(
//               //   //controller: AnimationController(vsync: null),
//               //   duration: Duration(seconds: 600),
//               //   color: Colors.white,
//               // ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 ' Take five picture with your camera which covers all accident parts ! ',
//                 style: TextStyle(
//                   fontStyle: FontStyle.normal,
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               RaisedButton(
//                 textColor: Colors.white,
//                 color: Colors.blue,
//                 child: Text('Next'),
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, '/camera');
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //       builder: (context) =>
//                   //           HomePage(/*dateData: formattedDate*/)),
//                   // );
//                 },
//               )
//             ],
//           ),
//         ));
//   }
// }
