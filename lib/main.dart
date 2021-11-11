import 'package:flutter/material.dart';
import 'package:mobileapp/Screens/login.dart';
import 'package:mobileapp/Variables/custom_theme.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            title: 'UI Mobile - Staff',
            home: const LoginScreen(),
            themeMode: themeProvider.themeMode,
            theme: CustomTheme.light(context),
            darkTheme: CustomTheme.dark(context),
            debugShowCheckedModeBanner: false,
          );
        },
      );
}
