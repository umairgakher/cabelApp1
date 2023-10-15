// ignore_for_file: prefer_const_constructors, camel_case_types, library_private_types_in_public_api, file_names, deprecated_member_use

import 'package:app/User/Services/payment.dart';
import 'package:flutter/material.dart';

class Change_services extends StatefulWidget {
  const Change_services({Key? key}) : super(key: key);

  @override
  _ChangeServicesState createState() => _ChangeServicesState();
}

class _ChangeServicesState extends State<Change_services> {
  String selectedService = 'Basic'; // Default selected service
  Map<String, Map<String, dynamic>> serviceDetails = {
    'Basic': {'price': 400, 'Quality': '720', 'channels': 100},
    'Gold': {'price': 700, 'Quality': '1080', 'channels': 120},
    'Premium': {'price': 1200, 'Quality': '1280', 'channels': 150},
    // Add more services and their details here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Service',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff392850),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButton<String>(
                  value: selectedService,
                  onChanged: (newValue) {
                    setState(() {
                      selectedService = newValue!;
                    });
                  },
                  items: serviceDetails.keys.map((service) {
                    return DropdownMenuItem<String>(
                      value: service,
                      child: Text(
                        service,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (selectedService.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSpecSection(
                    label: 'Price',
                    value: '${serviceDetails[selectedService]!['price']}',
                  ),
                  _buildSpecSection(
                    label: 'Quality',
                    value: serviceDetails[selectedService]!['Quality'],
                  ),
                  _buildSpecSection(
                    label: 'Channels',
                    value:
                        serviceDetails[selectedService]!['channels'].toString(),
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => payment_method()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff392850),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Proceed',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecSection({required String label, required String value}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
