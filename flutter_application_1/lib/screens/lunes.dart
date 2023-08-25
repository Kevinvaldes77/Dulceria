import 'package:flutter/material.dart';

class Lunes extends StatefulWidget {
  @override
  _LunesState createState() => _LunesState();
}

class _LunesState extends State<Lunes> {
  int productCount = 0;
  int productPrice = 1500; // Precio por producto
  bool isPurchaseConfirmed = false;

  @override
  Widget build(BuildContext context) {
    int totalPrice = productCount * productPrice;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Lunes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/image/cokis.png',
              width: 320,
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
                  SizedBox(height: 20)
                ],
              ),
          ],
        ),
      ),
    );
  }
}
