import 'package:postman/core/theme/app_theme.dart';
import 'package:postman/core/theme/app_theme_enum.dart';
import 'package:postman/features/shipment/view/pages/shipment_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Postman',
      theme: getThemeData(appTheme: AppTheme.blue, isDarkMode: false),
      home: const ShipmentView(),
    );
  }
}
