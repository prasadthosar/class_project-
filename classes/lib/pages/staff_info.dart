import 'package:classes/pages/add_staff.dart';
import 'package:classes/pages/home_page.dart';
import 'package:classes/pages/my_profile.dart';
import 'package:flutter/material.dart';

class StaffInfoPage extends StatelessWidget {
  const StaffInfoPage({super.key});

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
        title: Row(
          children: [
            // Image.asset(
            //   "assets/teacher_icon.png", // Replace with your asset path
            //   height: screenHeight * 0.05,
            // ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              "Staff Info",
              style: TextStyle(
                color: Colors.purple,
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.purple[100],
            child: IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyProfilePage())),
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),

            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Staff List
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Dummy Data Count
                itemBuilder: (context, index) {
                  return _staffCard(screenWidth, screenHeight);
                },
              ),
            ),
          ],
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

  // Staff Card Widget
  Widget _staffCard(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Profile Image
          CircleAvatar(
            radius: screenWidth * 0.08,
            // backgroundImage:
            //     AssetImage("assets/profile.jpg"), // Replace with asset path
          ),
          SizedBox(width: screenWidth * 0.04),

          // Staff Info
          Expanded(
            child: Text(
              "Name: Rohini Vaibhav Kale\n"
              "Teaching Class: 7th\n"
              "Address: n6 codco, Chhatrapati Sambhajinagar\n"
              "Salary: 8000",
              style:
                  TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
            ),
          ),
        ],
      ),
    );
  }

  // Bottom Navigation Item
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
