import 'package:bloc/bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDark: false));
  void toggleTheme() {
    emit(ThemeState(isDark: !state.isDark));
  }
}
