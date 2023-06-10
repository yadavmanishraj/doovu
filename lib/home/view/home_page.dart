import 'package:doovu/add_task/add_task_widget.dart';
import 'package:doovu/app/bloc/app_bloc.dart';
import 'package:doovu/shared/widgets/app_bar.dart';
import 'package:doovu/task/view/task_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: const Text("Index")),
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.connectivityResult.name),
          ));
        },
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TaskView(),
          ),
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () => addTask(context),
          child: const Icon(Icons.add),
        );
      }),
    );
  }

  addTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) => Container(
              color: const Color.fromARGB(255, 53, 53, 53),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 12.0,
                    right: 12,
                    top: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskWidget(),
              ),
            ));
  }
}

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("assets/icons/home_filled.svg"),
            icon: SvgPicture.asset("assets/icons/home.svg"),
            label: "Index"),
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("assets/icons/calendar_filled.svg"),
            icon: SvgPicture.asset("assets/icons/calendar.svg"),
            label: "Calender"),
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("assets/icons/clock_filled.svg"),
            icon: SvgPicture.asset("assets/icons/clock.svg"),
            label: "Focus"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/user.svg"), label: "Profile"),
      ],
    );
  }
}

class NoTaskWidget extends StatelessWidget {
  const NoTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/illustration/no_task.svg"),
        const Text(
          "What do you want to do today?",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Text(
          "Tap + to add your tasks",
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
