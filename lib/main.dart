
import 'package:flutter/material.dart';

//import './splash_screen.dart';
import './home.dart';
import './make_video.dart';
import './profile.dart';
import './video_feed.dart';


import 'dart:async';
import 'package:camera/camera.dart';


List<CameraDescription> cameras; 

Future<void> main() async {
  cameras = await availableCameras();
  runApp(Life2Film());
}

//void main() => runApp(Life2Film());

class Life2Film extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Life2FilmState();
  }
}

class Life2FilmState extends State<Life2Film> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    CameraApp(),
    ProfilePage(),
  ];

  // This is the root of Life2Film app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life2Film',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Life2Film"),
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle), title: Text('Make')),
            BottomNavigationBarItem(
                icon: Icon(Icons.portrait), title: Text('Profile')),
          ],
        ),
      ),
    );
  }
}






















// import 'package:flutter/material.dart';

// void main() => runApp(Life2Film());

// class Life2Film extends StatefulWidget {
//   @override
//     State<StatefulWidget> createState() {
//       return Life2FilmState();
//     }

  
// }

// class Life2FilmState extends State<Life2Film> {

//   // This is the root of Life2Film app
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life2Film',
//       theme: ThemeData.dark(),
//       home: Scaffold(
//         appBar: AppBar(title: Text("data"),),
//       ),
//     );
//   }
// }




































































// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';


// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return new MyAppState();
//   }
// }

// class MyAppState extends State<MyApp> {
//   var _isLoading = true;

//   _fetchData() async {
//     print("Attempting to fetch data from network");

//     final url = "https://vue.life2film.com/";
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       print(response.body);

//       final map = json.decode(response.body);
//       final videosJson = map["videos"];
//       videosJson.forEach((video) {
//         print(video["name"]);

//       });

//       print(map["videos"]);
//     }
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text("life2film"),
//           actions: <Widget>[
//             new IconButton(
//               icon: new Icon(Icons.refresh),
//               onPressed: () {
//                 print("Reloading...");
//                 setState(() {
//                   _isLoading = false;
//                 });
//                 _fetchData();


//               },
//             )
//           ],
//         ),
//         body: new Center(
//           child: _isLoading
//               ? new CircularProgressIndicator()
//               : new Text("AI-powered movie creator"),
//           //child: new Text("AI-powered movie creator. Finished loading..."),
//         ),
//       ),
//     );
//   }
// }

/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'life2film',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'life2film'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
