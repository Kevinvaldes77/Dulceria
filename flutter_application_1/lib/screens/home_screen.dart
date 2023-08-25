import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/jueves.dart';
import 'package:flutter_application_1/screens/lunes.dart';
import 'package:flutter_application_1/screens/viernes.dart';
import 'login_screen.dart';
import 'martes.dart';
import 'miercoles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = [
      'Lunes',
      'Martes',
      'Miercoles',
      'Jueves',
      'Viernes'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Dulceria Valdes'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Días de la semana',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: daysOfWeek.map((day) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navegar al widget personalizado correspondiente al día
                      if (day == 'Lunes') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Lunes()),
                        );
                      } else if (day == 'Martes') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Martes()),
                        );
                      } // Repite esto para todos los días restantes
                      

                      else if (day == 'Miercoles') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Miercoles()),
                        );
                      }
                      else if (day == 'Jueves') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Jueves()),
                        );
                      }
                       else if (day == 'Viernes') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Viernes()),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(80.0),
                      child: Text(day, style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  SizedBox(height: 70),
                ],
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              // Navegar a la pantalla de inicio de sesión
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text('Volver'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    routes: {LoginScreen.ruta: (context) => LoginScreen()},
  ));
}
