import 'package:cis_tomato_game/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cis_tomato_game/home.dart';
import 'package:google_sign_in/google_sign_in.dart';


/// Widget for Login page
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  /// Controllers for email and password input fields
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

            ///UI for the login screen
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

            /// Login button
            Center(
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )
                ),

                onPressed: () {

                  /// Handle Email/Password login
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
              height: 20,
            ),

            /// Google Sign-in button
            Padding(
                padding: const EdgeInsets.only(left: 90, right: 90),
                child: MaterialButton(
                  color: Colors.teal[100],
                  elevation: 10,
                  onPressed: () {
                    googleSignIn();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                              AssetImage('assets/googleLogo.png'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Sign In with Google")
                    ],
                  ),
                )
            ),

            const SizedBox(
              height: 90,
            ),


            /// Redirect to Sign up page for new users
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

          ],
        ),
      ),
    );
  }


  /// Function to initiate Google Sign-In
  googleSignIn() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);

    if(userCredential.user != null){

      /// Navigate to homepage after successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }

  }
}
