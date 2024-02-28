import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/commons_fun/commons.dart';
import 'package:to_do_app/core/database/cach/cach_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/core/utls/app_colors.dart';
import 'package:to_do_app/core/utls/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/core/widgets/custom_text_button.dart';
import 'package:to_do_app/features/auth/data/models/on_boarding_model.dart';
import 'package:to_do_app/features/tasks/presentation/screens/homeScreen/home_screen.dart';

class OnBordingScreens extends StatelessWidget {
   OnBordingScreens({super.key});

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: AppColors.background,

        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PageView.builder(
            controller: controller,
            itemCount: OnBoardingModel.onBoardingScreens.length,
            itemBuilder: (context,index){
              return Column(children: [
                
                // skip button
                index != 2 ? Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextButton(
                      text: AppStrings.skip,
                      
                      onPressed: ()
                      {
                        controller.jumpToPage(2);
                      }
                  ),
                ):SizedBox(height: 54.h,),
                SizedBox(height: 16.h,),
                // image
                Image.asset(OnBoardingModel.onBoardingScreens[index].imgPath),

                SizedBox(height: 16.h,),
                // dots
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primary,
                    dotHeight: 10.h,
                    //dotColor: Colors.red,
                    //dotWidth: 8,
                    spacing: 8,
                  ),
                ),

                SizedBox(height: 52.h,),

                // title
                Text(OnBoardingModel.onBoardingScreens[index].title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),

                SizedBox(height: 42.h,),

                // subtitle
                Text(
                  OnBoardingModel.onBoardingScreens[index].subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),

                // back button
                SizedBox(height: 100.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    index != 0 ? CustomTextButton(
                        text: AppStrings.back,
                        onPressed: ()
                            {
                              controller.previousPage(
                                  duration: const Duration(milliseconds: 500) ,
                                  curve: Curves.fastOutSlowIn);
                            }) : Container(),
                    //next button
                    index != 2 ? CustomButton(
                      text: AppStrings.next,
                      onPressed: ()
                        {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500) ,
                              curve: Curves.fastOutSlowIn);
                        }
                    ) : CustomButton(
                        text: AppStrings.getStarted,
                        onPressed: () async{
                          //navigate to home screen
                          await sl<CacheHelper>().saveData(
                              key: AppStrings.onBoardingKey,
                              value: true).then((value) {
                                navigate(context: context, screen: const HomeScreen());
                          });

                        }),
                  ],
                ),
              ],);
            },
          ),
        ),
      ),
    );
  }
}


