import 'package:cursos/common/apis/course_api.dart';
import 'package:cursos/common/entities/course.dart';
import 'package:cursos/common/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';

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
    } else {
      toastInfo(msg: "Something went wrong");
      print('----------- Error code ${result.code}---------');
    }
  }
}
