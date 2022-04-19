import 'package:app/data/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:form_field_validator/form_field_validator.dart';

class registerScreen extends StatefulWidget {
  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();

  get email => null;

  get password => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สร้างบัญชี"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("E-mail", style: TextStyle(fontSize: 20)),
                  TextFormField(
                    validator:MultiValidator([
                      RequiredValidator(errorText: "กรุณาใส่ E-mail ของคุณ"),
                      EmailValidator(errorText: "กรุณาใส่รูปแบบ E-mailให้ถูกต้อง")
                    ]),
                        
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (var email) {
                      profile.email = email;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Password", style: TextStyle(fontSize: 20)),
                  TextFormField(
                    validator: RequiredValidator(
                        errorText: "กรุณาใส่ Password ของคุณ"),
                    obscureText: true,
                    onSaved: (var password) {
                      profile.password = password;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("ลงทะเบียน", style: TextStyle(fontSize: 20)),
                      onPressed: () async{
                        if (formKey.currentState!.validate) {
                          formKey.currentState?.save();
                          try{
                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: profile.email, 
                            password: profile.password
                          );
                          formKey.currentState?.reset();
                          }on FirebaseAuthException catch(e){
                            print(e.message);
                          } 
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
