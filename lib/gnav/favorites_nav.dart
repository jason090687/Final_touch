import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:softprog/gnav/Booking_nav.dart';
import 'package:softprog/gnav/chats_nav.dart';
import 'package:softprog/gnav/profile.dart';
import 'package:softprog/home_page.dart';

class MyItem {
  String title;
  String description;
  bool isFavorite;

  MyItem(
      {required this.title,
      required this.description,
      this.isFavorite = false});
}

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  List<MyItem> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    await Future.delayed(Duration(seconds: 1));
    final itemData = List.generate(
      5,
      (index) => MyItem(
        title: 'Item $index',
        description: 'This is a description for Item $index. Lorem ipsum...',
      ),
    );

    setState(() => _favorites = itemData);
  }

  void _toggleFavorite(int index) {
    setState(
        () => _favorites[index].isFavorite = !_favorites[index].isFavorite);
  }

  void _navigateToDetailPage(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
            item: _favorites.firstWhere((item) => item.title == title)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Favorites',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          backgroundColor: Colors.blue, // Set the background color here
        ),
        body: _favorites.isEmpty
            ? Center(child: Text('No favorites yet!'))
            : ListView.builder(
                itemCount: _favorites.length,
                itemBuilder: (context, index) {
                  final item = _favorites[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ListTile(
                      title: Text(item.title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(item.description),
                      trailing: GestureDetector(
                        onTap: () => _toggleFavorite(index),
                        child: Icon(
                          item.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: item.isFavorite ? Colors.red : null,
                        ),
                      ),
                      onTap: () => _navigateToDetailPage(item.title),
                    ),
                  );
                },
              ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            activeColor: Colors.blue,
            tabBackgroundColor: Color.fromARGB(255, 167, 207, 240),
            padding: EdgeInsets.all(8),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
                onPressed: () {
                  // Navigate to the Home screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Likes',
                onPressed: () {
                  // Replace the current screen with the LikesScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LikesScreen()),
                  );
                },
              ),
              GButton(
                icon: Icons.bookmark_border,
                text: 'My Booking',
                onPressed: () {
                  // Navigate to the My Booking screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyBookingScreen()),
                  );
                },
              ),
              GButton(
                icon: Icons.chat_bubble_outline,
                text: 'Chats',
                onPressed: () {
                  // Navigate to the Chats screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatsScreen()),
                  );
                },
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
                onPressed: () {
                  // Navigate to the Profile screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
            ], // Add the missing screens as needed
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final MyItem item;

  const DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue, // Set the background color here
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(item.description, textAlign: TextAlign.center),
            SizedBox(height: 20),
            Text('Details for ${item.title}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
