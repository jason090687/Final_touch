import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:softprog/home_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  bool showAgeTextField = true;
  bool showSexTextField = true;

  // Function to show a confirmation dialog for editing profile
  Future<void> _showEditConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to edit your profile?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Implement edit functionality here
                setState(() {
                  showAgeTextField = true;
                  showSexTextField = true;
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  // Function to show a confirmation dialog for logging out
  Future<void> _showLogoutConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white, // Set the color to white
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Navigate back to the previous screen
            },
          ),
          iconTheme: IconThemeData(
              color: Colors.white), // Set the icon theme color to white
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey, // Temporary placeholder color
                  child: Icon(Icons.person,
                      color: Colors.white), // Make the icon white
                ),
                SizedBox(height: 20),
                Text(
                  "Grae Jaylor Penat",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "penat.grae345@gmail.com",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 30),
                // Show either TextFormField or Text based on the showAgeTextField value
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.person_outline,
                          color: Colors.black), // Adjust icon color
                      SizedBox(width: 10),
                      Text("Age: "),
                      SizedBox(width: 10),
                      Expanded(
                        child: showAgeTextField
                            ? TextFormField(
                                controller: ageController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your age',
                                ),
                              )
                            : Text(ageController.text),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                // Show either TextFormField or Text based on the showSexTextField value
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.male,
                          color: Colors.black), // Adjust icon color
                      SizedBox(width: 10),
                      Text("Sex: "),
                      SizedBox(width: 10),
                      Expanded(
                        child: showSexTextField
                            ? TextFormField(
                                controller: sexController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your sex',
                                ),
                              )
                            : Text(sexController.text),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                // Add the Update and Edit buttons in the same row, aligned to corners
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Implement update functionality here
                        setState(() {
                          showAgeTextField = false;
                          showSexTextField = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text('Update'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Show the confirmation dialog before editing
                        _showEditConfirmationDialog();
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Show the confirmation dialog before logging out
                    _showLogoutConfirmationDialog();
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
