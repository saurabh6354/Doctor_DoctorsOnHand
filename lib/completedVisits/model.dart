import 'package:flutter/material.dart';

class Visit {
  final String patientName;
  final String visitTime;
  final String visitDate;
  final String visitLocation;
  final String visitReason;
  final String visitStatus;

  Visit({
    required this.patientName,
    required this.visitTime,
    required this.visitDate,
    required this.visitLocation,
    required this.visitReason,
    required this.visitStatus,
  });
}

