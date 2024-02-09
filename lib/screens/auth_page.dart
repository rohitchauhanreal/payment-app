import 'package:ezpay_payment_app_ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../components/my_button.dart';
import 'login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Image.asset("assets/logos/paymentLogo.png",
                    color: Colors.indigo,
                    ),
                  ),
                  content(),
                  const SizedBox(height: 20,),
                  MyButton(
                      customColor: Colors.indigo,
                      text: "Sign In",
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                  ),
                  const SizedBox(height: 20,),
                  MyButton(
                    customColor: Colors.deepOrangeAccent.shade200,
                    text: "Create an account",
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                  ),
                ],
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Term of use",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text("Privacy Policy",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget content(){
  return Center(
    child: Container(
      height: 250,
      child: Lottie.asset(
        "assets/lottie/animation.json"
      ),
    ),
  );
}