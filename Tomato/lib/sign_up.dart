import 'package:cis_tomato_game/User.dart';
import 'package:cis_tomato_game/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  //User obj_user = new User();
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        centerTitle: true,
          title: const Text('SIGN UP'),
          backgroundColor: Colors.red
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),

            Container(
              height: 150.0,
              width: 190.0,
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.asset('assets/tomato_image.png'),
              ),
            ),

            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: email_controller,

                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: password_controller,

                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {

                  /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage())
                  );*/
                  /*print('EMAIL: ${email_controller.text}');
                  print('PASSWORD: ${password_controller.text}');*/
                  print('The Email is: $email');
                  print('The Password is: $password');

                  FirebaseAuth.instance.createUserWithEmailAndPassword
                    (
                      email: email,
                      password: password
                  ).then((value)=>{
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()))
                    
                  });

                },
                child: const Text('SIGN UP'),

              ),
            ),
          ],
        ),
      ),

    );
  }
}
