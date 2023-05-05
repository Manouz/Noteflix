import 'package:flutter/material.dart';
import 'package:noteflix/Repository/data_repository.dart';
import 'package:noteflix/UI/Screens/Home_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  //rendre la classe DataRepository accessible partout dans l'apk  
  ChangeNotifierProvider(
    create: (context)=> DataRepository(),
    child: const MyApp(),
  );
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Netflix",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home_Screen(),
    );
  }
}
