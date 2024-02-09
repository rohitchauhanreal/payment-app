import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/cashback.dart';
import '../pages/home_page.dart';
import '../pages/message.dart';
import '../pages/qr_code.dart';
import '../pages/reward.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentTab = 0;
  final List<Widget> screens = [
    const HomePage(),
    const RewardPage(),
    QRCodePage(),
    CashbackPage(),
    const MessagePage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentScreen = QRCodePage();
            currentTab = 2;
          });
        },
        child: const Icon(Icons.qr_code_scanner_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 20,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                      minWidth: 30,
                      onPressed: (){
                        setState(() {
                          currentScreen = const HomePage();
                          currentTab = 0;
                        });
                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            CupertinoIcons.home,
                            color: currentTab == 0 ? Colors.deepPurpleAccent : Colors.blueGrey,
                        ),
                        Text(
                            "Home",
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.deepPurpleAccent : Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 30,
                    onPressed: (){
                      setState(() {
                        currentScreen = const RewardPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.gift_fill,
                          color: currentTab == 1 ? Colors.deepPurpleAccent : Colors.blueGrey,
                        ),
                        Text(
                          "Reward",
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.deepPurpleAccent : Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 30,
                    onPressed: (){
                      setState(() {
                        currentScreen = CashbackPage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.creditcard,
                          color: currentTab == 3 ? Colors.deepPurpleAccent : Colors.blueGrey,
                        ),
                        Text(
                          "Cashback",
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.deepPurpleAccent : Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 30,
                    onPressed: (){
                      setState(() {
                        currentScreen = const MessagePage();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.chat_bubble_2,
                          color: currentTab == 4 ? Colors.deepPurpleAccent : Colors.blueGrey,
                        ),
                        Text(
                          "Help",
                          style: TextStyle(
                            color: currentTab == 4 ? Colors.deepPurpleAccent : Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
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

