import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

//
import 'package:booking_place/src/widgets/background_header.dart';
import 'package:booking_place/src/widgets/categories.dart';
import 'package:booking_place/src/constants/theme.dart';
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter _character = SingingCharacter.lafayette;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Đi công tác'),
          leading: Radio(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Đi du lịch'),
          leading: Radio(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
class PPWidget extends StatefulWidget {
 PPWidget({Key key}) : super(key: key);

  @override
  _PPWidgetState createState() => _PPWidgetState();
}

class _PPWidgetState extends State<PPWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    Text(
      'Số lượng người ',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
    return DropdownButton<String>(
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
    );
  }
}

class BodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(fontSize: 20,color: Colors.black),
              decoration: InputDecoration(labelText: "Nơi bạn muốn đến",
            icon: Icon(Icons.local_airport),
            labelStyle: TextStyle(color: Color(0xff888888),fontSize: 20)
            ),
            ),

            Stack(
             children: <Widget>[
                TextField(
               style: TextStyle(fontSize: 20,color: Colors.black),
               decoration: InputDecoration(labelText: "Ngày nhận trả phòng",
               labelStyle: TextStyle(color: Color(0xff888888),fontSize: 20)
            ),
            ),
            ]),
            ],
        ),
    );
  }
}

