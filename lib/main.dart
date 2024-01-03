import 'package:curv/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(411, 821),
    builder: (context, widget) => _SeatFinder(),
  ));
}

class _SeatFinder extends StatelessWidget {
  const _SeatFinder({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seat Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade200),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
