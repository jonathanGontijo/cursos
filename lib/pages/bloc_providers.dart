import 'package:cursos/pages/Welcome/bloc/welcome_blocs.dart';
import 'package:cursos/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
      ];
}
