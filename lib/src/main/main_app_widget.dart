import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di/dependency_injection_widget.dart';

import '../presentation/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  final _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return DependencyInjectionWidget(
      url: _url,
      child: MaterialApp(
        title: 'Pokedex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => HomeScreen(),
        },
      ),
    );
  }
}
