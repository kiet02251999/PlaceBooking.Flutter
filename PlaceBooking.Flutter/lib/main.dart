import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//
import 'package:booking_place/src/providers/category_provider.dart';
import 'package:booking_place/src/screens/home_screen.dart';
import 'package:booking_place/src/screens/splash_screen.dart';
import 'package:booking_place/src/providers/account_provider.dart';


void main() {
  // add this, and it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();

  // rest of your app code
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<bool> _initApp(BuildContext context) async {
    return await Provider.of<AccountProvider>(context, listen: false).loading();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
      ],
      child: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            return FutureBuilder(
              future: _initApp(context),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                var loading = Provider.of<AccountProvider>(context);
                if(snapshot.hasData){
                  return MaterialApp(
                      title: 'Booking Place App',
                      debugShowCheckedModeBanner: false,
                      theme: ThemeData(
                        primaryColor: Color.fromRGBO(51, 176, 134, 1),
                        bottomAppBarColor: Color.fromRGBO(171, 171, 171, 1),
                        backgroundColor: Color.fromRGBO(218, 218, 218, 0.5),
                        canvasColor: Colors.white,
                      ),
                      home: loading.isLoading ? SplashScreen() : HomeScreen());
                } else {
                  return SplashScreen();
                }
              },
            );
          }),
    );
  }
}

