import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//
import 'package:booking_place/src/providers/category_provider.dart';
import 'package:booking_place/src/screens/home_screen.dart';
import 'package:booking_place/src/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    ///
    /// Force the layout to Portrait mode
    ///
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            return FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return MaterialApp(
                    title: 'Booking Place App',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primaryColor: Color.fromRGBO(51, 176, 134, 1),
                      bottomAppBarColor: Color.fromRGBO(171, 171, 171, 1),
                      backgroundColor: Color.fromRGBO(218, 218, 218, 0.5),
                      canvasColor: Colors.white,
                    ),
                    home: HomeScreen());
              },
            );
          }),
    );
  }
}
