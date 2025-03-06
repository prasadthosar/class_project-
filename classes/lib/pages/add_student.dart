import 'package:flutter/material.dart';

class AddStudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.06),

              // Back Button & Title
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 10),
                  // Image.asset("assets/student_icon.png", height: 40),
                  SizedBox(width: 10),
                  Text(
                    "Add Student",
                    style: TextStyle(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              // Profile Image
              CircleAvatar(
                radius: screenWidth * 0.15,
                backgroundColor: Colors.purple[100],
                child: Icon(
                  Icons.person,
                  size: screenWidth * 0.15,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Upload Image Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1, vertical: 12),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Upload Image",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Form Fields
              buildTextField("Surname", "Kale"),
              buildTextField("Student Name", "Rohan"),
              buildTextField("Father Name", "Vaibhav"),
              buildTextField("Email Address", "example@email.com"),

              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable TextField Widget
  Widget buildTextField(String label, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.purple),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
