import 'package:flutter/material.dart';
import 'package:softprog/End_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _selectedPaymentMethod; // Added this line to fix the error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Payment logo image
              const SizedBox(height: 20),

              // Total price
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Total Price:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('P 3,150.00',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('(5% VAT included)',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 20),

              // Payment method
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Payment method', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      // Radio buttons for payment methods
                      buildPaymentRadio('GCash'),
                      buildPaymentRadio('BDO'),
                      TextButton(
                        onPressed: () => showMorePaymentMethods(context),
                        child: const Text('More'),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Card details
              buildTextField('Card holder name'),
              buildTextField('Card number'),
              Row(
                children: [
                  buildTextField('Expiry date (MM/YY)', width: 150),
                  const SizedBox(width: 10),
                  buildTextField('CVV', width: 100),
                ],
              ),

              const SizedBox(height: 20),

              // Refund policy text
              const Text('Strictly NO REFUND',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),

              const SizedBox(height: 20),

              // Pay now button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyEndPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  side: const BorderSide(color: Colors.blue, width: 2.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: const Center(
                    child: Text('PAY NOW',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentRadio(String label) {
    return Row(
      children: [
        Radio(
          value: label,
          groupValue: _selectedPaymentMethod,
          onChanged: (value) => setState(() => _selectedPaymentMethod = value),
        ),
        Text(label),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget buildTextField(String label, {double? width}) {
    return SizedBox(
      width: width,
      child: TextField(
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }

  void showMorePaymentMethods(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('More payment methods'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Pay with credit/debit card')),
            ListTile(leading: Icon(Icons.money), title: Text('PayMaya')),
            ListTile(leading: Icon(Icons.link), title: Text('Unibank')),
          ],
        ),
      ),
    );
  }
}
