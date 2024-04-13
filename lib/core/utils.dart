
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<DateTime?> selectDate(BuildContext context) async{
  final DateTime? picker = await showDatePicker(
    context: context, 
    firstDate: DateTime(2000), 
    lastDate: DateTime.now());

    return picker;
}

String formatDateWithDay(DateTime date) {
    // Format date to "15 Aug 2023 (Tue)"
    String formattedDate = DateFormat('dd MMM yyyy (E)').format(date);
    return formattedDate;
  }

String formatDate(DateTime date){
  // Format date to "15 Aug 2023 (Tue)"
    String formattedDate = DateFormat('MMM dd, yyyy').format(date);
    return formattedDate;
}