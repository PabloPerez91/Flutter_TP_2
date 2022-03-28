import 'package:flutter/material.dart';
import 'package:tp2/pages/MyAgeCalculationPage.dart';
import 'package:tp2/pages/MyDurationCalculationPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calcul de dates'),
          backgroundColor: Color.fromRGBO(63, 68, 75, 1), // status bar color
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cake),
              ),
              Tab(
                icon: Icon(Icons.date_range_outlined),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: MyAgeCalculationPage(
                  title: "",
              ),
            ),
            Center(
              child: MyDurationCalculationPage(
                  title: "",
              ),
            ),
          ],
        ),
      ),
    );
  }
}