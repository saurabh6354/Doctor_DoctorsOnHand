import 'dart:convert';

import 'package:doctor_doctorsonhand/Appointments/card.dart';
import 'package:doctor_doctorsonhand/video_calll/meet.dart';
import 'package:flutter/material.dart';
import 'package:doctor_doctorsonhand/Appointments/model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppointmentController extends GetxController {

  final RxList<Appointment> appointments = RxList<Appointment>([
    Appointment(
      patientName: "Patient 3",
      appointmentTime: "14:30 - 15:30 AM",
      appointmentDate: "Today",
      appointmentLocation: "436 139 Avenue",
      appointmentReason: "Hear Burn",
    ),
    Appointment(
      patientName: "Patient 2",
      appointmentTime: "10:00 - 11:00 AM",
      appointmentDate: "Tomorrow",
      appointmentLocation: "1234 Main Street",
      appointmentReason: "Checkup",
    ),
  ]);

  // final appointments = [
  //   Appointment(
  //     patientName: "Patient 1",
  //     appointmentTime: "14:30 - 15:30 AM",
  //     appointmentDate: "Today",
  //     appointmentLocation: "4316 139 Avenue",
  //     appointmentReason: "Hear Burn",
  //   ),
  //   Appointment(
  //     patientName: "Patient 2",
  //     appointmentTime: "10:00 - 11:00 AM",
  //     appointmentDate: "Tomorrow",
  //     appointmentLocation: "1234 Main Street",
  //     appointmentReason: "Checkup",
  //   ),
  //   // Add more appointments here
  // ].obs;
  @override
  void onInit() {
    super.onInit();
    //_loadAppointments();
  }

  // Future<void> _loadAppointments() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final appointmentsJson = prefs.getString('appointments');
  //   if (appointmentsJson != null) {
  //     final appointmentsList = (jsonDecode(appointmentsJson) as List<dynamic>)
  //         .map((appointmentJson) => Appointment.fromJson(appointmentJson))
  //         .toList();
  //     appointments.assignAll(appointmentsList);
  //   }
  // }
  final _prefs = SharedPreferences.getInstance();


  Future<void> _saveAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final appointmentsJson = jsonEncode(appointments.toList());
    prefs.setString('appointments', appointmentsJson);
  }

  void removeAppointment(String patientName) {
    appointments.removeWhere((appointment) => appointment.patientName == patientName);
    _saveAppointments();
  }
}


class AppointmentScreen extends StatelessWidget {
  final AppointmentController appointmentController =
  Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming Appointments"),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: appointmentController.appointments.length,
          itemBuilder: (context, index) {
            return AppointmentCard(
              appointment: appointmentController.appointments[index],
              onPressed: () {
                String patientId =
                    appointmentController.appointments[index].patientName;
                Get.to(
                  VideoCallScreen(doctorId: 'doctor1', patientId: patientId),);
                // )?.then((value) {
                //   if (value == true) {
                //     appointmentController
                //         .removeAppointment(appointmentController.appointments[index]);
                //   }
                // });
              },
            );
          },
        ),
      ),
    );
  }
}