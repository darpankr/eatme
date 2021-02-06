import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  final String title,subtitle;
  final Function onTap;
  HaveAccount({this.onTap, this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),),
        GestureDetector(
          onTap: onTap,
          child: Text(subtitle,style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
          ),),
        ),
      ],
    );
  }
}
