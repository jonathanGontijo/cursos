import 'package:cursos/common/widgets/flutter_toast.dart';
import 'package:cursos/pages/register/bloc/register_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Nome de usuário não pode estar vazio.");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email não pode estar vazio.");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Senha não pode estar vazio.");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Sua confirmação de senha esta errada.");
      return;
    }

    try {
      final crendential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (crendential.user != null) {
        await crendential.user?.sendEmailVerification();
        await crendential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "Um email foi enviado para ativar a conta,por favor check sua caixa de email e click no link.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "A senha de usuário é muito fraca");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "O Email já esta em uso");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "O Email está inválido");
      }
    }
  }
}
