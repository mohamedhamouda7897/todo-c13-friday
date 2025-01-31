import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_friday/main.dart';
import 'package:todo_c13_friday/providers/my_provider.dart';
import 'package:todo_c13_friday/login/login_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routeName = "IntroScreen";

  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/app_logo.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/intro_header.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 28,
            ),
            Text(
              context.tr("introduction_title"),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(
              height: 28,
            ),
            Text(
              "introduction_desc".tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "language".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                ToggleSwitch(
                  minWidth: 73.0,
                  minHeight: 30.0,
                  initialLabelIndex: context.locale.toString() == "en" ? 0 : 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  icons: [
                    FontAwesomeIcons.flagUsa,
                    MdiIcons.abjadArabic,
                  ],
                  iconSize: 30.0,
                  activeBgColors: [
                    [
                      Theme.of(context).primaryColor,
                      Theme.of(context).secondaryHeaderColor
                    ],
                    [Colors.yellow, Colors.orange]
                  ],
                  animate: true,
                  // with just animate set to true, default curve = Curves.easeIn
                  curve: Curves.bounceInOut,
                  // animate must be set to true when using custom curve
                  onToggle: (index) {
                    if (index == 1) {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "theme".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                ToggleSwitch(
                  minWidth: 73.0,
                  minHeight: 30.0,
                  initialLabelIndex:
                      provider.themeMode == ThemeMode.light ? 0 : 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  icons: [
                    FontAwesomeIcons.lightbulb,
                    FontAwesomeIcons.moon,
                  ],
                  iconSize: 30.0,
                  activeBgColors: [
                    [
                      Theme.of(context).primaryColor,
                      Theme.of(context).secondaryHeaderColor
                    ],
                    [Colors.yellow, Colors.orange]
                  ],
                  animate: true,
                  // with just animate set to true, default curve = Curves.easeIn
                  curve: Curves.bounceInOut,
                  // animate must be set to true when using custom curve
                  onToggle: (index) {
                    provider.changeTheme();
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Theme.of(context).primaryColor),
              child: Text(
                "lets_start".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
