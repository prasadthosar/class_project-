import 'package:flutter/material.dart';

class StudentInstallmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Student Installment', style: TextStyle(color: Colors.purple)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: screenWidth * 0.15,
              backgroundImage: AssetImage('assets/student.png'),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: Rutuja Amol Kale",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Class: 7th"),
                    Text("Admission Date: 12/06/2024"),
                    Text("Total Fees: 20000"),
                    Text("Total Installments: 10"),
                    SizedBox(height: 10),
                    Text("Installments:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("June: 2000 paid"),
                    Text("July: 2000 paid"),
                    Text("August: 2000 paid"),
                    Text("September: 2000 unpaid",
                        style: TextStyle(color: Colors.red)),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Amount",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      child: Text("Pay", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    Text("Remaining Fees: 16000",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
