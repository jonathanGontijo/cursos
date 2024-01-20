import 'dart:convert';

import 'package:cursos/common/apis/user_api.dart';
import 'package:cursos/common/entities/entities.dart';
import 'package:cursos/common/values/constant.dart';
import 'package:cursos/common/widgets/flutter_toast.dart';
import 'package:cursos/global.dart';
import 'package:cursos/pages/home/home_controller.dart';
import 'package:cursos/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInController {
  final BuildContext context;
  const SignInController({
    required this.context,
  });

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAdress = state.email;
        String password = state.password;
        if (emailAdress.isEmpty) {
          toastInfo(msg: "Campo de Email vazio");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Campo de senha vazio");
          return;
        }
        try {
          final crendential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAdress,
            password: password,
          );
          if (crendential.user == null) {
            toastInfo(msg: "Usuário não encontrado");
            return;
          }
          if (!crendential.user!.emailVerified) {
            toastInfo(msg: "Usuário não verificado");
            return;
          }
          var user = crendential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.type = 1;

            asyncPostAllData(loginRequestEntity);
            if (context.mounted) {
              await HomeController(context: context).init();
            }

            // we got verified user from firebase

            // toastInfo(msg: "Usuário confirmado");
            // return;
          } else {
            // we have error getting user from firebase
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "Usuario nao encontrado por esse email");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "wrong password for this user");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "your email format is wrong");
            return;
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(params: loginRequestEntity);
    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();
        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/application", (route) => false);
        }
      } catch (e) {
        print('Saving local storage error ${e.toString()}');
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "Error desconhecido");
    }
  }
}
