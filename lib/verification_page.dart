import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyVerify extends StatelessWidget {
  const MyVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyVerifyScreen(),
    );
  }
}

class MyVerifyScreen extends StatelessWidget {
  const MyVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(0, 255, 255, 255)),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.only(top: 70),
          width: double.infinity,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Verify',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: const Text(
                  "Please  enter the verification code sent to example@gmail.com",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Pinput(
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.black),
                  ),
                ),
                onCompleted: (pin) => debugPrint(pin),
              ),
              const SizedBox(height: 30),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Didn’t receive code?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(
                  'Resend again',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(255, 215, 0, 100),
                      color: Color.fromRGBO(255, 215, 0, 100),
                      fontSize: 15,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
              ]),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ()),
                  ); */
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(400, 50),
                    textStyle:
                        const TextStyle(fontSize: 20.0, fontFamily: 'OpenSans'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
                child: const Text('Verify',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
