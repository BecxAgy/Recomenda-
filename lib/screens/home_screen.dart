import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:desingprojeto/components/categoria_item.dart';
import 'package:desingprojeto/components/emoticon_face.dart';
import 'package:desingprojeto/data/categoria_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/categorias_grid.dart';
import '../components/chat_home_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            items: [
              Icon(Icons.favorite),
              Icon(Icons.home),
              Icon(Icons.settings)
            ],
            backgroundColor: Color.fromARGB(255, 224, 224, 224),
            color: Color.fromARGB(255, 225, 190, 231)),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                //top

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá,",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Rebeca",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[200]),
                        child: Icon(Icons.person))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //Container do chat
                ChatHomeContainer(),
                SizedBox(
                  height: 25,
                ),

                //Lista de categorias
                CategoriasGrid()
              ],
            ),
          ),
        ));
  }
}
