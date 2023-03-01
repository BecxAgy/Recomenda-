import 'package:desingprojeto/models/auth.dart';
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
        colorTile(Icons.person_outline, Colors.deepPurple, "Personal data"),
        colorTile(Icons.settings_outlined, Colors.blue, "Settings"),
        colorTile(Icons.credit_card, Colors.pink, "Payment"),
        colorTile(Icons.favorite_border, Colors.orange, "Personal data"),
      ],
    );
  }

  Widget bwTiles() {
    // Color color = Colors.blueGrey.shade800; not satisfied, so let us pick it
    return Column(
      children: [
        bwTile(Icons.info_outline, "FAQs"),
        bwTile(Icons.border_color_outlined, "Handbook"),
        bwTile(Icons.textsms_outlined, "Community"),
      ],
    );
  }

//only for ease of understanding, other wise you can use colorTile Directly,
// in my preference, i split the widgets into as many chunks as possible

  Widget bwTile(IconData icon, String text) {
    return colorTile(icon, Colors.black, text, blackAndWhite: true);
  }

  Widget colorTile(IconData icon, Color color, String text,
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
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20),
      onTap: () {},
    );
  }
}
