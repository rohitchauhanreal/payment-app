import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  final scratchKey = GlobalKey<ScratcherState>();
  double _opacity = 0.0;
  bool _alertShown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      scratchDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }

  Future<void> scratchDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Align(
            alignment: Alignment.center,
            child: Text('Yo Yo, You earned a reward..!!'),
          ),
          content: StatefulBuilder(
            builder: (context, StateSetter setState) {
              return Scratcher(
                key: scratchKey,
                accuracy: ScratchAccuracy.medium,
                threshold: 50,
                onThreshold: () {
                  if (!_alertShown) {
                    _alertShown = true;
                    _showRewardDialog(context);
                  }
                },
                color: Colors.redAccent,
                onChange: (value) => print('Progress $value%'),
                brushSize: 20,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1000),
                  opacity: _opacity,
                  child: Container(
                    width: 150,
                    height: 150,
                    child: const Image(
                      image: AssetImage('assets/images/chip.png'),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showRewardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: 110.0,
                  top: -90.0,
                  child: Image.asset(
                    'assets/images/celebration.png',
                    height: 90,
                    width: 90,
                  ),
                ),
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'You Won ₹100 Cashback',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'You can now use Amount to make payments',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
