import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_screen/dialogs/internet.dart';

import 'home.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  ConnectivityResult previous;

  @override
  void initState(){
    super.initState();
    try {
      InternetAddress.lookup('google.com').then((result){
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          // internet conn available
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
              Homepage(),
          ));
        }else{
          // no conn
          _showdialog();
        }
      }).catchError((error){
        // no conn
        _showdialog();
      });
    } on SocketException catch (_){
      // no internet
      _showdialog();
    }


    Connectivity().onConnectivityChanged.listen((ConnectivityResult connresult){
      if(connresult == ConnectivityResult.none){

      }else if(previous == ConnectivityResult.none){
        // internet conn
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
            Homepage(),
        ));
      }

      previous = connresult;
    });
  }


  void _showdialog(){
    showDialog(
      context: context,
      builder: (_) => LogoutOverlay(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/backimg.jpg'),fit: BoxFit.cover

          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:200),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/Lakshya_logo.png'
                      )
                    )
                  ),
                  ),
                Container(
                  width: 300,
                  height: 100,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/lakshya_word_logo.png'
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

