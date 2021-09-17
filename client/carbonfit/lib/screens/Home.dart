import 'package:fixyourprint/screens/Dashboard.dart';
import 'package:fixyourprint/screens/DrawerTap.dart';
import 'package:fixyourprint/screens/ProfileInfo.dart';
import 'package:fixyourprint/screens/Questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    Dashboard(),
    Center(child: Text('Alternatives')),
    Center(child: Text('AQ Index')),
    Center(child: Text('ChatBot'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightGreen,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        iconSize: 20,
        selectedFontSize: 16,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alt_route),
            label: 'Alternatives',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.air),
            label: 'AQ Index',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Ember',
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: ListView(
            children: [
              Text(
                "Hey There!",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1),
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              DrawerTap(
                text: 'Recalculate',
                child: Questionnaire(),
              ),
              SizedBox(
                height: 5,
              ),
              DrawerTap(
                text: 'Countdown',
                child: Home(),
              ),
              SizedBox(
                height: 5,
              ),
              DrawerTap(
                text: 'FAQ',
                child: Home(),
              ),
              SizedBox(
                height: 5,
              ),
              DrawerTap(
                text: 'About Us',
                child: Home(),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(PageTransition(
                        child: ProfileInfo(),
                        type: PageTransitionType.leftToRight));
                  });
                },
                icon: Icon(Icons.person_outline)),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: IndexedStack(index: currentIndex, children: screens),
      ),
    );
  }
}