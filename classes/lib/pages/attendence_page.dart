import 'package:classes/pages/my_profile.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String selectedClass = "7th";
  Map<String, bool> attendance = {};

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, size: 30),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyProfilePage()));
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Class Selection
            Text("Class:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  for (String className in [
                    "1st",
                    "2nd",
                    "3rd",
                    "4th",
                    "5th",
                    "6th",
                    "7th",
                    "8th",
                    "9th",
                    "10th",
                    "11th",
                    "12th"
                  ])
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<String>(
                          value: className,
                          groupValue: selectedClass,
                          onChanged: (value) {
                            setState(() {
                              selectedClass = value!;
                            });
                          },
                        ),
                        Text(className),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: Text("Apply", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Student List
            Expanded(
              child: ListView(
                children: [
                  buildStudentCard("Rutuja Amol Kale", "01"),
                  buildStudentCard("Abhishak Ravi Kshirsagar", "02"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStudentCard(String name, String rollNo) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.purple[300],
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  // backgroundImage: AssetImage("assets/student.png")
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: $name",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text("Roll No: $rollNo",
                        style: TextStyle(color: Colors.white)),
                    Text("Class: 7th", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),

            // Attendance Options
            Row(
              children: [
                Text("Present", style: TextStyle(color: Colors.white)),
                Radio<bool>(
                  value: true,
                  groupValue: attendance[rollNo],
                  onChanged: (value) {
                    setState(() {
                      attendance[rollNo] = value!;
                    });
                  },
                ),
                Text("Absent", style: TextStyle(color: Colors.white)),
                Radio<bool>(
                  value: false,
                  groupValue: attendance[rollNo],
                  onChanged: (value) {
                    setState(() {
                      attendance[rollNo] = value!;
                    });
                  },
                ),
              ],
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[700]),
                child: Text("Save", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
