import 'package:flutter/material.dart';
import 'package:softprog/fundation_page.dart';

class MyEndPage extends StatelessWidget {
  const MyEndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Big image
            Image.asset(
              "assets/images/EndPage.png",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const SizedBox(height: 25),

            // Congratulations text
            const Text(
              "Congratulations!",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 30, // Increase font size
              ),
            ),

            const SizedBox(height: 20),

            // Confirmation message
            const Center(
              child: Text(
                "Your boarding house reservation is confirmed.\nAnticipating the countdown to your dream stay in Zone 5,\nBulua, Cagayan de Oro, Misamis Oriental!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14, // Increase font size
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Go Home button
            ElevatedButton(
              onPressed: () {
                // Replace with your navigation logic
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Background color
                onPrimary: Colors.white, // Text color
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 120), // Adjust size
              ),
              child: const Text(
                "GO HOME",
                style: TextStyle(fontSize: 20), // Increase font size
              ),
            ),

            const SizedBox(height: 8),

            // View e-receipt text
            TextButton(
              onPressed: () {
                // Replace with your e-receipt viewing logic
                // You can also open a webpage here if your e-receipt is online
                print("View e-receipt");
              },
              child: const Text(
                "VIEW E-RECEIPT",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 18, // Increase font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
