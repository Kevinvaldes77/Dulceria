import 'package:flutter/material.dart';

class Miercoles extends StatefulWidget {
  @override
  _MiercolesState createState() => _MiercolesState();
}

class _MiercolesState extends State<Miercoles> {
  int productCount = 0;
  int productPrice = 500;
  bool isPurchaseConfirmed = false;

  @override
  Widget build(BuildContext context) {
    int totalPrice = productCount * productPrice;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Miércoles'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/image/bonbonbum.png',
              width: 350,
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPurchaseConfirmed = true;
                });
              },
              child: Text('Confirmar Compra'),
            ),
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
