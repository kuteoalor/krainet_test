import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/pages/single_task_page/single_task_page.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/filter_bar.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/options_drawer.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/sort_button.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/tasks_list.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          SortButton(),
        ],
      ),
      drawer: const OptionsDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SingleTaskPage(
                task: TaskModel.empty(),
                creating: true,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            FilterBar(),
            TasksList(),
          ],
        ),
      ),
    );
  }
}
