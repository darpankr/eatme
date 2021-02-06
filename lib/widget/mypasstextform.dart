import 'package:flutter/material.dart';

class MypassForm extends StatefulWidget {
final TextEditingController controller;
final String title;
MypassForm({this.title, this.controller});

  @override
  _MypassFormState createState() => _MypassFormState();
}

class _MypassFormState extends State<MypassForm> {
  @override
  Widget build(BuildContext context) {
    bool obscureText=true;
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: (){
            setState(() {
              obscureText = !obscureText;
            });
          },
            child: Icon(
              obscureText == true ? Icons.visibility : Icons.visibility_off,
            ),
        ),
        fillColor: Colors.tealAccent,
        hintText: widget.title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
