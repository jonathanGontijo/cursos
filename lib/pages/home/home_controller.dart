import 'package:cursos/common/apis/course_api.dart';
import 'package:cursos/common/entities/user.dart';
import 'package:cursos/common/service/storage_service.dart';
import 'package:cursos/global.dart';
import 'package:cursos/pages/home/bloc/home_page_blocs.dart';
import 'package:cursos/pages/home/bloc/home_page_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController {
  late BuildContext context;
  UserItem? userProfile = Global.storageService.getUserProfile();

  static final HomeController _singleton = HomeController._external();
  HomeController._external();

  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseApi.courseList();
      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }
      } else {
        print(result.code);
      }
    } else {
      print("User has already logged out");
    }
  }
}
