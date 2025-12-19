import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postman/core/common/widgets/bottom_nav_bar.dart';
import 'package:postman/core/theme/app_theme.dart';
import 'package:postman/core/theme/app_theme_enum.dart';
import 'package:postman/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Postman',
      theme: getThemeData(appTheme: AppTheme.blue, isDarkMode: false),
      home: const BottomNavBar(),
    );
  }
}
