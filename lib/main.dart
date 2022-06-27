import 'package:app1/src/screens/carteiras.dart';
import 'package:app1/src/screens/home.dart';
import 'package:app1/src/screens/movimenta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'L10n/l10n.dart';

void main() {
  runApp(ProviderScope(child: MyMain()));
  // runApp(const MyMain());
}

class MyMain extends StatefulWidget {
  const MyMain({Key? key}) : super(key: key);

  @override
  State<MyMain> createState() => MyMainState();
}

class MyMainState extends State<MyMain> {
  final pageViewController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      )),
      home: Scaffold(
        body: PageView(
          controller: pageViewController,
          children: const [
            MyHome(),
            MyCarteira(),
            MyMoviment(),
          ],
        ),
        bottomNavigationBar: AnimatedBuilder(
            animation: pageViewController,
            builder: (context, snapshot) {
              return BottomNavigationBar(
                  currentIndex: pageViewController.page?.round() ?? 0,
                  onTap: (index) {
                    pageViewController.jumpToPage(index);
                  },
                  items: [
                    const BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/imagens/logo.png'),
                          size: 25,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: const ImageIcon(
                          AssetImage('assets/imagens/carteiras_icon.png'),
                          size: 25,
                        ),
                        label: AppLocalizations.of(context)!.wallet),
                    BottomNavigationBarItem(
                        icon: const ImageIcon(
                          AssetImage('assets/imagens/bolsa_icon.png'),
                          size: 25,
                        ),
                        label: AppLocalizations.of(context)!.moviments),
                  ]);
            }),
      ),
    );
  }
}
