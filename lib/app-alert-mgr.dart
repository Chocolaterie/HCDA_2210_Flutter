import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class AppAlertMgr {

  static final AppAlertMgr _instance = AppAlertMgr._internal();
  AppAlertMgr._internal();
  factory AppAlertMgr(){
    return _instance;
  }

  ProgressDialog? pd;

  void showProgress(BuildContext context, String message, {Color barrierColor = const Color(0x77000000)}){
    pd = ProgressDialog(context: context);

    // Display progress
    pd!.show(
    msg: message,
    progressBgColor: Colors.transparent,
    elevation: 10.0,
    barrierColor: barrierColor);
  }

  void closeProgress(){
    pd!.close();
  }
}