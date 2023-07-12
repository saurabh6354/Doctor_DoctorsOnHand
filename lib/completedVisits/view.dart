import 'package:flutter/material.dart';
import 'model.dart';
import 'card.dart';

class CompletedVisitsScreen extends StatelessWidget {
  final List<Visit> visits = [
    Visit(
      patientName: "Patient 1",
      visitTime: "14:30 - 15:30 AM",
      visitDate: "2021-10-01",
      visitLocation: "4316 139 Avenue",
      visitReason: "Hear Burn",
      visitStatus: "Completed",
    ),
    Visit(
      patientName: "Patient 2",
      visitTime: "10:00 - 11:00 AM",
      visitDate: "2021-10-02",
      visitLocation: "1234 Main Street",
      visitReason: "Checkup",
      visitStatus: "Completed",
    ),
    // Add more visits here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed Visits"),
      ),
      body: ListView.builder(
        itemCount: visits.length,
        itemBuilder: (context, index) {
          return VisitCard(
            visit: visits[index],
          );
        },
      ),
    );
  }
}