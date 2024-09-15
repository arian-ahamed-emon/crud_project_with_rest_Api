import 'package:basic_api/screens/product_list.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Home',
      home: ProductListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
