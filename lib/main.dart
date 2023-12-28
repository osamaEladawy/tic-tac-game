import 'package:flutter/material.dart' ;
import 'package:provider/provider.dart' ;
import 'package:tic_tac/routes/game.dart';
import 'package:tic_tac/routes/home.dart' ;
import 'package:tic_tac/routes/style_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>Game(),
      child:  MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: MainColor.primaryColor,
          appBarTheme: AppBarTheme(
            backgroundColor: MainColor.primaryColor,
            centerTitle: true,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )
          )
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
