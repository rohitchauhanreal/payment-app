import 'package:flutter/material.dart';

import '../screens/main_screen.dart';
import 'cb_products.dart';

class CashbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cashback Offers"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainScreen()));
          },
        ),
      ),
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 10.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('JIO', 'Get jio vouchers worth up to ₹100', 'assets/images/jio.png', context),
                  _buildCard('CONFIRM TKT', '30% of on Train Bookings', 'assets/images/confirm.png', context),
                  _buildCard('ZOMATO', '', 'assets/images/zomato.png', context),
                  _buildCard('5 PAISA', '', 'assets/images/5paisa.png',context),

                ],
              )),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CookieDetail(
                assetPath: imgPath,
                cookieprice: price,
                cookiename: name,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Align content vertically center
            children: [
              Center( // Center the image
                child: Container(
                  padding: EdgeInsets.zero,
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF575E67),
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}