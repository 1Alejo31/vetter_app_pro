import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vetter_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => false);

//Listado de colores inmutable Provider -> para valores inmutables
final colorListProvider = Provider((ref) => colorList);

//Un simple int StateProvider -> para cambios de estado
final selectedColorProvider = StateProvider((ref) => 0);

//Creando  un objeto de tipo AppTheme -> para objetos mas elavorados
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //super(AppTheme()) Se le indica que cree la primera instancia de AppTheme
  ThemeNotifier() : super(AppTheme());

  void toogleDarkmode() {
    state = state.copyWhith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWhith(selectedColor: colorIndex);
  }
}
