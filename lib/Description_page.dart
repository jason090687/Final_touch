import 'package:flutter/material.dart';
import 'package:softprog/components/boarding_list.dart';

class BoardingHouseDetailsScreen extends StatefulWidget {
  final BoardingHouseDescription boardingdescription;

  const BoardingHouseDetailsScreen(
      {super.key, required this.boardingdescription});

  @override
  State<BoardingHouseDetailsScreen> createState() =>
      _BoardingHouseDetailsScreenState();
}

class _BoardingHouseDetailsScreenState
    extends State<BoardingHouseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boarding House Details'),
        actions: [
          IconButton(
            onPressed: () {
              // Add heart icon functionality here
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image slider section
            SizedBox(
              height: 250, // Adjust height as needed
              child: PageView(
                children: [
                  Image.asset(widget.boardingdescription
                      .imagePath), // Replace with actual image path
                  // Add more images for the slider
                ],
              ),
            ),
            // Title and arrow button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.boardingdescription.bhname,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add arrow button functionality
                    },
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.blue),
                  ),
                ],
              ),
            ),
            // 8% Off and star ratings
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(widget.boardingdescription.bhdiscount,
                      style: TextStyle(color: Colors.blue)),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(widget.boardingdescription.bhrating),
                    ],
                  ),
                ],
              ),
            ),
            // Location
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 8),
                  Text(widget.boardingdescription.bhlocation),
                ],
              ),
            ),
            // Description
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(widget.boardingdescription.description),
                ],
              ),
            ),
            // Contact Info
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Text('Contact Info',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  SizedBox(width: 8),
                  Text(widget.boardingdescription.contactname),
                ],
              ),
            ),
            // Gallery and price
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gallery'),
                  Text(widget.boardingdescription.bhprice),
                ],
              ),
            ),
            // Book Now button
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for Book Now button
                },
                child: Text('Book Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
