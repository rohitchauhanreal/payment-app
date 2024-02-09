import 'package:flutter/material.dart';

import '../screens/main_screen.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frequently Asked Questions(FAQs)"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen()));
          },
        ),
      ),
      body: ListView(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(16.0),
            elevation: 1.0,
            child: const ExpansionTile(
              title: Text("Q. How do I set up my account?"),
              children: [
                ListTile(
                  title: Text(
                    "Ans. To set up your account, simply download the app from the App Store or Google Play Store, "
                        "and follow the on-screen instructions to create your account. You'll need to provide some "
                        "basic information such as your name, email address, and phone number.",
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(16.0),
            elevation: 1.0,
            child: const ExpansionTile(
              title: Text("Q. How can I reset my password?"),
              children: [
                ListTile(
                  title: Text(
                    "Ans. To reset your password, go to the login screen and tap on 'Forgot Password.' "
                        "Follow the instructions to reset your password via email or SMS.",
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(16.0),
            elevation: 1.0,
            child: const ExpansionTile(
              title: Text("Q.  How do I send money to someone?"),
              children: [
                ListTile(
                  title: Text(
                    "Ans.  To send money to someone, simply open the app and select the Send Money option. Enter the recipient's "
                    "email address or phone number, followed by the amount you wish to send, and confirm the transaction",
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(16.0),
            elevation: 1.0,
            child: const ExpansionTile(
              title: Text("Q. What happens if I lose my phone or it gets stolen?"),
              children: [
                ListTile(
                  title: Text(
                    "Ans.  If you lose your phone or it gets stolen, immediately contact our customer support team to report the incident. "
                        "We can help you secure your account "
                        "and prevent unauthorized access. Additionally, you may consider remotely wiping your device if possible.",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
