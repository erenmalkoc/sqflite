

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_sqflite_app/screens/home_screen.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Image.asset(""),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/user_settings_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(5),
                  child: Image(image: AssetImage('assets/ic_one.png'))),
              Text(
                'Organize',
                style:
                    GoogleFonts.robotoMono(color: Colors.green, fontSize: 30),
              ),
              Text(
                'Your',
                style:
                GoogleFonts.robotoMono(color: Colors.indigo, fontSize: 30),
              ),
              Text(
                'Notes',
                style:
                GoogleFonts.robotoMono(color: Colors.green, fontSize: 30),
              ),

              SizedBox(height: 60),
              Container(
                margin: EdgeInsets.all(50),
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>HomePage()),
                    );
                  },
                  child: Text('Next',
                    style:
                    GoogleFonts.robotoMono(color: Colors.white, fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green

                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
