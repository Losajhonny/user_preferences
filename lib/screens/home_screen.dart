import 'package:flutter/material.dart';
import 'package:user_preferrences/widgets/side_menu.dart';

import '../share_preferences/preferences.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // la barra de la app
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('isDarkmode: ${Preferences.isDarkmode}'),
            Divider(),
            Text('Género: ${Preferences.gender}'),
            Divider(),
            Text('Nombre de usuario: ${Preferences.name}'),
          ],
        ),
      ),
      // side menu
      drawer: SideMenu(),
    );
  }
}
