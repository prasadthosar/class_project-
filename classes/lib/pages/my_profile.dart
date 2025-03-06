import 'package:classes/pages/add_staff.dart';
import 'package:classes/pages/home_page.dart';
import 'package:classes/pages/staff_info.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "My Profile",
          style: TextStyle(
            color: Colors.purple,
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),

              // Profile Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.05,
                  horizontal: screenWidth * 0.06,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    // Profile Avatar
                    CircleAvatar(
                      radius: screenWidth * 0.12,
                      backgroundColor: Colors.purple[100],
                      child: Icon(
                        Icons.person,
                        size: screenWidth * 0.15,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Profile Details
                    _profileDetail("Name"),
                    _profileDetail("Qualification"),
                    _profileDetail("Classes"),
                    _profileDetail("Contact"),
                    _profileDetail("Mail id"),
                    SizedBox(height: screenHeight * 0.02),

                    // More Details
                    Text(
                      "more details .......",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(Icons.home, "Home", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
            _bottomNavItem(Icons.people, "Staff Info", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StaffInfoPage()));
            }),
            _bottomNavItem(Icons.person_add, "Add Staff", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddStaffPage()));
            }),
          ],
        ),
      ),
    );
  }

  // Profile Detail Text Widget
  Widget _profileDetail(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$title :",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _bottomNavItem(IconData icon, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.purple),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
