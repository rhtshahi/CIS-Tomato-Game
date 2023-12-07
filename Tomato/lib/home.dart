import 'package:cis_tomato_game/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiver/async.dart';


/// The main widget for the home page
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /// State variables for the game
  String img_ques = '';
  late int ans;
  int chance = 3;
  int tempHS = 0;
  int permHS = 0;

  var ansController = TextEditingController();


  /// Variable for timer
  int _start = 100;
  int _current = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Tomato Game'),
          backgroundColor: Colors.red
      ),

      body: SingleChildScrollView(
          child: Column(
            children:  [

              ///UI for the game, Images, TextFields, Buttons

              const SizedBox(
                height: 30,
              ),

              const Center(
                child: Text(
                    "Welcome To The Tomato Game!!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,

                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/heart.png'),
                            fit: BoxFit.cover
                        )
                      ),

                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    Text("$chance"),

                    const SizedBox(
                      width: 150,
                    ),

                    const Text("Timer Mode"),

                    IconButton(
                      icon: const Icon(
                        Icons.timer
                      ),
                      onPressed: () {
                        startTimer();
                      },
                    ),

                    //Text("$_current"),
                    if(_current != 0) Text("$_current")
                    else Text("$_start")
                  ],
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    playTomatoGame();
                  },
                  child: const Text('Play Game'),

                ),
              ),

              if (img_ques == '') Center(

                  child: Image.asset(
                      'assets/tomato_image.png', height: 200, width: 200,
                  )

              ) else Center(
                  child: Image.network(
                      img_ques
                  )
              ),

              const SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                        //ansController = value as int;

                        int? parsedValue = int.tryParse(value);
                        if (parsedValue != null) {
                          ansController.text = parsedValue.toString(); // Update the TextField
                        }
                      },

                      style: const TextStyle(fontSize: 20, color: Colors.black),

                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    )

                ),
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer();
                  },
                  child: const Text('OK'),

                ),
              ),

              ///Highscore Display
              Center(
                child: Text(
                    "Your Current High Score is: $tempHS",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
              ),

              Center(
                child: Text(
                    "Your Highest Score is: $permHS",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
              ),

              ///Logout Button
              Center(
                child: ElevatedButton(
                  onPressed: () async{
                    await GoogleSignIn().signOut();
                    FirebaseAuth.instance.signOut().then((valuue){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage())
                      );
                    });

                  },
                  child: const Text('LOG OUT'),

                ),
              ),
            ],
          )
      ),
    );
  }

  ///Function to check answer
  void checkAnswer(){

    /// Parse the text from ansController to an int for comparison
    int userInput = int.tryParse(ansController.text) ?? 0; // Default to 0 if parsing fails
    if (userInput == ans) {
      /// Correct answer logic
      tempHS = tempHS +1;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Correct!!!'))
      );
      //Added Later
      playTomatoGame();
    } else {

      /// Incorrect answer Logic
      chance = chance - 1;//original code

      playTomatoGame();

      if(chance > 0){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You have $chance ramaining Try Again!!!'))
        );
      }

      else if(chance == 0){

        /// Chance over logic
        playTomatoGame();

        if(permHS<tempHS){
          permHS = tempHS;
        }

        //permHS = tempHS;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You have $chance ramaining. Game Over!!!'))
        );
        tempHS = 0;
        chance = 3;

      }
    }
  }

  /// Function to fetch API data and display to play game
  Future<void> playTomatoGame() async {
    if (kDebugMode) {

      /// Fetch data
      const url = 'https://marcconrad.com/uob/tomato/api.php';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final jsonData = json.decode(body); // Use json.decode instead of jsonDecode

        setState(() {
          /// Update the state variable
          img_ques = jsonData["question"];
          ans = jsonData["solution"];
        });

        print('Completed');
        print(img_ques);
        print(ans);
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    }
  }

  /// Function to start timer
  /// source: https://stackoverflow.com/questions/54610121/flutter-countdown-timer
  void startTimer(){
    chance = 120;
    playTomatoGame();
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() { _current = _start - duration.elapsed.inSeconds; });
    });

    sub.onDone(() {
      /// Logic after time runs out
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('TIME UP!!!'))
      );
      chance = 3;
      playTomatoGame();
      sub.cancel();
    });
  }
}





