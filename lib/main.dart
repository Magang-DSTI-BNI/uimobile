import 'package:flutter/material.dart';
import 'package:mobileapp/Screens/login.dart';
import 'package:mobileapp/custom_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Mobile - Staff',
      home: const LoginScreen(),
      themeMode: ThemeMode.system,
      theme: CustomTheme.light(context),
      darkTheme: CustomTheme.dark(context),
      debugShowCheckedModeBanner: false,
    );
  }
}
