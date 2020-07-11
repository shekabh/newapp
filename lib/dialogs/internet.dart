import 'package:flutter/material.dart';

class LogoutOverlay extends StatefulWidget {
  @override
  _LogoutOverlayState createState() => _LogoutOverlayState();
}

class _LogoutOverlayState extends State<LogoutOverlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.7,
            child: Container(
              height: 200,
              color: Colors.grey[700],
            ),
          )
        ],
      ),
    );
  }
}
