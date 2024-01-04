import 'package:cursos/common/routes/names.dart';
import 'package:cursos/pages/Welcome/bloc/welcome_blocs.dart';
import 'package:cursos/pages/Welcome/welcome.dart';
import 'package:cursos/pages/application/application_page.dart';
import 'package:cursos/pages/application/bloc/app_blocs.dart';
import 'package:cursos/pages/register/bloc/register_blocs.dart';
import 'package:cursos/pages/register/register.dart';
import 'package:cursos/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:cursos/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBlocs(),
        ),
      ),
    ];
  }

  static allBlocProviders(BuildContext context) {
    var blocProviders = [];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

//a modal that cover entire screen as we click
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

//unify blocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}