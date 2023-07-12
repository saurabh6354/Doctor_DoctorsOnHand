import 'package:doctor_doctorsonhand/Appointments/card.dart';
import 'package:doctor_doctorsonhand/video_calll/meet.dart';
import 'package:flutter/material.dart';
import 'package:doctor_doctorsonhand/Appointments/model.dart'; // updated import statement
import 'package:get/get.dart';

class AppointmentScreen extends StatelessWidget {
  final List<Appointment> appointments = [
    Appointment(
      patientName: "Patient 1",
      appointmentTime: "14:30 - 15:30 AM",
      appointmentDate: "Today",
      appointmentLocation: "4316 139 Avenue",
      appointmentReason: "Hear Burn",
    ),
    Appointment(
      patientName: "Patient 2",
      appointmentTime: "10:00 - 11:00 AM",
      appointmentDate: "Tomorrow",
      appointmentLocation: "1234 Main Street",
      appointmentReason: "Checkup",
    ),
    // Add more appointments here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming Appointments"),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return AppointmentCard(
            appointment: appointments[index],
            onPressed: () {
              String patientId = appointments[index].patientName;
              Get.to(
                VideoCallScreen(doctorId: 'doctor1', patientId: patientId),
              );
            },
          );
        },
      ),
    );
  }
}