import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // final exapleTimeSpent = [
  // 	1, 2, 4, 8, 16,
  // 	32, 64, 128, 256
  // ];
  @override
  Widget build(BuildContext context) {
    Widget userView = Container(
      padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Hi,",
                style: TextStyle(fontSize: 50),
              ),
              Text("you",
                  style: TextStyle(fontSize: 50, color: Color(0xFFAC0000))),
            ],
          )),
          const Icon(Icons.account_circle_sharp, color: Colors.grey, size: 150)
        ],
      ),
    );

    Widget timeView = Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(children: [
        const Text(
          "Time spent",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        // Usage "graph"
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Image.asset('img/exampleChart.png'))
      ]),
    );

    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          userView,
          const Divider(color: Colors.black),
          timeView,
        ]);
  }
}
