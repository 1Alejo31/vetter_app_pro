import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vetter_app/src/presentation/theme/theme_provider.dart';
import 'package:vetter_app/src/widgets/button_app.dart';

class RegisterScreen extends ConsumerWidget {
  static const name = 'register';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final bool stateDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                _goBack(context),
                _fondoTop(size),
                _fondoButton(size),
                _formulario(size, stateDarkmode),
              ],
            )
          ],
        ),
      )),
    ));
  }
}

Widget _fondoTop(size) {
  return Center(
    child: SizedBox(
      height: size.height * 0.4,
      child: ClipRect(
        child: Image.asset(
          'assets/img/dog1.png',
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}

Widget _fondoButton(size) {
  return Container(
    margin: const EdgeInsets.only(top: 350),
    child: SizedBox(
      height: size.height * 0.6,
      child: ClipRect(
        child: Image.asset(
          'assets/img/fondo.png',
          fit: BoxFit.cover,
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

Widget _textFieldUser(stateDarkmode) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Nombre de usuario',
      hintText: 'Julian Gonzalez',
      border: const OutlineInputBorder(),
      prefixIcon: Icon(
        Icons.person_add_alt,
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

Widget _textFieldEmail(stateDarkmode) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Correo Electrónico',
      hintText: 'ejemplo@gmail.com',
      border: const OutlineInputBorder(),
      prefixIcon: Icon(
        Icons.person_2_outlined,
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

Widget _textFieldConfirmPassword(stateDarkmode) {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Confirmar contraseña',
      hintText: '123456789',
      border: const OutlineInputBorder(),
      prefixIcon: Icon(
        Icons.enhanced_encryption_outlined,
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
        Icons.enhanced_encryption_rounded,
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
    height: size.height * 0.58,
    margin: const EdgeInsets.only(left: 20, right: 20, top: 300),
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
                    'Registro',
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
            _textFieldUser(stateDarkmode),
            const SizedBox(
              height: 10,
            ),
            _textFieldEmail(stateDarkmode),
            const SizedBox(
              height: 10,
            ),
            _textFieldPassword(stateDarkmode),
            const SizedBox(
              height: 10,
            ),
            _textFieldConfirmPassword(stateDarkmode),
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
