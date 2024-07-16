import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_persistent/controllers/providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme App"),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeProvider>(context).themeModel.isDark,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
