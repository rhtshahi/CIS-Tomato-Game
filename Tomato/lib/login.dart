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
      backgroundColor: Colors.deepOrangeAccent,
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

            Center(
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp())
                  );

                },
                child: const Text('Create Account'),

              ),
            ),

          ],
        ),
      ),
    );
  }
}
