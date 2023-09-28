import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vetter_app/src/presentation/theme/theme_provider.dart';
import 'package:vetter_app/src/widgets/button_app.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool stateDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toogleDarkmode();
              },
              icon: stateDarkmode
                  ? const Icon(
                      Icons.light_mode_outlined,
                      color: Colors.deepPurpleAccent,
                    )
                  : const Icon(
                      Icons.dark_mode_outlined,
                      color: Colors.deepPurpleAccent,
                    ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _textWelcom(),
                _textApp(),
                _textInfo(stateDarkmode),
                _imageHome(size),
                _buttonLogin(context),
                _buttonRegister(context)
              ],
            ),
          ),
        ));
  }
}

Widget _imageHome(size) {
  return Center(
    child: SizedBox(
      height: size.height * 0.5,
      width: size.width * 1,
      child: Image.asset(
        'assets/img/dog2.png',
      ),
    ),
  );
}

Widget _textInfo(stateDarkmode) {
  return Container(
    margin: const EdgeInsets.only(left: 25),
    alignment: Alignment.topLeft,
    child: Text(
      'Las veterinarias a tu alcance',
      style: TextStyle(
          color: stateDarkmode ? Colors.white : Colors.black54,
          fontSize: 20,
          fontWeight: FontWeight.w400),
    ),
  );
}

Widget _textApp() {
  return Container(
    margin: const EdgeInsets.only(left: 25),
    alignment: Alignment.topLeft,
    child: ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Colors.deepPurpleAccent,
            Color.fromARGB(255, 23, 10, 60),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      child: const Text(
        'Vetter App',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w900,
          color: Colors.white, // Color del texto
        ),
      ),
    ),
  );
}

Widget _textWelcom() {
  return Container(
    margin: const EdgeInsets.only(left: 25),
    alignment: Alignment.topLeft,
    child: ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Colors.deepPurpleAccent,
            Color.fromARGB(255, 23, 10, 60),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      child: const Text(
        'Bienvenido a',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w600,
          color: Colors.white, // Color del texto
        ),
      ),
    ),
  );
}

Widget _buttonLogin(BuildContext context) {
  return ButtonApp(
    color: Colors.deepPurpleAccent,
    colorTexto: Colors.white,
    texto: 'Iniciar Sesión',
    onPressed: () {
      context.push('/login');
    },
  );
}

Widget _buttonRegister(BuildContext context) {
  return ButtonApp(
    color: Colors.yellowAccent.shade700,
    colorTexto: Colors.black54,
    texto: 'Registrate',
    onPressed: () {
      context.push('/register');
    },
  );
}
