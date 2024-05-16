import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:sse3401_lab5/dashboard.dart';

class Invitation extends StatefulWidget {
  const Invitation({super.key});

  @override
  State<Invitation> createState() => _InvitationState();
}

class _InvitationState extends State<Invitation> {
  int facindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(213, 213, 213, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Factory $facindex',
          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          color: const Color.fromRGBO(213, 213, 213, 1),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 10, 0),
            child: Column(
              children: [
                const Text(
                  'Invitation',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                const Text(
                  'Invite users',
                  style: TextStyle(fontSize: 15),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Owner\'s Name',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          key: Key('userName'),
                          keyboardType: TextInputType.name,
                          style: TextStyle(fontSize: 15, height: 0),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Type Here',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Owner\'s Phone Number',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
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
                        width: 30,
                      ),
                      const Expanded(
                        child: TextField(
                          key: Key('phoneNumber'),
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 10, height: 0),
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            hintStyle: TextStyle(fontSize: 15),
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    key: Key('submit'),
                    onPressed: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(370, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: const Color.fromRGBO(155, 154, 158, 1)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
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
