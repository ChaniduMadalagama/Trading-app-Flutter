import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayas_capital/Controller/app_controller/niftyBank_controller.dart';
import 'package:prayas_capital/Controller/app_theme/DarkTheme.dart';
import 'package:provider/provider.dart';
import 'Controller/app_theme/LigthTheme.dart';
import 'Controller/app_theme/ThemeModel.dart';
import 'core/app_export.dart';
import 'firebase_options.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]));

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeModel themeModel = ThemeModel();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ThemeModel(),),
            ChangeNotifierProvider(create: (context) => NiftyBankController(),),
          ],
          child: Builder(
            builder: (context) {
              return Consumer<ThemeModel>(
                builder: (BuildContext context, value, Widget? child) {
               //   print("Matiria is calling //////////");
                  themeModel.checkTheme();
                 // print("themeModel.checkThemeShared >> ${themeModel.checkThemeShared}");
                  return MaterialApp(
                    theme: value.checkThemeShared == true ? lightTheme : darkTheme,
                    title: 'prayas_capital',
                    debugShowCheckedModeBanner: false,
                    initialRoute: AppRoutes.splashScreen,
                    routes: AppRoutes.routes,
                  );
                },
                //child:
              );
            }
          ),
        );
      },
    );
  }
}
