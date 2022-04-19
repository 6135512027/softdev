import 'dart:html';

import 'package:app/model/login.dart';
import 'package:app/model/register.dart';
import "package:flutter/material.dart";
//import 'package:app/model/login.dart';
//import 'package:app/model/register.dart';

/*class Logininfo {
  var username = "";
  var email = "";
  var password = "";
}*/

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ลงทะเบียน / เข้าใช้งาน"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("WELCOME TO MY PORTFOLIO",style: TextStyle(fontSize: 20,color: Colors.pink,fontWeight: FontWeight.bold ),),
              Image.asset("assets/images/logo.png"),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("สร้างบัญชี", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return registerScreen();
                      })
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return loginScreen();
                      })
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
