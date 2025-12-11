import 'package:flutter/material.dart';
import 'package:linky/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:new_loading_indicator/new_loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();

  bool _isLoading = false;

  final dio = Dio();

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    await prefs.setString("token", token);
    await prefs.setString("username", decodedToken["username"]);
    await prefs.setString("phone", decodedToken["phone"]);
    await prefs.setString("email", decodedToken["email"]);
    await prefs.setString("user_id", decodedToken["user_id"].toString());
  }

  Future<void> sendLogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await dio.post(
        "https://www.swiftnet.site/backend/login",
        data: {
          "identifier": EmailController.text,
          "password": PasswordController.text,
        },
      );
      final token = response.data["token"]; // Already parsed JSON
      await saveToken(token);
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  "assets/images/linki.png",
                  fit: BoxFit.contain,
                  height: 100,
                ),
                const SizedBox(height: 30),
                Text(
                  'Welcome back!',
                  style: GoogleFonts.figtree(
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                  ),
                  // style:  TextStyle(
                  //   fontSize: 28,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: TextField(
                    controller: EmailController,
                    style: GoogleFonts.figtree(),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.figtree(color: Colors.green),
                      hintText: 'Enter your email or username',
                      hintStyle: GoogleFonts.figtree(fontSize: 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: TextField(
                    controller: PasswordController,
                    obscureText: true,
                    style: GoogleFonts.figtree(),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: GoogleFonts.figtree(color: Colors.green),
                      hintStyle: GoogleFonts.figtree(fontSize: 12),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: const Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child:  Text(
                      'Forgot Password?',
                      style: GoogleFonts.figtree(color: Color(0xFF50C878)),
                      //style: TextStyle(color: Color(0xFF50C878)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      sendLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF50C878),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:  _isLoading? LoadingIndicator(indicatorType: Indicator.orbit, colors: [Colors.white], strokeWidth: 2,) : Text(
                      'Login',
                      style: GoogleFonts.figtree(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUpScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF50C878)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:  Text(
                      'Sign up',
                      //style: TextStyle(fontSize: 16, color: Color(0xFF50C878)),
                      style: GoogleFonts.figtree(fontSize: 16, color: Color(0xFF50C878), fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Spacer(),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(color: Colors.black54),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: Color(0xFF50C878),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
