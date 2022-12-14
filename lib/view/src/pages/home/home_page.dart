import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/palette.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.arrow_back_ios_new_rounded),
        title: const Text('Sort & Filter'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                'Reset',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Palette.primaryColor,
                ),
              ),
            ),
          ),
        ],
      );
}
