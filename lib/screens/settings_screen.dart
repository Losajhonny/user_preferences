import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferrences/providers/theme_provider.dart';
import 'package:user_preferrences/share_preferences/preferences.dart';
import 'package:user_preferrences/widgets/side_menu.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ajustes',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              Divider(),
              SwitchListTile(
                value: Preferences.isDarkmode,
                title: Text("Darkmode"),
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);

                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.gender,
                  title: Text('Masculino'),
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 2,
                  groupValue: Preferences.gender,
                  title: Text('Femenino'),
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;
                    setState(() {});
                  }),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      labelText: 'Nombre', helperText: 'Nombre de usuario'),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: SideMenu(),
    );
  }
}
