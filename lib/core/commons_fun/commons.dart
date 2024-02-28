import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/core/utls/app_colors.dart';

void navigate({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
}

void showToast({required String message, required ToastState state}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0);
}
enum ToastState{error, success, warning}
Color getState(ToastState state){
  switch(state){
    case ToastState.error: return AppColors.red;
    case ToastState.success :return AppColors.primary;
    case ToastState.warning :return AppColors.orange;
  }
}
