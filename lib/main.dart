import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_to_be_free/screens/login.dart';
import './config/routes/app_routes.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  //GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(const MyApp());
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //////////////////////////
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      //////////////////////////
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      //home: LoginScreen(),
      routerConfig: goRouter,
    );
  }
}

/*
Could possible make a file with metadata that standardizes aspects of the project
  - the margin/padding lengths,
  - the colors that we want to use over the entirety of the project 
  - fontsizes and fontstyles (Header text, Body text, Title text?)
  - 
*/
 