import 'package:flutter/material.dart';
import 'package:krainet_test/presentation/pages/single_task_page/widgets/date_time_picker_dialog.dart';

class DueTimeButton extends StatefulWidget {
  final DateTime dueDate; // The initial due date for the task
  final Function(DateTime)
      onDatePicked; // Callback to notify parent when a date is picked

  const DueTimeButton({
    required this.dueDate, // Initialize the due date
    super.key,
    required this.onDatePicked, // Callback to notify parent of date selection
  });

  @override
  State<DueTimeButton> createState() => _DueTimeButtonState();
}

class _DueTimeButtonState extends State<DueTimeButton> {
  late DateTime dueDate; // Holds the due date for the task

  @override
  void initState() {
    super.initState();
    dueDate = widget
        .dueDate; // Initialize the due date from the widget's passed value
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        // Show the DateTimePickerDialog when the button is pressed
        final date = await showDialog(
          context: context,
          builder: (context) {
            return const DateTimePickerDialog(); // Dialog to pick a date and time
          },
        );

        // If a valid date is selected, update the dueDate and notify the parent
        if (date != null) {
          widget.onDatePicked(
              date); // Pass the selected date to the parent via the callback
          dueDate = date; // Update the internal dueDate state
        }
      },
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
            Colors.transparent), // Transparent background for button
      ),
      child: Text(
        // If dueDate is not set (DateTime(0)), display "Set deadline"
        // Otherwise, format and display the selected date and time
        dueDate == DateTime(0)
            ? 'Set deadline'
            : '${dueDate.day.toString().padLeft(2, '0')}.${dueDate.month.toString().padLeft(2, '0')}.${dueDate.year} '
                '${dueDate.hour}:${dueDate.minute.toString().padLeft(2, '0')}',
      ),
    );
  }
}
