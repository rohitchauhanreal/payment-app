import 'package:flutter/material.dart';

class CookieDetail extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  CookieDetail({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Cashback Offer',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
          children: [
            Hero(
                tag: assetPath,
                child: Image.asset(assetPath,
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.contain
                )
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(cookieprice,
                  style: const TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Text(cookiename,
                  style: const TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: const Text('Use code CONFIRMCODE and get up to ₹20 of on every payment done busing the app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.indigo[400],
                    ),
                    child: const Center(
                        child: Text('Reedem',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),
                        )
                    )
                )
            )
          ]
      ),
    );
  }
}