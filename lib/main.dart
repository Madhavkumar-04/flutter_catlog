import 'package:flutter/material.dart';
import 'package:flutter_catlog/utils/routes.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme:MyTheme.darkTheme(context),
      routes:{
        MyRoutes.homePage :(context)=> const HomePage(),
        MyRoutes.loginPage :(context)=> const LoginPage(),
      },
      initialRoute: MyRoutes.homePage,
    );
  }
}
