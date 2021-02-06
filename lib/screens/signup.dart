import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatme/screens/homepage.dart';
import 'package:eatme/screens/login.dart';
import 'package:eatme/widget/haveaccornot.dart';
import 'package:eatme/widget/myTextFormField.dart';
import 'package:eatme/widget/mybutton.dart';
import 'package:eatme/widget/mypasstextform.dart';
import 'package:eatme/widget/toptitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController email=TextEditingController();
  final TextEditingController fullname=TextEditingController();
  final TextEditingController phonenumber=TextEditingController();
  final TextEditingController address=TextEditingController();
  final TextEditingController password=TextEditingController();

  bool isLoading = false;
  UserCredential authResults;
  void submit() async
  {
    setState(() {
      isLoading = true;
    });
    try{
      authResults = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    } on PlatformException catch (e){
      String message = "Please check internet connection";
      if(e.message != null){
        message = e.message.toString();
      }
      // ignore: deprecated_member_use
      scaffold.currentState.showSnackBar(SnackBar(content: Text(message)),);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // ignore: deprecated_member_use
      scaffold.currentState.showSnackBar(SnackBar(content: Text(e.toString())),);
      setState(() {
        isLoading = false;
      });
    }
    await FirebaseFirestore.instance.collection("UserData").doc(authResults.user.uid).set({
      "UserName": fullname.text,
      "UserEmail": email.text,
      "UserNumber": phonenumber.text,
      "UserAddress": address.text,

    });
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage(),),);
    setState(() {
      isLoading = false;
    });
  }
  void validation()
  {
    if (email.text.isEmpty && password.text.isEmpty && fullname.text.isEmpty && phonenumber.text.isEmpty && address.text.isEmpty)
    {
      // ignore: deprecated_member_use
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("All fields are empty!"),
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
    }
    else if (fullname.text.isEmpty)
    {
      // ignore: deprecated_member_use
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("FullName is empty!"),
        ),
      );
    }
    else if (phonenumber.text.isEmpty)
    {
      // ignore: deprecated_member_use
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("PhoneNumber is empty!"),
        ),
      );
    }
    else if (address.text.isEmpty)
    {
      // ignore: deprecated_member_use
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Address is empty!"),
        ),
      );
    }
    else if (password.text.isEmpty)
    {
      // ignore: deprecated_member_use
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Password is empty!"),
        ),
      );
    }
    else {
      submit();
    }
  }
  final GlobalKey<ScaffoldState> scaffold=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffold,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TopTitle(title: "SignUp", subTitles: "Create an Account!",),
              Container(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTextFormField(title: "FullName", controller: fullname,),
                    MyTextFormField(title: "Email", controller: email,),
                    MyTextFormField(title: "Phone", controller: phonenumber,),
                    MyTextFormField(title: "Address", controller: address,),
                    MypassForm(title: "Password", controller: password,),
                  ],
                ),
              ),
             isLoading==false ? MyButton(name: "Sign Up", onPressed: (){
                validation();
              },): Center(
               child: CircularProgressIndicator(),
             ),
              HaveAccount(title: "I Already Have An Account?", subtitle: "Login", onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));},),
            ],
          ),
        ),
      ),
    );
  }
}
