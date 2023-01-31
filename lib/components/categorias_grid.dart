import 'package:flutter/material.dart';

import '../data/categoria_data.dart';
import 'categoria_item.dart';

class CategoriasGrid extends StatelessWidget {
  const CategoriasGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text("Categorias",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
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
    );
  }
}
