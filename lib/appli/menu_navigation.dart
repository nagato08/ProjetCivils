import 'package:flutter/material.dart';
import 'package:projet/appli/profil.dart';
import 'package:projet/appli/services.dart';

import 'acceuil.dart';
import 'menu.dart';


class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {

  int _currentIndex = 0;

  final tabs= [
    const HomePage(),
    const ServicesPage(),
    const UserPage(),
    const MenuPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        elevation: 0,
        iconSize: 30,
        items:const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Acceuil",
              backgroundColor: Colors.grey,

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.ballot),
            label: "Services",
              backgroundColor: Colors.grey
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
              backgroundColor: Colors.grey
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
              backgroundColor: Colors.grey
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
