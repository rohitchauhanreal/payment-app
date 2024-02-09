import 'package:ezpay_payment_app_ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool showPass = false;
  showPassword(){
    setState(() {
      showPass = !showPass;
    });
  }

  bool checkTheBox = false;
  check(){
    setState(() {
      checkTheBox = !checkTheBox;
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
              const SizedBox(height: 40,),
              Image.asset("assets/logos/paymentLogo.png",
              color: Colors.indigo,
              width: 300,
              ),
              const SizedBox(height: 40,),
              const MyTextField(hintText: "Email or Username"),
              const SizedBox(height: 20,),
              MyTextField(hintText: "Password",
              onPressed: showPassword,
              obscureText: showPass ? false : true,
              icon: showPass ? Icons.visibility_off_rounded : Icons.visibility,
              ),
              const SizedBox(height: 12,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                          unselectedWidgetColor: Colors.grey[500],
                        ),
                          child: Checkbox(
                          checkColor: Colors.white,
                          value : checkTheBox ? true : false,
                          onChanged: (value){
                            check();                          }
                        ),
                        ),
                        Text("Remember Me", style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                    const Text("Forgot Password", style: TextStyle(color: Colors.cyan,
                    fontWeight: FontWeight.bold,

                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              MyButton(customColor: Colors.indigo.shade400,
                  text: "SignIn",
                  onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainScreen()));
                });
                  }
              ),
              const SizedBox(height: 20,),
              Text("Or signIn with,",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
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
                  Text("Don't have an account?",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                    child: const Text("Register",
                    style: TextStyle(
                      color: Color.fromARGB(255, 10, 185, 121),
                      fontWeight: FontWeight.bold,
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
