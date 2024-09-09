import 'package:flutter/material.dart';
import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/pages/cart_page.dart';
import 'package:flutter_catlog/pages/homeDetail_page.dart';
import 'package:flutter_catlog/utils/routes.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
void main(){
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(),child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme:MyTheme.darkTheme(context),
      routes:{
        "/":(context)=>LoginPage(),
        MyRoutes.homePage :(context)=> const HomePage(),
        MyRoutes.loginPage :(context)=> const LoginPage(),
        // MyRoutes.homeDetailsPage :(context)=>const HomedetailPage(catelog: null,);
        MyRoutes.cartPage : (context)=> const CartPage()
      },
      // initialRoute: MyRoutes.homePage,
    );
  }
}
