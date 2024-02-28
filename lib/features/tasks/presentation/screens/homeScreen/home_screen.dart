import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/commons_fun/commons.dart';
import 'package:to_do_app/core/utls/app_assets.dart';
import 'package:to_do_app/core/utls/app_colors.dart';
import 'package:to_do_app/core/utls/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/features/tasks/Data/model/task_model.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_state.dart';
import 'package:to_do_app/features/tasks/presentation/screens/add_task_screen/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //date now
                  Row(
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<TaskCubit>(context).changeTheme();
                        },
                        icon: Icon(
                          Icons.mode_night,
                          color: BlocProvider.of<TaskCubit>(context).isDark
                              ? AppColors.white
                              : AppColors.background,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  //Today
                  Text(
                    AppStrings.today,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),

                  //DatePickerTimeline
                  DatePicker(
                    height:100,
                    width:80,
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primary,
                    selectedTextColor: AppColors.white,
                    dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                    dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                    monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                    onDateChange: (date) {
                      BlocProvider.of<TaskCubit>(context).getSelectedDate(date);
                    },
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  //no tasks
                  BlocProvider.of<TaskCubit>(context).taskList.isEmpty
                      ? const noTasksWidget()
                      : Expanded(
                          child: ListView.builder(
                              itemCount: BlocProvider.of<TaskCubit>(context)
                                  .taskList
                                  .length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 240,
                                              color: AppColors.deebGrey,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(24.0),
                                                child: Column(
                                                  children: [
                                                    //**************Task Completed
                                                    BlocProvider.of<TaskCubit>(
                                                                    context)
                                                                .taskList[index]
                                                                .isCompleted ==
                                                            1
                                                        ? Container()
                                                        : SizedBox(
                                                            height: 48,
                                                            width:
                                                                double.infinity,
                                                            child: CustomButton(
                                                                backgroundColor:
                                                                    AppColors
                                                                        .primary,
                                                                text: AppStrings
                                                                    .taskCompleted,
                                                                onPressed: () {
                                                                  BlocProvider.of<
                                                                              TaskCubit>(
                                                                          context)
                                                                      .updateTask(BlocProvider.of<TaskCubit>(
                                                                              context)
                                                                          .taskList[
                                                                              index]
                                                                          .id);
                                                                  Navigator.pop(
                                                                      context);
                                                                }),
                                                          ),
                                                    const SizedBox(
                                                      height: 24,
                                                    ),
                                                    //**************************Delete Task
                                                    SizedBox(
                                                      height: 48,
                                                      width: double.infinity,
                                                      child: CustomButton(
                                                          text: AppStrings
                                                              .deleteTask,
                                                          onPressed: () {
                                                            BlocProvider.of<
                                                                        TaskCubit>(
                                                                    context)
                                                                .deleteTask(BlocProvider.of<
                                                                            TaskCubit>(
                                                                        context)
                                                                    .taskList[
                                                                        index]
                                                                    .id);
                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                    ),
                                                    const SizedBox(
                                                      height: 24,
                                                    ),
                                                    //Cancel
                                                    SizedBox(
                                                      height: 48,
                                                      width: double.infinity,
                                                      child: CustomButton(
                                                          backgroundColor:
                                                              AppColors.primary,
                                                          text:
                                                              AppStrings.cancel,
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: TaskComponent(
                                      taskModel:
                                          BlocProvider.of<TaskCubit>(context)
                                              .taskList[index],
                                    ));
                              }),
                        ),
                ],
              );
            },
          ),
        ),

        //floating Action Button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigate(context: context, screen: AddTaskScreen());
          },
          backgroundColor: AppColors.primary,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Column noTasksWidget(BuildContext context) {
  //   return ;
  // }
}

class noTasksWidget extends StatelessWidget {
  const noTasksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.noTasks),
        Text(
          AppStrings.noTaskTitle,
          style:
              Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.noTaskSubTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;
  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blueGrey;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.orange;
      case 5:
        return AppColors.purple;
      default:
        return AppColors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 135,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: getColor(taskModel.color),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          //Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title
                Text(
                  taskModel.title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                //Row
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: AppColors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${taskModel.startTime} - ${taskModel.endTime}',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                //Note
                Text(
                  taskModel.note,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
          //Divider
          Container(
            height: 75,
            width: 1,
            color: AppColors.white,
            margin: const EdgeInsets.only(right: 10),
          ),
          //Text
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              taskModel.isCompleted == 1
                  ? AppStrings.completed
                  : AppStrings.toDo,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
