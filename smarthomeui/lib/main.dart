import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthomeui/smartdevicebox.dart';

void main() {
  runApp(const SmartHomeUI());
}

class SmartHomeUI extends StatefulWidget {
  const SmartHomeUI({super.key});

  @override
  State<SmartHomeUI> createState() => _SmartHomeUIState();
}

class _SmartHomeUIState extends State<SmartHomeUI> {
  List mysmartdevices = [
    ['Smart Light', 'Assets/Images/light-bulb.png', true, Colors.orange],
    ['Smart Tv', 'Assets/Images/smart-tv.png', false, Colors.grey[900]],
    ['Smart Ac', 'Assets/Images/air-conditioner.png', false, Colors.lightBlue],
    ['Smart Fan', 'Assets/Images/fan.png', false, Colors.grey[800]],
  ];

  switchvaluechanged(bool value, int index) {
    setState(() {
      mysmartdevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          minimum: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'Assets/Images/more.png',
                    height: 30,
                  ),
                  const Icon(
                    Icons.person,
                    size: 30,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome Home,', style: TextStyle(fontSize: 25)),
                    Text('Sahil Shekh',
                        style: GoogleFonts.bebasNeue(fontSize: 75))
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.grey[900],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Text('Smart Devices',
                    style: GoogleFonts.dangrek(
                        fontSize: 25, color: Colors.grey.shade900)),
              ),
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: mysmartdevices.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return SmartDevicesBox(
                        ispowerOn: mysmartdevices[index][2],
                        color: mysmartdevices[index][3],
                        imagepath: mysmartdevices[index][1],
                        text: mysmartdevices[index][0],
                        onChanged: (value) => switchvaluechanged(value, index),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
