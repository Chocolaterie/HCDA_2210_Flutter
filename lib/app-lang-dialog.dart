import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:tp_twitter/app-alert-mgr.dart';
import 'package:tp_twitter/main.dart';

class AppLangDialog extends StatelessWidget {

  void onClickLang(BuildContext context, String countryCode) async {
    var myAppState = context.findAncestorStateOfType<MyAppState>();
    // Chargement de langue
    AppAlertMgr().showProgress(context, "loading-change-lang".i18n(), barrierColor: Color(0xFFAAAAAA));

    // On att 1 sec
    await Future.delayed(Duration(milliseconds:  500));

    // Changement
    myAppState!.changeLang(countryCode);

    // On att 1 sec
    await Future.delayed(Duration(milliseconds:  500));

    // Fermer la boite de chargement
    AppAlertMgr().closeProgress();

    // Fermer la boite de dialogue
    Navigator.pop(context);
  }

  Widget buildLangButton(
      BuildContext context, String countryCode, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: () => onClickLang(context, countryCode), child: Text(label)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("label-choose-lang".i18n()),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            buildLangButton(context, 'fr', 'French'),
            buildLangButton(context, 'en', 'English'),
            buildLangButton(context, 'zh', 'Chinese'),
          ],
        ),
      ),
    );
  }
}
