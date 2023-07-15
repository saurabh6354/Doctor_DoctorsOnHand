import 'package:doctor_doctorsonhand/Appointments/upcoming.dart';
import 'package:doctor_doctorsonhand/Patient/PatientPage.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get/get.dart';
import 'package:doctor_doctorsonhand/video_calll/meet.dart';

class IncomingCard extends StatelessWidget {
   IncomingCard({
    Key? key,
  }) : super(key: key);

  final AppointmentController appointmentController =
  Get.put(AppointmentController());


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        String doctorId = 'doctor1'; // Replace with the actual doctor ID
        String patientId = 'patient3'; // Replace with the actual patient ID
        Get.to(
          PatientPage(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width * 1,
          height: height * 0.21,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
            //boxShadow: kElevationToShadow[6],
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
                spreadRadius: 3.0,
                offset: Offset(3.0, 3.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 016),
                    child: Text(
                      "Appointments",
                      style: TextStyle(
                        fontFamily: "Comic Sans",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/img.png',
                          width: width * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.62,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        appointmentController
                                            .appointments[0].patientName,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                          appointmentController
                                              .appointments[0].appointmentReason,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Colors.white70,
                                            ),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                  vertical: 6,
                                                  horizontal: 8.0,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white10,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child:  Row(
                                                  children: [
                                                    Icon(
                                                      Ionicons
                                                          .location_outline,
                                                      size: 18,
                                                      color: Colors.white,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.only(
                                                              left: 6,
                                                              right: 14),
                                                      child: Text(
                                                          appointmentController
                                                              .appointments[0].appointmentLocation,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: height * 0.058),
                                            //  IconButton(
                                            //  icon: Icon(Icons.call , color: Colors.greenAccent,),
                                            //   iconSize: 30,
                                            //   color: Colors.white,
                                            //   onPressed: () {  String doctorId = 'doctor1'; // Replace with the actual doctor ID
                                            //   String patientId = 'patient3'; // Replace with the actual patient ID
                                            //   Get.to(
                                            //       VideoCallScreen(doctorId: doctorId, patientId: patientId)); },
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.call),
                                    color: Colors.greenAccent,
                                    onPressed: () {
                                      String doctorId =
                                          'doctor1'; // Replace with the actual doctor ID
                                      String patientId =
                                          'patient3'; // Replace with the actual patient ID
                                      Get.to(VideoCallScreen(
                                          doctorId: doctorId,
                                          patientId: patientId));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 8.0,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              children: [
                                Icon(
                                  Ionicons.calendar_outline,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 6, right: 14),
                                  child: Text(
                                    "Today",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(
                                    Ionicons.time_outline,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "14:30 - 15:30 AM",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
