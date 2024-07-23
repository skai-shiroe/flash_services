import 'package:flutter/material.dart';
import 'home.dart'; // Importation du fichier home.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _theme = ThemeData(
    brightness: Brightness.light,
  );

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  );

  void toggleTheme() {
    setState(() {
      _theme = _theme.brightness == Brightness.dark ? _lightTheme : _darkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      debugShowCheckedModeBanner: false,
      title: 'Flash Services',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flash servics'),
          actions: [
            IconButton(
              onPressed: () => toggleTheme(),
              icon: const Icon(Icons.dark_mode),
            )
          ],
        ),
        body: const HomePage(),
      ),
    );
  }
}
