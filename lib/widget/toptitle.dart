import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title,subTitles;
  TopTitle({this.title,this.subTitles});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),),
          Text(subTitles,style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.pinkAccent,
          ),),
        ],
      ),
    );
  }
}
