import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_persistent/controllers/providers/theme_provider.dart';
import 'package:theme_persistent/views/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: (Provider.of<ThemeProvider>(context).themeModel.isDark)
                ? ThemeMode.dark
                : ThemeMode.light,
            routes: {
              "/": (context) => HomePage(),
            },
          );
        }),
  );
}
