import 'package:flutter/material.dart';
import 'package:uimobile_web/screen/informasi_pribadi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'UI Mobile - Staff',
      home: InformasiPribadiScreen(),
      // themeMode: ThemeMode.system,
      // theme: CustomTheme.light(context),
      // darkTheme: CustomTheme.dark(context),
      debugShowCheckedModeBanner: false,
    );
  }
}

