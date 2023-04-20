library mimundoupc;

import 'package:flutter/material.dart';
import 'package:marvel/core/di/injector.dart';
import 'package:marvel/app/home/home_screen.dart';
import 'package:marvel/core/theme/app_theme.dart';


class LApp extends StatelessWidget {
  const LApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Marvel App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.commonTheme,
      home: const HomeScreen(),
    );
  }
}

Future<void> main() async {
  await configure(dev.name);
  runApp(const LApp());
}
