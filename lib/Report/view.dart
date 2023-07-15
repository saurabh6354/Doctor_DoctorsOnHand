import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model.dart';
import 'form.dart';

class ReportScreen extends StatelessWidget {
  final ReportsController reportsController = Get.put(ReportsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              reportsController.clearReports();
            },
          ),
        ],
      ),
      body: Obx(() => ListView.builder(
        itemCount: reportsController.reports.length,
        itemBuilder: (context, index) {
          final report = reportsController.reports[index];
          return Card(
            child: ListTile(
              title: Text(report.patientName),
              subtitle: Text(report.condition),
              onTap: () {
                _showReportDetails(context, report, index);
              },
            ),
          );
        },
      )),
    );
  }

  void _showReportDetails(BuildContext context, Report report, int index) async {
    final result = await showDialog(
      context: context,
      builder: (context) => ReportForm(
        doctorName: report.doctorName,
        patientName: report.patientName,
        onSave: (newReport) {
          reportsController.updateReport(index, newReport);
        },
        update: true,
        index: index,
        report: report,
      ),
    );
    if (result != null && result) {
      // Show a snackbar to indicate that the report was updated
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Report updated'),
        ),
      );
    }
  }
}