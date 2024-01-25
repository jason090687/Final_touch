import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:softprog/checkin_page.dart';
import 'package:softprog/components/aminities_tile.dart';
import 'package:softprog/components/boarding_list.dart';
import 'package:softprog/components/boarding_tile.dart';
import 'package:softprog/details_tile.dart';
import 'package:softprog/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  final List<BoardingHouse> boardingHouses = [
    BoardingHouse(
      imageUrl: 'assets/images/Rectangle 33.png',
      discount: '10% OFF',
      rating: '4.5',
      name: 'Aling Pauline B.H',
      location: 'CDO Lapasan',
      price: '₱2,000 - ₱3,500 /Month',
    ),

    BoardingHouse(
      imageUrl: 'assets/images/Rectangle 53.png',
      discount: '8% OFF',
      rating: '4.8',
      name: 'Grae B.H',
      location: 'CDO Bulua',
      price: '₱1,000 - ₱2,000 /Month',
    ),
    BoardingHouse(
      imageUrl: 'assets/images/Rectangle 77.png',
      discount: '11% OFF',
      rating: '4.0',
      name: 'Jason Pauline B.H',
      location: 'CDO Molugan',
      price: '₱500 - ₱1,000 /Month',
    ),
    // Add more BoardingHouse instances as needed
  ];

  final List<Amenity> amenities = [
    Amenity(
      imgPath: 'assets/images/Rectangle 60.png',
      aminity: 'Electric fan',
      internet: 'Fast Wifi',
    ),

    Amenity(
      imgPath: 'assets/images/Rectangle 60.png',
      aminity: 'Electric fan',
      internet: 'Fast Wifi',
    ),
    Amenity(
      imgPath: 'assets/images/Rectangle 60.png',
      aminity: 'Electric fan',
      internet: 'Fast Wifi',
    ),
    // Add more Amenity instances as needed
  ];

  void navigatorBoardingDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyDetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return SizedBox(
                            width: 500,
                            height: 500,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: CustomBottomSheet(),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Cagayan de Oro Lapasan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2002),
                            lastDate: DateTime(2025),
                          );

                          if (pickedDate != null &&
                              pickedDate != selectedDate) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 5),
                              Text(
                                DateFormat('d MMM, y').format(selectedDate),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          children: [
                            Icon(Icons.person),
                            Text('Guests'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Search location',
                            suffixStyle: TextStyle(fontSize: 15),
                            prefixIcon: Icon(Icons.search, size: 26),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.only(
                            left: 8.0), // Add margin if needed
                        child: IconButton(
                          icon: Image.asset(
                            'assets/images/filter.png',
                            width: 35,
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return const ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                  child: SizedBox(
                                    width: 500,
                                    height: 600,
                                    child: MySearchPage(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Recommended Boarding Houses',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: boardingHouses.length,
                      itemBuilder: (context, index) => BoardingTile(
                        boarding: boardingHouses[index],
                        onTap: () => navigatorBoardingDetails(index),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text('Boarding House Amenities',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: amenities.length,
                      itemBuilder: (context, index) => AminitiesTile(
                        amenity: amenities[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
              activeColor: Colors.blue,
              tabBackgroundColor: Color.fromARGB(255, 167, 207, 240),
              padding: EdgeInsets.all(8),
              gap: 8,
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.bookmark_border,
                  text: 'My Booking',
                ),
                GButton(
                  icon: Icons.chat_bubble_outline,
                  text: 'Chats',
                ),
                GButton(
                  icon: Icons.person_2_outlined,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
