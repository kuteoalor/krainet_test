import 'package:flutter/material.dart';
import 'package:krainet_test/presentation/pages/single_task_page/widgets/date_time_picker_dialog.dart';

class DueTimeButton extends StatefulWidget {
  final DateTime dueDate;
  final Function(DateTime) onDatePicked;
  const DueTimeButton({
    required this.dueDate,
    super.key,
    required this.onDatePicked,
  });

  @override
  State<DueTimeButton> createState() => _DueTimeButtonState();
}

class _DueTimeButtonState extends State<DueTimeButton> {
  late DateTime dueDate;

  @override
  void initState() {
    super.initState();
    dueDate = widget.dueDate;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        final date = await showDialog(
          context: context,
          builder: (context) {
            return const DateTimePickerDialog();
          },
        );
        if (date != null) {
          widget.onDatePicked(date);
          dueDate = date;
        }
      },
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      ),
      child: Text(
        dueDate == DateTime(0)
            ? 'Set deadline'
            : '${dueDate.day.toString().padLeft(2, '0')}.'
                '${dueDate.month.toString().padLeft(2, '0')}.${dueDate.year} '
                '${dueDate.hour}:${dueDate.minute.toString().padLeft(2, '0')}',
      ),
    );
  }
}
