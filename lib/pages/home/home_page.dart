import 'package:cursos/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:cursos/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageText(
              "Olá",
              color: AppColors.primaryThridElementText,
            ),
            homePageText(
              "Jonathan",
              top: 5,
            ),
            SizedBox(
              height: 20.h,
            ),
            searchView()
          ],
        ),
      ),
    );
  }
}
