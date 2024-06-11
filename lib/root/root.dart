import 'package:exempla_change_notifier/presenter/page/waifu_view.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(child: WaifuView()),
    );
  }
}