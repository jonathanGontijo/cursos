import 'package:cursos/common/apis/course_api.dart';
import 'package:cursos/common/entities/course.dart';
import 'package:cursos/common/widgets/flutter_toast.dart';
import 'package:cursos/pages/course/course_detail/bloc/course_detail_blocs.dart';

import 'package:cursos/pages/course/course_detail/bloc/course_detail_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CourseDetailController {
  final BuildContext context;
  CourseDetailController({
    required this.context,
  });
  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadAllData(args["id"]);
  }

  asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseApi.courseDetail(params: courseRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      } else {
        print('------- context is not available');
      }
    } else {
      toastInfo(msg: "Something went wrong");
      print('----------- Error code ${result.code}---------');
    }
  }

  void goBuy(int? id) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseApi.coursePay(params: CourseRequestEntity());
    EasyLoading.dismiss();
    if (result.code == 200) {
      var url = Uri.decodeFull(result.data!);
      print('----- my return stripe url is $url ----------');
    } else {
      print('---------- failed payment------');
    }
  }
}
