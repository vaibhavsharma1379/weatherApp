import 'package:flutter/material.dart';

const kButtonTextStyle =
    TextStyle(fontSize: 30, fontFamily: 'Spartan MB', color: Colors.white);
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);
const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);
const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kTextFieldStyle = InputDecoration(
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none),
);
