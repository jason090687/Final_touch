import 'package:flutter/material.dart';
import 'package:softprog/components/aminities_tile.dart';
import 'package:softprog/components/boarding_list.dart';
import 'package:softprog/components/boarding_tile.dart';
import 'package:softprog/search_page.dart';

class HomePage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Location'),
                  ],
                ),
                SizedBox(width: 10),
                Icon(Icons.notifications),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cagayan de Oro Lapasan',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 5),
                      Text(DateTime.now().toString()),
                      const SizedBox(width: 15),
                      const Row(
                        children: [
                          Icon(Icons.person),
                          Text('Guests: 5'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
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
                            prefixIcon: Icon(Icons.search, size: 14),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 8.0), // Add margin if needed
                        child: IconButton(
                          icon: Image.asset(
                            'assets/images/filter.png',
                            width: 35,
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled:
                                  true, // Set to true for a larger sheet
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top:
                                          20.0), // Adjust top padding as needed
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight:
                                          MediaQuery.of(context).size.height *
                                              0.75,
                                    ),
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
                  SizedBox(
                    height: 220,
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
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book), label: 'My Booking'),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
