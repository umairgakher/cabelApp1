// ignore_for_file: unnecessary_new, file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, deprecated_member_use, prefer_const_constructors

import 'package:app/User/Complaint/complaintus.dart';
import 'package:app/User/SelfService/Selfservice.dart';
import 'package:app/User/Setting/Setting.dart';
import 'package:app/User/Talkus/Talkus.dart';
import 'package:app/User/TrackOrder/TrackC.dart';
import 'package:app/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/Services.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dashboard Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Dashboard(),
//     );
//   }
// }

class Dashboard extends StatefulWidget {
  Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Items item1 = new Items(title: "Self Service", img: "images/selfservice.png");
  Items item2 = new Items(
    title: "Complaint",
    img: "images/complaign.png",
  );
  Items item3 = new Items(
    title: "Track Complaint",
    img: "images/track.png",
  );
  Items item4 = new Items(
    title: "Talk to Us",
    img: "images/talkus.png",
  );
  Items item5 = new Items(
    title: "Change Service",
    img: "images/services.png",
  );
  Items item6 = new Items(
    title: "Bills",
    img: "images/setting.jpg",
  );
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6
    ]; // Add all items here
    var color = 0xff453658;
    return Scaffold(
      backgroundColor: const Color(0xff392850),
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[200],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff392850),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.green, // Set the desired color here
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Amjid Ali',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  // Do something for Home
                  Navigator.pop(context); // Close the drawer
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
                onTap: () {
                  // Do something for Profile
                  Navigator.pop(context); // Close the drawer
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Do something for Settings
                  Navigator.pop(context); // Close the drawer
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help'),
                onTap: () {
                  // Do something for Help
                  Navigator.pop(context); // Close the drawer
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => loginScreen()),
                        (route) => false,
                      );
                    });
                  });
                  // Handle logout feature
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: GridView.count(
                childAspectRatio: 1.0,
                padding: const EdgeInsets.only(left: 16, right: 16),
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                children: myList.map((data) {
                  return GestureDetector(
                    onTap: () {
                      // Handle item click here
                      _navigateToScreen(
                          data.title); // Call the navigation function
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            data.img,
                            width: 42,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            data.title,
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 8,
                          // ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: PollWidget(),
          ),
        ],
      ),
    );
  }

  void _navigateToScreen(String title) {
    if (title == "Self Service") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Self_service()),
      );
    } else if (title == "Complaint") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Cmp()),
      );
    } else if (title == "Track Complaint") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Trackk()),
      );
    } else if (title == "Talk to Us") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Talk_service()),
      );
    } else if (title == "Change Service") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Change_services()),
      );
    } else if (title == "Bills") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Settings_user()),
      );
    }
  }
}

class Items {
  String title;
  String img;
  Items({required this.title, required this.img});
}

class PollWidget extends StatefulWidget {
  @override
  _PollWidgetState createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {
  int selectedOption = 0; // Initialize selectedOption variable
  bool isButtonDisabled =
      false; // Add a boolean variable to track button disable state

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 410,
      decoration: BoxDecoration(
        color: const Color(0xff453658),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Which One is Better?',
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 6),
            buildRadioButton(
              1,
              'The Newer Connection with the 400 channels?',
            ),
            buildRadioButton(2, 'The older Connection with the 200 channels?'),
            buildRadioButton(3, 'The Connection with the 100 HD channels?'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: isButtonDisabled
                  ? null
                  : () {
                      setState(() {
                        selectedOption =
                            selectedOption; // Optional: Update the selectedOption again
                        isButtonDisabled = true; // Disable the button
                      });
                    },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation:
                    2, // Adjust the elevation value for a subtle shadow effect
                minimumSize: Size(150, 40),
              ),
              child: Text(
                isButtonDisabled ? 'Voted' : 'Vote',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioButton(int value, String label) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
                color:
                    selectedOption == value ? Colors.blue : Colors.transparent,
              ),
              child: selectedOption == value
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
