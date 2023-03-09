import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../utils/app_routes.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              userProfile(),
              divider(),
              optionsTiles(),
              divider(),
              bwTiles(),
            ],
          ),
        ));
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }

  Widget userProfile() {
    return ListTile(
      leading: CircleAvatar(), //aqui podemos colocar a foto do usuário
      title: Text("Nome do User"),
      subtitle: Text(Provider.of<Auth>(context).email.toString()),
    );
  }

  Widget bwTiles() {
    // Color color = Colors.blueGrey.shade800; not satisfied, so let us pick it
    return Column(
      children: [
        bwTile("Logout", Icons.logout, "Sair"),
      ],
    );
  }

  Widget bwTile(String nameRoute, IconData icon, String text) {
    return optionTile(nameRoute, icon, Colors.black, text, blackAndWhite: true);
  }

  Widget optionsTiles() {
    return Column(
      children: [
        optionTile(
            "User", Icons.person_outline, Colors.deepPurple, "Dados Pessoais"),
        optionTile("Configuracoes", Icons.settings_outlined, Colors.blue,
            "Configurações"),
        optionTile("Salvos", Icons.bookmark, Colors.blue, "Salvos"),
        optionTile("Ajuda", Icons.help, Colors.deepPurple, "Ajuda")
      ],
    );
  }

  Widget optionTile(String nameRoute, IconData icon, Color color, String text,
      {bool blackAndWhite = false}) {
    return ListTile(
      leading: Container(
        child: Icon(icon, color: color),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: blackAndWhite ? Colors.white : color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 15),
      onTap: () {
        if (nameRoute == "Logout") {
          Provider.of<Auth>(listen: false, context).logout();
          Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
        }
      },
    );
  }
}
