import 'package:flutter/material.dart';
import 'package:to_do_list/screens/home.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoList',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      builder: (context, child) { 
        return MediaQuery(
         data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
         child: child!,
       );
      },
    );
  }
}
