

import 'package:flutter/material.dart';
import 'package:subha/pages/start_home_page.dart';



void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showSemanticsDebugger: true,
      // showPerformanceOverlay: true,
      // debugShowMaterialGrid: true,
    
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: const StartHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


