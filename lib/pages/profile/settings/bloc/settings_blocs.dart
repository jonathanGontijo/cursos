import 'package:cursos/pages/profile/settings/bloc/settings_states.dart';
import 'package:cursos/pages/profile/settings/bloc/settings_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBlocs extends Bloc<SettingEvents, SettingStates> {
  SettingsBlocs() : super(const SettingStates()) {
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingEvents events, Emitter<SettingStates> emit) {
    emit(const SettingStates());
  }
}
