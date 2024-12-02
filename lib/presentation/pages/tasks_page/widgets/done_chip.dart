import 'package:flutter/material.dart';

class DoneChip extends StatelessWidget {
  const DoneChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const StadiumBorder(),
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(
          'Done!',
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
