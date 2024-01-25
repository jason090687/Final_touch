import 'package:flutter/material.dart';
import 'package:softprog/gnav/Booking_nav.dart';
import 'package:softprog/gnav/chats_nav.dart';
import 'package:softprog/gnav/favorites_nav.dart';
import 'package:softprog/gnav/profile.dart';
import 'package:softprog/home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          HomePage(),
          FavoritePage(),
          MyBookingScreen(),
          ChatApp(),
          ProfileScreen(),

          // Add more pages as needed
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        selectedItemColor: Colors.blue, // Set the color of selected items
        unselectedItemColor: Colors.grey, // Set the color of unselected items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat), // Updated icon for "My Bookings"
            label: 'My Bookings', // Updated label for "My Bookings"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          // Add more BottomNavigationBarItems as needed
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
