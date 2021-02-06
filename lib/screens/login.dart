import 'package:eatme/screens/signup.dart';
import 'package:eatme/widget/haveaccornot.dart';
import 'package:eatme/widget/myTextFormField.dart';
import 'package:eatme/widget/mybutton.dart';
import 'package:eatme/widget/mypasstextform.dart';
import 'package:eatme/widget/toptitle.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  final TextEditingController email=TextEditingController();
  void validation()
  {
    if (email.text.isEmpty & password.text.isEmpty)
    {
      // ignore: deprecated_member_use
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Both are empty!"),
        ),
      );
    }
    else if (email.text.isEmpty)
      {
        // ignore: deprecated_member_use
        scaffold.currentState.showSnackBar(
            SnackBar(
              content: Text("Email is empty!"),
            ),
        );
      } else if (password.text.isEmpty)
        {
          // ignore: deprecated_member_use
          scaffold.currentState.showSnackBar(
            SnackBar(
              content: Text("Password is empty!"),
            ),
          );
        }
  }

  final GlobalKey<ScaffoldState> scaffold=GlobalKey<ScaffoldState>();

  final TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffold,
      backgroundColor: Color(0xfff8f8f8),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TopTitle(
                title: "Login",
                subTitles: "Welcome Back!",
              ),
              Center(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextFormField(title: "Email", controller: email),
                      SizedBox(height: 10,),
                      MypassForm(title: "Password", controller: password),
                    ],
                  ),
                ),
              ),
              MyButton(name: "Login", onPressed: (){
                validation();
              },),
              SizedBox(height: 10,),
              HaveAccount(title: "Don't have Account?", subtitle: "SignUp", onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUp()));},),
            ],
          ),
        ),
      ),
    );
  }
}
