import 'package:classes/pages/add_staff.dart';
import 'package:classes/pages/add_student.dart';
import 'package:classes/pages/my_profile.dart';
import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.08),

          // Menu Items
          buildMenuItem("MY PROFILE", context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyProfilePage()));
          }),
          buildMenuItem("ADD STUDENT", context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStudentPage()));
          }),
          buildMenuItem("ADD STAFF", context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStaffPage()));
          }),
          buildMenuItem("STUDENT INFO", context, () {}),
          buildMenuItem("QUIT", context, () {
            Navigator.pop(context);
          }),

          Spacer(),

          // Bottom Section
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chhatrapati Sambhajinagar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text("Total Fees: 20000"),
                Text("Fees Paid: 12000"),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: Text("Check Installment",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(
      String title, BuildContext context, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          onPressed(); // Execute the custom function when tapped
        },
        borderRadius: BorderRadius.circular(8), // Optional for better UI
        splashColor: Colors.grey.withOpacity(0.3), // Touch effect
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
