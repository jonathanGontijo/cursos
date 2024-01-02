import 'package:cursos/pages/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: reusableText(
                        "Entre com os dados abaixo para registrar")),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Nome de usuário"),
                      buildTextField(
                          "Entre com seu nome de usuário", "username", "user",
                          (value) {
                        //context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                      reusableText("Email"),
                      buildTextField("Entre com sue email", "email", "user",
                          (value) {
                        //context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                      reusableText("Senha"),
                      buildTextField("Entre com sua senha", "password", "lock",
                          (value) {
                        //context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                      reusableText("Confirmar senha"),
                      buildTextField("Entre com sua senha", "password", "lock",
                          (value) {
                        //context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                      reusableText(
                          "Para criar a conta você precisa concordar com os termos."),
                    ],
                  ),
                ),
                buildLogInAndRegButton("Sign Up", "login", () {
                  Navigator.of(context).pushNamed("register");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
