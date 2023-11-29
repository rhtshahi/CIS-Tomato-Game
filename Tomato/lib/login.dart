import 'package:cis_tomato_game/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cis_tomato_game/home.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


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
        title: const Text('LOGIN'),
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

            const SizedBox(
              height: 30,
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {

                  /*Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const HomePage())
                  );*/
                  print('EMAIL: $email');
                  print('PASSWORD: $password');

                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: email, password: password)
                      .then((value){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Welcome to Tomato Game!!!'))
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> const HomePage())
                    );
                  }).onError((error, stackTrace){

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Incorrect Email/Password!!!'))
                    );

                  });

                },
                child: const Text('LOGIN'),

              ),
            ),

            const SizedBox(
              height: 190,
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New User? ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /*Center(
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp())
                  );

                },
                child: const Text('Create Account'),

              ),
            ),*/

          ],
        ),
      ),
    );
  }
}
