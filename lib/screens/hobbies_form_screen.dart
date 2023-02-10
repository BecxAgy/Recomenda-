import 'package:desingprojeto/models/hobbies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HobbieFormScreen extends StatefulWidget {
  const HobbieFormScreen({super.key});

  @override
  State<HobbieFormScreen> createState() => _HobbieFormScreenState();
}

class _HobbieFormScreenState extends State<HobbieFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Formulário de produto"),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['name']?.toString(),
                      decoration:
                          const InputDecoration(labelText: 'Nome do Hobbie'),
                      onSaved: (name) => _formData['name'] = name ?? '',
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
            )));
  }
}
