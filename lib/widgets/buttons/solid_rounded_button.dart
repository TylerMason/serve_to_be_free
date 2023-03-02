import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SolidRoundedButton extends StatelessWidget {
  /* This is going to be a pointer to whatever function we pass in
  */
  final String _path;
  final String _label;

  SolidRoundedButton(this._label, this._path);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 40),
      width: 150,
      //margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),

          //side: BorderSide(width: 2.5, color: Colors.black),
        ),
        child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              _label,
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
        onPressed: () {
          context.go(_path);
        },
      ),
    );
  }
}
