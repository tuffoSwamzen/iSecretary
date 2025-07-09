import 'package:flutter/material.dart';
import 'package:todo_app/features/calender/presentation/pages/calender_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: CalenderPage()));
  }
}
