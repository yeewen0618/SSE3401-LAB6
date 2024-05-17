import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sse3401_lab5/dashboard.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checkbox = false;
  int activate_otp = 1;
  String otp = '';
  TextEditingController contactNum = TextEditingController();
  TextEditingController OTP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Image.asset('images/upmLogo.jpg', width: 170, height: 100),
                const SizedBox(height: 15),
                const Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.5,
                    decoration: activate_otp == 1
                        ? BoxDecoration(
                            color: const Color.fromRGBO(254, 217, 217, 1),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: const Offset(0, 3)),
                            ],
                            borderRadius: BorderRadius.circular(10))
                        : BoxDecoration(
                            color: const Color.fromRGBO(
                              255,
                              255,
                              254,
                              1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: const Offset(0, 3)),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                    child: activate_otp == 1 ? MainPage() : Otp_activation(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 15),
                  child: Center(
                    child: Text(
                      'Disclaimer | Privacy Statement',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                      'Copyright UPM & Kejuruteraan Minyak Sawit CCS Sdn.Bhd.',
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MainPage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: [
            const Expanded(
              flex: 1,
              child: Text(
                'Enter your mobile number to activate your account.',
                style: TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.info_outline_rounded))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 15),
          child: Row(
            children: [
              CountryFlag.fromCountryCode(
                'MY',
                height: 25,
                width: 30,
                borderRadius: 1,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                '+60',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: TextField(
                  controller: contactNum,
                  maxLength: 11,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    counterText: '',
                  ),
                  keyboardType: TextInputType.number,
                  autofocus: false,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
          child: Row(
            children: [
              Checkbox(
                key: const Key('myCheckbox'),
                  value: checkbox,
                  onChanged: (bool? value) {
                    setState(() {
                      checkbox = !checkbox;
                    });
                  }),
              const Text(
                'I agree to the terms & conditions',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        ElevatedButton(
          key: Key('getCode'),
          onPressed: contactNum.text.length >= 10 &&
                  contactNum.text.length <= 11 &&
                  checkbox
              ? () {
                  setState(() {
                    activate_otp = 2;
                  });
                }
              : null,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Get Activation Code',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  Widget Otp_activation() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const Expanded(
                  flex: 1,
                  child: Text(
                    'Enter the activation code you received via SMS.',
                    style: TextStyle(fontSize: 20),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline_rounded))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: TextField(
            key: Key('otp'),
            onChanged: (value) {
              setState(() {
                otp = (value.length).toString();
              });
            },
            controller: OTP,
            maxLength: 6,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, height: 0),
            keyboardType: TextInputType.number,
            autofocus: false,
            decoration: InputDecoration(
              filled: true,
              hintText: 'OTP',
              counterText: '$otp/6',
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              fillColor: Colors.white,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Didn\'t reveive?',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Tap here',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            key: Key('activate'),
            onPressed: OTP.text.length == 6
                ? () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ),
                    );
                  }
                : null,
            child: const Padding(
              padding: EdgeInsets.all(7.0),
              child: Text(
                'Activate',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
