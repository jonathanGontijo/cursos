import 'package:cursos/common/values/colors.dart';
import 'package:cursos/common/widgets/base_text_widget.dart';
import 'package:cursos/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:cursos/pages/course/course_detail/bloc/course_detail_states.dart';
import 'package:cursos/pages/course/course_detail/course_detail_controller.dart';

import 'package:flutter/material.dart';
import 'package:cursos/pages/course/widgets/course_detail_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late CourseDetailController _courseDetailController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    print("------- my build method ---------");
    return BlocBuilder<CourseDetailBloc, CourseDetailStates>(
        builder: (context, state) {
      return state.courseItem == null
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            )
          : Container(
              color: Colors.white,
              child: SafeArea(
                child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: buildAppBar(),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.h,
                              horizontal: 25.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                thumbNail(state),
                                SizedBox(height: 15.h),
                                menuView(),
                                SizedBox(height: 15.h),
                                reusableText("Descrição do Curso"),
                                SizedBox(height: 15.h),
                                descriptionText(state),
                                SizedBox(height: 20.h),
                                goBuyButton("Comprar"),
                                SizedBox(height: 20.h),
                                courseSummaryTitle(),
                                //SizedBox(height: 15.h),
                                courseSummaryView(context, state),
                                SizedBox(height: 20.h),
                                reusableText("Lista de Lição"),
                                SizedBox(height: 20.h),
                                courseLessonList()
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            );
    });
  }
}
