import 'package:flutter/material.dart';
import 'model.dart';
import 'card.dart';

class VisitCard extends StatelessWidget {
  final Visit visit;

  const VisitCard({Key? key, required this.visit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(visit.patientName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(visit.visitReason),
            Text("${visit.visitDate} ${visit.visitTime}"),
            Text(visit.visitLocation),
          ],
        ),
      ),
    );
  }
}