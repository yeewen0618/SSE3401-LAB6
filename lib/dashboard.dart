import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sse3401_lab5/invitation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int facindex = 1;
  int currentIndex = 1;
  Color factory1 = Colors.blue;
  Color factory2 = Colors.grey;
  Color factory3 = Colors.grey;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(213, 213, 213, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Factory $facindex',
          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: screenWidth * 1.0,
                height: screenHeight * 0.58,
                color: const Color.fromRGBO(213, 213, 213, 1),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.55,
                      color: const Color.fromRGBO(213, 213, 213, 1),
                      child: Center(
                        child: Column(
                          children: [
                            currentIndex == 0
                                ? Contact(facindex: facindex)
                                : currentIndex == 1
                                    ? Factory(facindex: facindex)
                                    : Settings(facindex: facindex),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      key: Key('factory1'),
                      child: Container(
                          height: 145,
                          width: 160,
                          decoration: BoxDecoration(
                              border: Border.all(color: factory1),
                              color: const Color.fromRGBO(255, 254, 255, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.factory,
                                  size: 35,
                                ),
                              ),
                              Text(
                                'Factory 1',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          )),
                      onTap: () {
                        setState(() {
                          factory2 = Colors.grey;
                          factory1 = Colors.blue;
                          factory3 = Colors.grey;
                          facindex = 1;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      key: Key('factory2'),
                      child: Container(
                          height: 145,
                          width: 160,
                          decoration: BoxDecoration(
                            border: Border.all(color: factory2),
                            color: const Color.fromRGBO(255, 254, 255, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.factory,
                                  size: 35,
                                ),
                              ),
                              Text(
                                'Factory 2',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          )),
                      onTap: () {
                        setState(() {
                          factory1 = Colors.grey;
                          factory2 = Colors.blue;
                          factory3 = Colors.grey;
                          facindex = 2;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      key: Key('factory3'),
                      child: Container(
                          height: 145,
                          width: 160,
                          decoration: BoxDecoration(
                            border: Border.all(color: factory3),
                            color: const Color.fromRGBO(255, 254, 255, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.factory,
                                  size: 35,
                                ),
                              ),
                              Text(
                                'Factory 3',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          )),
                      onTap: () {
                        setState(() {
                          factory1 = Colors.grey;
                          factory2 = Colors.grey;
                          factory3 = Colors.blue;
                          facindex = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            key: Key('person'),
            label: '',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            key: Key('home'),
            label: '',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            key: Key('settings'),
            label: '',
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({
    super.key,
    required this.facindex,
  });
  final int facindex;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int get facindex => widget.facindex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.55,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(239, 239, 239, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 35),
              child: ThresholdContainer(),
            ),
            facindex == 1
                ? const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ThresholdData(
                              title: 'Steam\nPressure',
                              value: '29',
                              unit: 'bar',
                            ),
                            ThresholdData(
                              title: 'Steam\nFlow',
                              value: '22',
                              unit: 'T/H',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ThresholdData(
                              title: 'Water\nLevel',
                              value: '53',
                              unit: '%',
                            ),
                            ThresholdData(
                              title: 'Power\nFrequency',
                              value: '48',
                              unit: 'Hz',
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : facindex == 2
                    ? const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ThresholdData(
                                  title: 'Steam\nPressure',
                                  value: '54',
                                  unit: 'bar',
                                ),
                                ThresholdData(
                                  title: 'Steam\nFlow',
                                  value: '32',
                                  unit: 'T/H',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ThresholdData(
                                  title: 'Water\nLevel',
                                  value: '76',
                                  unit: '%',
                                ),
                                ThresholdData(
                                  title: 'Power\nFrequency',
                                  value: '12',
                                  unit: 'Hz',
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ThresholdData(
                                  title: 'Steam\nPressure',
                                  value: '62',
                                  unit: 'bar',
                                ),
                                ThresholdData(
                                  title: 'Steam\nFlow',
                                  value: '44',
                                  unit: 'T/H',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ThresholdData(
                                  title: 'Water\nLevel',
                                  value: '23',
                                  unit: '%',
                                ),
                                ThresholdData(
                                  title: 'Power\nFrequency',
                                  value: '45',
                                  unit: 'Hz',
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
          ],
        ),
      ),
    );
  }
}

class ThresholdContainer extends StatelessWidget {
  const ThresholdContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Minimum Threshold',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(5, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Icon(
              Icons.edit,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class ThresholdData extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  const ThresholdData({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style:
              const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, height: 0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            height: 65,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IntrinsicHeight(
              child: Row(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 15, 0),
                    child: Text(
                      value,
                      style:
                          const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                    child: Text(
                      unit,
                      textAlign: TextAlign.right,
                      style:
                          const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Factory extends StatefulWidget {
  const Factory({
    super.key,
    required this.facindex,
  });
  final int facindex;

  @override
  State<Factory> createState() => _FactoryState();
}

class _FactoryState extends State<Factory> {
  int get facindex => widget.facindex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 0.55,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(239, 239, 239, 1),
          borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            facindex == 1
                ? const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          '⚠ ABD1234 IS UNREACHABLE!',
                          style: TextStyle(
                              fontSize: 23.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FactoryWidget(
                              title: 'Steam Pressure',
                              image: 'images/img1.jpg',
                              value: '0.0',
                              unit: 'bar',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FactoryWidget(
                              title: 'Steam Flow',
                              image: 'images/img2.jpg',
                              value: '0.0',
                              unit: 'T/H',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FactoryWidget(
                              title: 'Water Level',
                              image: 'images/img3.jpg',
                              value: '0.0',
                              unit: '%',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FactoryWidget(
                              title: 'Power Frequency',
                              image: 'images/img4.jpg',
                              value: '0.0',
                              unit: 'Hz',
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          '- - : - -',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  )
                : facindex == 2
                    ? Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '1549.7kW ',
                              style: TextStyle(
                                  fontSize: 23.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FactoryWidget(
                                  title: 'Steam Pressure',
                                  image: 'images/img5.jpg',
                                  value: '34.19',
                                  unit: 'bar',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FactoryWidget(
                                  title: 'Steam Flow',
                                  image: 'images/img6.jpg',
                                  value: '22.82',
                                  unit: 'T/H',
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FactoryWidget(
                                  title: 'Water Level',
                                  image: 'images/img7.jpg',
                                  value: '55.41',
                                  unit: '%',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FactoryWidget(
                                  title: 'Power Frequency',
                                  image: 'images/img8.jpg',
                                  value: '50.08',
                                  unit: 'Hz',
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '3600.72kW',
                              style: TextStyle(
                                  fontSize: 23.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FactoryWidget(
                                  title: 'Steam Pressure',
                                  image: 'images/img1.jpg',
                                  value: '0.0',
                                  unit: 'bar',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FactoryWidget(
                                  title: 'Steam Flow',
                                  image: 'images/img7.jpg',
                                  value: '52.7',
                                  unit: 'T/H',
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FactoryWidget(
                                  title: 'Water Level',
                                  image: 'images/img8.jpg',
                                  value: '49.65',
                                  unit: '%',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FactoryWidget(
                                  title: 'Power Frequency',
                                  image: 'images/img4.jpg',
                                  value: '0.0',
                                  unit: 'Hz',
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      )
          ],
        ),
      ),
    );
  }
}

class FactoryWidget extends StatelessWidget {
  final String title;
  final String image;
  final String value;
  final String unit;
  const FactoryWidget({
    super.key,
    required this.title,
    required this.image,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 254, 255, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Image.asset(image, width: 140, height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                unit,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Contact extends StatefulWidget {
  const Contact({
    super.key,
    required this.facindex,
  });
  final int facindex;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  int get facindex => widget.facindex;
  List<String> person1 = ["Ben", "Testing 1", "Hello"];
  List<String> contact1 = ["+60109219938", "+601234567891", "+60123456789"];
  List<String> person2 = ["Bentley", "Fiona"];
  List<String> contact2 = ["+60123987621", "+60167258437"];
  List<String> person3 = ["Benjamin"];
  List<String> contact3 = ["+60126677218"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 0.55,
      color: const Color.fromRGBO(213, 213, 213, 1),
      child: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(239, 239, 239, 1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  facindex == 1
                      ? Expanded(
                          child: SizedBox(
                            width: 350,
                            height: MediaQuery.of(context).size.height * 1.0,
                            child: ContactDetails(
                                person: person1, contact: contact1),
                          ),
                        )
                      : facindex == 2
                          ? Expanded(
                              child: SizedBox(
                                width: 350,
                                height:
                                    MediaQuery.of(context).size.height * 1.0,
                                child: ContactDetails(
                                    person: person2, contact: contact2),
                              ),
                            )
                          : Expanded(
                              child: SizedBox(
                                width: 350,
                                height:
                                    MediaQuery.of(context).size.height * 1.0,
                                child: ContactDetails(
                                    person: person3, contact: contact3),
                              ),
                            ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15, bottom: 15),
                        child: ElevatedButton(
                          key: Key('add'),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Invitation(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(30, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            '+',
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContactDetails extends StatefulWidget {
  const ContactDetails({
    super.key,
    required this.person,
    required this.contact,
  });

  final List<String> person;
  final List<String> contact;

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.person.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(254, 255, 254, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.person[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.grey,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.contact[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
