import 'package:app1/Modulos/Pages/carteiras.dart';
import 'package:app1/Modulos/Pages/home.dart';
import 'package:app1/Modulos/Pages/movimenta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final pageViewController = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      )),
      home: Scaffold(
        body: PageView(
          controller: pageViewController,
          children: [
            MyHome(),
            MyCarteira(),
            MyMoviment(),
          ],
        ),
        bottomNavigationBar: AnimatedBuilder(
            animation: pageViewController,
            builder: (context, snapshot) {
              return BottomNavigationBar(
                  currentIndex: pageViewController?.page?.round() ?? 0,
                  onTap: (index) {
                    pageViewController.jumpToPage(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/imagens/logo.png'),
                          size: 25,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/imagens/carteiras_icon.png'),
                          size: 25,
                        ),
                        label: 'Carteiras'),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/imagens/bolsa_icon.png'),
                          size: 25,
                        ),
                        label: 'Movimentações'),
                  ]);
            }),
      ),
    );
  }
}
