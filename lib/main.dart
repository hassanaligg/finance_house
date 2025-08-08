import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:finance_house/core/di/app_bindings.dart';
import 'package:finance_house/core/di/hive_init.dart';
import 'package:finance_house/core/di/providers.dart';
import 'package:finance_house/resources/app_theme.dart';
import 'package:finance_house/routes/app_pages.dart';
import 'package:finance_house/utils/helpers/helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  configureDependencies();
  await setupHive();
  setDeviceOrientation();
  runApp(MultiBlocProvider(providers: createProviders(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: route,
            builder: FToastBuilder(),
            theme: appThemeData(),
          );
        });
  }
}
