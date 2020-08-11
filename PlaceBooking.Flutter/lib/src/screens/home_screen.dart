import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

//
import 'package:booking_place/src/widgets/background_header.dart';
import 'package:booking_place/src/widgets/categories.dart';
import 'package:booking_place/src/constants/theme.dart';

import 'body_screen.dart';

//Ctrl + Alt + L
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget _buildHeader(BuildContext context) {
    String dropdownValue = '1';
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
          new TextField(
            style: TextStyle(fontSize: 20,color: Colors.black),
            decoration: InputDecoration(labelText: "Nơi bạn muốn đến",
                icon: Icon(Icons.local_airport),
                labelStyle: TextStyle(color: Colors.black,fontSize: 20)
            ),
          ),
          new  Text(
             'Số lượng người ',
             textAlign: TextAlign.center,
             overflow: TextOverflow.ellipsis,
             style: TextStyle(fontWeight: FontWeight.bold),
          ),
           DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
              setState(() {
              dropdownValue = newValue;
              });
              },
              items: <String>['1', '2', '3', '4','5','6','7','8','9','10','10 - 20']
                  .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
              );
              }).toList(),
        ),
          Stack(
              children: <Widget>[
              TextField(
              style: TextStyle(fontSize: 20,color: Colors.black),
              decoration: InputDecoration(labelText: "Ngày nhận trả phòng",
              icon: Icon(Icons.date_range),
              labelStyle: TextStyle(color: Colors.black,fontSize: 20)
              ),
          ),
          ]),
          MyStatefulWidget(),
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
