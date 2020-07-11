import 'package:flutter/material.dart';
import 'package:splash_screen/pages/home.dart';
import 'package:splash_screen/pages/loading.dart';



void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Homepage(),
    }
));