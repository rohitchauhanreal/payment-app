import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showPass = false;
  bool showConfirm = false;
  showConfPass(){
    setState(() {
      showConfirm = !showConfirm;
    });
  }

  showPassword(){
    setState(() {
      showPass  = !showPass;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Image.asset("assets/logos/paymentLogo.png",
                color: Colors.indigo,
                width: 250,
              ),
              const SizedBox(height: 40,),
              const MyTextField(hintText: "Name"),
              const SizedBox(height: 12,),
              const MyTextField(hintText: "Email"),
              const SizedBox(height: 12,),
              MyTextField(hintText: "Password",
                onPressed: showPassword,
                obscureText: showPass ? false : true,
                icon: showPass ? Icons.visibility_off_rounded : Icons.visibility,
              ),
              const SizedBox(height: 12,),
              MyTextField(hintText: "Confirm Password",
                onPressed: showConfPass,
                obscureText: showConfirm ? false : true,
                icon: showConfirm ? Icons.visibility_off_rounded : Icons.visibility,
              ),
              const SizedBox(height: 30,),
              MyButton(customColor: Colors.indigo.shade400,
                  text: "Sign Up",
                  onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                });
                  }
              ),
              const SizedBox(height: 20,),
              Text("Or sign Up with,",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[400],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade700)
                    ),
                    child: Image.asset("assets/logos/facebook.png", width: 50,),
                  ),
                  const SizedBox(width: 20,),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade700)
                    ),
                    child: Image.asset("assets/logos/google.png", width: 50,),
                  ),
                  const SizedBox(width: 20,),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade700)
                    ),
                    child: const Icon(
                      Icons.apple,
                      size: 50,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    child: const Text("Log In",
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 185, 121),
                        fontWeight: FontWeight.bold,
                      ),),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
