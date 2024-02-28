import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/commons_fun/commons.dart';
import 'package:to_do_app/core/utls/app_colors.dart';
import 'package:to_do_app/core/utls/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/features/tasks/presentation/components/add_task_component.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_state.dart';

class AddTaskScreen extends StatelessWidget{
  const AddTaskScreen({super.key});


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          color: AppColors.primary,
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          AppStrings.addTask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<TaskCubit,TaskState>(
            listener: (context,state){
              if(state is InsertTaskSuccessState){
                showToast(message: "Added Successfully ", state: ToastState.success);
                Navigator.pop(context);
              }
            },
            builder: (context,state){
              final cubit = BlocProvider.of<TaskCubit>(context);
              return Form(
                key: BlocProvider.of<TaskCubit>(context).formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Title ///////////////////////

                    AddTaskComponent(
                        title: AppStrings.title,
                        hintText: AppStrings.titleHint,
                        validator: (val){
                          if(val!.isEmpty){
                            return AppStrings.titleErrorMsg;
                          }
                          return null;
                        },
                        controller: BlocProvider.of<TaskCubit>(context).titleController
                    ),
                    SizedBox(height: 24.h,),

                    //! Note ///////////////////////
                    AddTaskComponent(
                      controller: BlocProvider.of<TaskCubit>(context).noteController,
                        title: AppStrings.note,
                        hintText: AppStrings.noteHint,
                      validator: (val){
                        if(val!.isEmpty){
                          return AppStrings.noteErrorMsg;
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 24.h,),

                    //! Date ///////////////////////
                    AddTaskComponent(
                      title: AppStrings.date,
                      hintText: DateFormat.yMd().format(cubit.currentDate),
                      readOnly: true,
                      suffixIcon: IconButton(
                        onPressed: () async{
                          cubit.gitDate(context);
                        },
                        icon:  Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.primary,
                        ),
                      ),

                    ),
                    SizedBox(height: 24.h,),

                    //! Start End Time ///////////////////////
                    Row(
                      children: [
                        Expanded(child: AddTaskComponent(
                          title: AppStrings.startTime,
                          hintText: BlocProvider.of<TaskCubit>(context).startTime,
                          readOnly: true,
                          suffixIcon: IconButton(
                            onPressed: () async
                            {
                              cubit.getStartTime(context);
                            },
                            icon: Icon(
                              Icons.timer_outlined,
                              color: AppColors.primary,
                            ),
                          ),
                        ),

                        ),
                        SizedBox(width: 26.w,),

                        //!  End Time ///////////////////////
                        Expanded(child: AddTaskComponent(
                          title: AppStrings.endTime,
                          hintText: BlocProvider.of<TaskCubit>(context).endTime,
                          readOnly: true,
                          suffixIcon: IconButton(
                            onPressed: () async
                            {
                              cubit.getEndTime(context);
                            },
                            icon: Icon(
                              Icons.timer_outlined,
                              color: AppColors.primary,
                            ),
                          ),
                        ),

                        ),
                      ],
                    ),
                    SizedBox(height: 24.h,),

                    //! Choose Color ///////////////////////
                    SizedBox(
                      height: 68.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.color,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                separatorBuilder: (context,index)=> const SizedBox(width: 8,),
                                itemBuilder: (context,index) {

                                  return GestureDetector(
                                    onTap: (){
                                      cubit.changeCheckMarkIndex(index);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: BlocProvider.of<TaskCubit>(context).getColor(index),
                                      child: index==BlocProvider.of<TaskCubit>(context).currentIndex
                                          ? const Icon(Icons.check):null,
                                    ),
                                  );
                                }
                            ),
                          ),
                        ],
                      ),
                    ),

                    //! Add Task Button ///////////////////////
                    SizedBox(height: 95.h,),

                    state is InsertTaskLoadingState?CircularProgressIndicator(color: AppColors.primary,):
                    SizedBox(
                      height: 48.h,
                      width: double.infinity,
                      child: CustomButton(
                        text: AppStrings.createTask,
                        onPressed: (){
                          if(BlocProvider.of<TaskCubit>(context).formKey.currentState!.validate()){
                            BlocProvider.of<TaskCubit>(context)
                                .insertTask();

                          }
                        },
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
