import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/splash/view_model/view_model.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  final viewModel = Get.put(SplashViewModel());

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      widget.viewModel.verifySession();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: Container());
  }
}
