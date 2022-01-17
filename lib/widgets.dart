import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({ Key? key }) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  
  Future<void> _selectDate(BuildContext context, DateTime selectedDatee) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDatee,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDatee)
      setState(() {
        selectedDatee = picked;
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}