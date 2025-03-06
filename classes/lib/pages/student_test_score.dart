import 'package:flutter/material.dart';

class StudentTestScoresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Student Test Scores', style: TextStyle(color: Colors.purple)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: screenWidth * 0.15,
              backgroundImage: AssetImage('assets/student.png'),
            ),
            SizedBox(height: 20),
            _buildTestCard(screenWidth, "Test 1", "12/12/2024", "Science",
                "Thermodynamics", "18 out of 20"),
            _buildTestCard(screenWidth, "Test 2", "12/12/2024", "Science",
                "Thermodynamics", "18 out of 20"),
            SizedBox(height: 20),
            _buildNewTestForm(screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildTestCard(double screenWidth, String test, String date,
      String subject, String chapter, String marks) {
    return Card(
      color: Colors.purple[700],
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$test   Date: $date",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text("Subject: $subject", style: TextStyle(color: Colors.white)),
            Text("Chapter: $chapter", style: TextStyle(color: Colors.white)),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              child: Text(marks, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewTestForm(double screenWidth) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          children: [
            _buildInputField("Exam Date"),
            _buildInputField("Subject"),
            _buildInputField("Chapter Name"),
            _buildInputField("Total Marks"),
            _buildInputField("Obtained Marks"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Text("Submit", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String hint) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
