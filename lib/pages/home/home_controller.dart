import 'package:cursos/common/entities/user.dart';
import 'package:cursos/common/service/storage_service.dart';
import 'package:cursos/global.dart';
import 'package:flutter/material.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});
  UserItem userProfile = Global.storageService.getUserProfile();
  void init() {
    print("...home controller init method...");
  }
}
