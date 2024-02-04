import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utls/app_assets.dart';
import 'package:to_do_app/core/utls/app_colors.dart';
import 'package:to_do_app/core/utls/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //date now
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Theme.of(context).textTheme.displayLarge,
              ),
               SizedBox(height: 12,),

              //Today
              Text(
                AppStrings.today,
                style: Theme.of(context).textTheme.displayLarge,
              ),

              //DatePickerTimeline
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: AppColors.white,
                dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                monthTextStyle: Theme.of(context).textTheme.displayMedium!,

                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),

              const SizedBox(height: 50,),

              //no tasks
              //const noTasksWidget(),

              InkWell(
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context){
                        return Container(
                          height: 240,
                          color: AppColors.deebGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                //Task Completed
                                SizedBox(
                                  height:48,
                                  width: double.infinity,
                                  child: CustomButton(
                                      backgroundColor: AppColors.primary,
                                      text: AppStrings.taskCompleted,
                                      onPressed: (){

                                      }),
                                ),
                                const SizedBox(height: 24,),
                                //Delete Task
                                SizedBox(
                                  height:48,
                                  width: double.infinity,
                                  child: CustomButton(
                                      text: AppStrings.deleteTask,
                                      onPressed: (){

                                      }),
                                ),
                                const SizedBox(height: 24,),
                                //Cancel
                                SizedBox(
                                  height:48,
                                  width: double.infinity,
                                  child: CustomButton(
                                    backgroundColor: AppColors.primary,
                                      text: AppStrings.cancel,
                                      onPressed: (){

                                      }),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                  child: const TaskComponent()
              ),


            ],
          ),
        ),

        //floating Action Button
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
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

        Text(AppStrings.noTaskTitle,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 24
          ),

        ),

        const SizedBox(height: 10,),

        Text(AppStrings.noTaskSubTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 133,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          //Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text
                Text('Task 1',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 8,),
                //Row
                Row(
                  children: [
                    Icon(Icons.timer,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 8,),
                    Text('09:33:pm -09:48:pm',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                //Text
                Text('Learn Dart ',
                  style: Theme.of(context).textTheme.displayLarge,
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
            child: Text(AppStrings.toDo,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
