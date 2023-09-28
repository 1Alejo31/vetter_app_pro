import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vetter_app/src/presentation/theme/theme_provider.dart';
import 'package:vetter_app/src/widgets/button_app.dart';

class LoginScreen extends ConsumerWidget {
  static const name = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final bool stateDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              _fondoLogin(size),
              _titulos(size, stateDarkmode),
              _goBack(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buttonLogin(stateDarkmode) {
  return ButtonApp(
    color: stateDarkmode
        ? const Color.fromARGB(255, 125, 82, 243)
        : const Color.fromARGB(255, 91, 70, 143),
    colorTexto: Colors.white,
    texto: 'Iniciar Sesión',
    onPressed: () {},
  );
}

Widget _textFieldEmail(stateDarkmode) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Correo Electrónico',
      hintText: 'ejemplo@gmail.com',
      border: const OutlineInputBorder(),
      prefixIcon: Icon(
        Icons.person,
        color: stateDarkmode
            ? const Color.fromARGB(255, 125, 82, 243)
            : const Color.fromARGB(255, 91, 70, 143),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: stateDarkmode
              ? const Color.fromARGB(255, 125, 82, 243)
              : const Color.fromARGB(255, 91, 70, 143),
        ),
      ),
    ),
  );
}

Widget _textFieldPassword(stateDarkmode) {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Contraseña',
      hintText: '123456789',
      border: const OutlineInputBorder(),
      prefixIcon: Icon(
        Icons.person,
        color: stateDarkmode
            ? const Color.fromARGB(255, 125, 82, 243)
            : const Color.fromARGB(255, 91, 70, 143),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: stateDarkmode
              ? const Color.fromARGB(255, 125, 82, 243)
              : const Color.fromARGB(255, 91, 70, 143),
        ),
      ),
    ),
  );
}

Widget _formulario(size, stateDarkmode) {
  return Container(
    height: size.height * 0.4,
    margin: const EdgeInsets.only(left: 20, right: 20),
    child: Card(
      elevation: 9.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.topLeft,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 125, 82, 243),
                        Color.fromARGB(255, 69, 56, 100),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Color del texto
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _textFieldEmail(stateDarkmode),
            const SizedBox(
              height: 10,
            ),
            _textFieldPassword(stateDarkmode),
            const SizedBox(
              height: 10,
            ),
            _buttonLogin(stateDarkmode)
          ],
        ),
      ),
    ),
  );
}

Widget _goBack(context) {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Align(
      alignment: Alignment.topLeft,
      child: FloatingActionButton(
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}

Widget _titulos(size, stateDarkmode) {
  return SizedBox(
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 25, top: 310),
          alignment: Alignment.topLeft,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [
                  Colors.deepPurpleAccent,
                  Color.fromARGB(255, 32, 19, 67),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: const Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white, // Color del texto
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 25,
          ),
          alignment: Alignment.topLeft,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [
                  Colors.deepPurpleAccent,
                  Color.fromARGB(255, 32, 19, 67),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: const Text(
              'De Nuevo',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.white, // Color del texto
              ),
            ),
          ),
        ),
        _formulario(size, stateDarkmode)
      ],
    ),
  );
}

Widget _fondoLogin(size) {
  return SizedBox(
    height: size.height * 0.6,
    width: size.width * 1,
    child: ClipRect(
      child: Image.asset(
        'assets/img/fondo.png',
        fit: BoxFit.cover,
      ),
    ),
  );
}
