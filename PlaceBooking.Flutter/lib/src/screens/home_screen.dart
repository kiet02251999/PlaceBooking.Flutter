import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

//
import 'package:booking_place/src/widgets/background_header.dart';
import 'package:booking_place/src/widgets/categories.dart';
import 'package:booking_place/src/constants/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildHeader(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Image.asset(
              "assets/images/logo.png",
              width: 70,
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: 35, horizontal: AppTheme.contentHorizontalPadding),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 61,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                borderRadius: BorderRadius.circular(60),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Search for places',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(51, 176, 134, 1),
          bottomAppBarColor: Color.fromRGBO(171, 171, 171, 1),
          backgroundColor: Color.fromRGBO(218, 218, 218, 0.5),
          canvasColor: Colors.white),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BackgroundHeaderBox(
                child: Column(
                  children: <Widget>[
                    _buildHeader(context),
                    //FeaturedFolkList(),
                  ],
                ),
              ),
              CategoriesList(),
            ],
          ),
        ),
//      bottomNavigationBar: BottomNavigation(
//       // currentPage: AppRouteName.HomeScreen,
//      ),
      ),
    );
  }
}
