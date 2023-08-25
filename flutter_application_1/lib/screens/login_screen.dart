import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/input_decoration.dart';

class LoginScreen extends StatelessWidget {

  static const String ruta = "login"; 
  
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [cajapurpura(size), iconopersona(), loginform(context)],
        ),
      ),
    );
  }

  SingleChildScrollView loginform(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              //height: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.deepPurple,
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    )
                  ]),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text('Login', style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 30),
                  Container(
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            decoration: InputDecorations.inputDecoration(
                                hintext: 'ejemplo@gmail.com',
                                labeltext: 'Correo electronico',
                                icono:
                                    const Icon(Icons.alternate_email_rounded)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa un correo electrónico';
                              }

                              // Expresión regular para verificar si el correo es de tipo Gmail
                              final gmailRegex =
                                  RegExp(r'^[a-zA-Z0-9._%+-]+@gmail.com$');
                                  

                              if (!gmailRegex.hasMatch(value)) {
                                return 'Ingresa un correo electrónico válido de Gmail';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                              autocorrect: false,
                              obscureText: true,
                              decoration: InputDecorations.inputDecoration(
                                  hintext: '******',
                                  labeltext: 'Contraseña',
                                  icono: const Icon(Icons.lock_outline)),
                                  validator: (value) {
                                    return (value != null && value.length >= 6)
                                    ? null
                                    : 'La contraseña debe ser mayor o igual a los 6 caracteres';
                                  },
                                  ),
                          const SizedBox(height: 30),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            disabledColor: Colors.grey,
                            color: Colors.deepPurple,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 15),
                              child: const Text(
                                'Ingresar',
                                
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed: () {
              // Mostrar el letrero de "Ingreso exitoso"
              _mostrarIngresoExitoso(context);
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
          const SizedBox(height: 50),
          const Text(
            '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  void _mostrarIngresoExitoso(BuildContext context) {
  final snackBar = SnackBar(
    content: Text('Ingreso exitoso'),
    duration: Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  // Navegar a la vista de la semana después del ingreso exitoso
  Future.delayed(Duration(seconds: 2), () {
    Navigator.pushReplacementNamed(context, 'home'); // Cambia 'home' por la ruta correcta
  });
}


  SafeArea iconopersona() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }

  Container cajapurpura(Size size) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 170, 1),
      ])),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(child: burbuja(), top: 90, left: 30),
          Positioned(child: burbuja(), top: -40, left: -30),
          Positioned(child: burbuja(), top: -50, right: -20),
          Positioned(child: burbuja(), bottom: -50, left: 10),
          Positioned(child: burbuja(), bottom: 120, right: 20)
        ],
      ),
    );
  }

  Container burbuja() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
