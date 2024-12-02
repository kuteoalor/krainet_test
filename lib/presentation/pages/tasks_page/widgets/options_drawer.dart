import 'package:flutter/material.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/log_out_button.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/theme_button.dart';

class OptionsDrawer extends StatelessWidget {
  const OptionsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: ThemeButton(),
            ),
            ListTile(
              title: LogOutButton(),
            ),
          ],
        ),
      ),
    );
  }
}
