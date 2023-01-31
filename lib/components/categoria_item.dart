import 'package:flutter/material.dart';

import '../models/categoria.dart';
import '../screens/categoria_screen.dart';

class CategoryItem extends StatelessWidget {
  final Categoria categoria;

  const CategoryItem(this.categoria);

  void _selectScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/categoria', arguments: categoria);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectScreen(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.purple[100],
          ),
          child: Row(children: [
            Image.asset(
              categoria.imageAsset,
              height: 40,
            ),
            SizedBox(
              width: 8,
            ),
            Text(categoria.title)
          ]),
        ),
      ),
    );
  }
}
