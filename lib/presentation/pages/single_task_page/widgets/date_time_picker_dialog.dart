import 'package:flutter/material.dart';

class DateTimePickerDialog extends StatefulWidget {
  const DateTimePickerDialog({super.key});

  @override
  State<DateTimePickerDialog> createState() => _DateTimePickerDialogState();
}

class _DateTimePickerDialogState extends State<DateTimePickerDialog> {
  // Initialize picked time to be the current time + 1 hour.
  TimeOfDay pickedTime =
      TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1);

  // Initialize picked date to the current date.
  DateTime pickedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title text to indicate the purpose of the dialog
          const Text(
            'Set due date',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          // Button to pick a date
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () async {
                // Show date picker dialog
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2099),
                );
                // If a date is picked, update pickedDate
                if (date != null) {
                  setState(() {
                    pickedDate = date;
                  });
                }
              },
              child: Text(
                // Display selected date in day.month.year format
                '${pickedDate.day}.${pickedDate.month}.${pickedDate.year}',
              ),
            ),
          ),
          // Button to pick a time
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () async {
                // Show time picker dialog
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    // Use 24-hour format in time picker
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child!,
                    );
                  },
                );
                // If a time is picked, update pickedTime
                if (time != null) {
                  setState(() {
                    pickedTime = time;
                  });
                }
              },
              child: Text(
                // Display selected time in HH:mm format
                '${pickedTime.hour.toString().padLeft(2, '0')}:'
                '${pickedTime.minute.toString().padLeft(2, '0')}',
              ),
            ),
          ),
        ],
      ),
      actions: [
        // Cancel button to close the dialog without saving the selected date and time
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        // Save button to confirm the selected date and time
        ElevatedButton(
          onPressed: () {
            // Return the selected DateTime object to the calling widget
            Navigator.of(context).pop(
              DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
                pickedTime.hour,
                pickedTime.minute,
              ),
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
