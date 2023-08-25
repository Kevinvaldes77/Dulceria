import 'package:flutter/material.dart';

class Jueves extends StatefulWidget {
  @override
  _JuevesState createState() => _JuevesState();
}

class _JuevesState extends State<Jueves> {
  int productCount = 0;
  int productPrice = 700; // Precio por producto
  bool isPurchaseConfirmed = false;

  @override
  Widget build(BuildContext context) {
    int totalPrice = productCount * productPrice;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Jueves'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/image/Jet.png',
              width: 300,
            ),
            SizedBox(height: 20),
            Text('Productos: $productCount'),
            SizedBox(height: 20),
            Text('Precio total: $totalPrice'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  productCount++;
                });
              },
              child: Text('Agregar Producto'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPurchaseConfirmed = true;
                });
              },
              child: Text('Confirmar Compra'),
            ),
            SizedBox(height: 20),
            if (isPurchaseConfirmed)
              Column(
                children: [
                  Text(
                    '¡Compra confirmada!',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPurchaseConfirmed = false;
                        productCount = 0;
                      });
                    },
                    child: Text('Editar Compra'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
