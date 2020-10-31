import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
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
