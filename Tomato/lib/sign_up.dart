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
      backgroundColor: Colors.deepOrangeAccent,

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

            const Text(
                "Email",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
            ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 85,
              child:  TextField(

                controller: email_controller,

                onChanged: (value){

                  setState(() {
                    email = value;
                  });

                  //email_controller.text = value;

                },

                /*onChanged: (value){
                  steps_model.recipe_title = value;

                  setState(() {
                    _counterTextRecipeTitle = (100 - value.length).toString();
                  });
                },*/

                //maxLength: 100,

                style: const TextStyle(fontSize: 16, color: Colors.white),

                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  //counterText: "$_counterTextRecipeTitle / 100",
                  //counterStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const Text(
                "Password",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
            ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 85,
              child:  TextField(

                controller: password_controller,

                onChanged: (value){

                  setState(() {
                    password = value;
                  });

                  //password_controller.text = value;

                },

                /*onChanged: (value){
                  steps_model.recipe_title = value;

                  setState(() {
                    _counterTextRecipeTitle = (100 - value.length).toString();
                  });
                },*/

                //maxLength: 100,

                style: const TextStyle(fontSize: 16, color: Colors.white),

                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  //counterText: "$_counterTextRecipeTitle / 100",
                  //counterStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
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
