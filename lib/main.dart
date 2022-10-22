
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/data.dart';
import 'package:flutter_application_1/ui/new_account_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
        backgroundColor: const Color.fromARGB(225, 229, 249, 238),
         elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          )),
          textStyle: MaterialStateProperty.all(const TextStyle(
              color: Color(0xff26da76), fontWeight: FontWeight.bold)),
          backgroundColor: MaterialStateProperty.all(const Color(0xffdaedea)),
          shadowColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
       // brightness:  Color.fromARGB(255, 139, 195, 240),
      ),
           localizationsDelegates:const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar', '')],

        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
      home:  FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.toString() == 'EMPTY_TOKEN') {
              return  NewAccount();
            } else {
              return DataUI();
            }
          } else {
            return const NewAccount();
          }
        },
        future: tokenCall(),
      ),
    );
  }
    Future<String> tokenCall() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('backend_token') ?? 'EMPTY_TOKEN';
  }
}


