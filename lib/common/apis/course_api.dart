import 'package:cursos/common/entities/course.dart';
import 'package:cursos/common/utils/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );

    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/courseDetail',
      queryParameters: params?.toJson(),
    );
    print(response.toString());

    return CourseListResponseEntity.fromJson(response);
  }
}
