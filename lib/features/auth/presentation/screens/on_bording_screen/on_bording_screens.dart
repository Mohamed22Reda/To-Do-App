import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utls/app_colors.dart';
import 'package:to_do_app/core/utls/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/features/auth/data/models/on_boarding_model.dart';

class OnBordingScreens extends StatelessWidget {
   OnBordingScreens({super.key});

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,

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
                  child: TextButton(
                      onPressed: ()
                      {
                        controller.jumpToPage(2);
                      },
                      child: Text(AppStrings.skip,
                        style:GoogleFonts.lato(
                          color: AppColors.white.withOpacity(.44),
                          fontSize: 16,
                        ),)
                  ),
                ):SizedBox(height: 54,),
                SizedBox(height: 16,),
                // image
                Image.asset(OnBoardingModel.onBoardingScreens[index].imgPath),

                SizedBox(height: 16,),
                // dots
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primary,
                    dotHeight: 10,
                    //dotColor: Colors.red,
                    //dotWidth: 8,
                    spacing: 8,
                  ),
                ),

                SizedBox(height: 52,),

                // title
                Text(OnBoardingModel.onBoardingScreens[index].title,
                  style: GoogleFonts.lato(
                    color: AppColors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,),
                ),

                SizedBox(height: 42,),

                // subtitle
                Text(
                  OnBoardingModel.onBoardingScreens[index].subTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: AppColors.white,
                    fontSize: 16,),
                ),

                // back button
                SizedBox(height: 100,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    index != 0 ? TextButton(
                        onPressed: ()
                        {
                          controller.previousPage(
                              duration: const Duration(milliseconds: 500) ,
                              curve: Curves.fastOutSlowIn);
                        },
                        child: Text(AppStrings.back,
                          style:GoogleFonts.lato(
                            color: AppColors.white.withOpacity(.44),
                            fontSize: 16,
                          ),)
                    ):Container(),

                    //next button
                    index != 2 ? ElevatedButton(
                      onPressed: ()
                      {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500) ,
                            curve: Curves.fastOutSlowIn);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Text(AppStrings.next,
                        style:GoogleFonts.lato(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ): ElevatedButton(
                      onPressed: ()
                      {
                        //Navegate to home screeen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Text(AppStrings.getStarted,
                        style:GoogleFonts.lato(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
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


