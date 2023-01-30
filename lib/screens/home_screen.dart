import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:desingprojeto/components/categoria_item.dart';
import 'package:desingprojeto/components/emoticon_face.dart';
import 'package:desingprojeto/data/categoria_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        //image
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.purple[200],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        //como esta se sentindo + botao
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Como está se sentindo?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              SizedBox(height: 2),
                              Text(
                                  "Sinta-se confortável para contar sobre seu dia!"),
                              SizedBox(height: 8),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.purple[200],
                                      borderRadius: BorderRadius.circular(12)),
                                  child: (TextButton(
                                      onPressed: () {},
                                      child: Center(
                                        child: Text(
                                          "Começar",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Categorias",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 80,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children:
                                //vai para categoria item
                                listCategories.map((e) {
                              return CategoryItem(e);
                            }).toList()))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
