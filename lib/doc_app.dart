import 'package:doctor_appointment/features/on_boarding/presentation/on_boarding.dart';
import 'package:flutter/material.dart';

class DocDoc extends StatelessWidget {
  const DocDoc({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnBoarding(),
    );
  }
}