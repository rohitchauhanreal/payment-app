import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../views/add_card.dart';
import '../widgets/row_of_circles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/frame1.png'},
    {"id": 2, "image_path": 'assets/images/frame2.png'},
    {"id": 3, "image_path": 'assets/images/frame3.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.person_alt_circle),
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
          ),
        ],
        centerTitle: true,
        title: Container(
          width: 120,
          height: 120,
          child: Image.asset(
            'assets/logos/paymentLogo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                "Rohit Chauhan",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text(
                "rohitchauhan69@upi",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[50],
                image: const DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.asset("assets/images/qr.png"),
            ),
            ListTile(
              leading:
                  const Icon(CupertinoIcons.gift_fill), // Add icon to Option 1
              title: const Text('Invite Friends, get rewards'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.link), // Add icon to Option 2
              title: const Text('Link Debit Card to account'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddCard())),
            ),
            ListTile(
              leading:
                  const Icon(CupertinoIcons.settings), // Add icon to Option 1
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            // Add more list items here
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: const EdgeInsets.all(20.0),
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? Colors.black
                                  : Colors.blueGrey),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.white70,
              child: RowOfCircles(
                imagePaths: [
                  'assets/images/scan.png',
                  'assets/images/mobile.png',
                  'assets/images/bank.png',
                  'assets/images/balance.png',
                ],
                texts: ['Scan QR', 'To Contact', 'To Bank', 'Balance'],
              ),
            ),
            Container(
              child: RowOfCircles(
                imagePaths: [
                  'assets/images/wallet.png',
                  'assets/images/dth.png',
                  'assets/images/electricity.png',
                  'assets/images/water.png',
                ],
                texts: ['Wallet', 'DTH', 'Electricity Bill', 'Water Bill'],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text("Insurance Services",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30,),
            RowOfCircles(
              imagePaths: [
                'assets/images/homeInsurance.png',
                'assets/images/travelInsurance.png',
                'assets/images/bikeInsurance.png',
                'assets/images/healthInsurance.png'
              ],
              texts: ['Home ','Travel','Bike', ' Health'],
            ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.purple[100],
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Invite friends to get ₹201",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Invite friends to EzPAY and get ₹201 when your friend sends their first payment they got ₹21",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for the button here
                    },
                    child: Text('Invite Now'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
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
}

