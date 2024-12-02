import 'package:flutter/material.dart';

class DateTimePickerDialog extends StatefulWidget {
  const DateTimePickerDialog({
    super.key,
  });

  @override
  State<DateTimePickerDialog> createState() => _DateTimePickerDialogState();
}

class _DateTimePickerDialogState extends State<DateTimePickerDialog> {
  TimeOfDay pickedTime =
      TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1);
  DateTime pickedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Set due date',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          //const Divider(),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2099),
                );
                if (date != null) {
                  setState(() {
                    pickedDate = date;
                  });
                }
              },
              child: Text(
                '${pickedDate.day}.${pickedDate.month}.${pickedDate.year}',
              ),
            ),
          ),
          //const Divider(),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child!,
                    );
                  },
                );
                if (time != null) {
                  setState(() {
                    pickedTime = time;
                  });
                }
              },
              child: Text(
                '${pickedTime.hour.toString().padLeft(2, '0')}:'
                '${pickedTime.minute.toString().padLeft(2, '0')}',
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
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
