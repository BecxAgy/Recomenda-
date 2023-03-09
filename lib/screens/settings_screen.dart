import 'package:desingprojeto/models/auth.dart';
import 'package:desingprojeto/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
          0xffffffff), //you can paste your custom code color, but this one is for demo purpose,
      body: ListView(
        padding: EdgeInsets.all(12),
        physics: BouncingScrollPhysics(), //use this for a bouncing experience
        children: [
          Container(height: 35),
          userTile(),
          divider(),
          colorTiles(),
          divider(),
          bwTiles(),
        ],
      ),

      // floatingActionButton: fab(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget userTile() {
    //I use pixabay.com & unsplash.com for most of the time.
    return ListTile(
      leading: CircleAvatar(),
      title: Text(
        "rebeca agguiar",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(Provider.of<Auth>(context).email.toString()),
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }

  Widget colorTiles() {
    return Column(
      children: [
        colorTile(
            "User", Icons.person_outline, Colors.deepPurple, "Dados Pessoais"),
        colorTile("Configuracoes", Icons.settings_outlined, Colors.blue,
            "Configurações"),
        colorTile("Salvos", Icons.bookmark, Colors.blue, "Salvos"),
        colorTile("Ajuda", Icons.help, Colors.deepPurple, "Ajuda")
      ],
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

//only for ease of understanding, other wise you can use colorTile Directly,
// in my preference, i split the widgets into as many chunks as possible

  Widget bwTile(String nameRoute, IconData icon, String text) {
    return colorTile(nameRoute, icon, Colors.black, text, blackAndWhite: true);
  }

  Widget colorTile(String nameRoute, IconData icon, Color color, String text,
      {bool blackAndWhite = false}) {
    Color pickedColor = Color(0xfff3f4fe);
    return ListTile(
      leading: Container(
        child: Icon(icon, color: color),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: blackAndWhite ? pickedColor : color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
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
