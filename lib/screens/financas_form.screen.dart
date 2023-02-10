import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../models/financas_list.dart';

class FinancasFormScreen extends StatefulWidget {
  const FinancasFormScreen({super.key});

  @override
  State<FinancasFormScreen> createState() => _FinancasFormScreenState();
}

class _FinancasFormScreenState extends State<FinancasFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  bool investe = false;
  bool economizar = false;

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<FinancasList>(
      context,
      listen: false,
    ).saveFinanca(_formData, investe, economizar).then((value) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Conhecendo sua renda"),
          actions: [IconButton(onPressed: _submitForm, icon: Icon(Icons.add))],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Qual sua renda mensal?'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSaved: (renda) =>
                        _formData['renda'] = double.parse(renda ?? '0'),
                    validator: (_renda) {
                      final rendaString = _renda ?? '';
                      final renda = double.tryParse(rendaString) ?? -1;

                      if (renda <= 0 || renda.isNaN) {
                        return 'Informe um preço válido.';
                      }

                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: investe,
                          onChanged: (bool? check) {
                            setState(() {
                              investe = check ?? false;
                            });
                          }),
                      Text("Você investe?")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: economizar,
                          onChanged: (bool? check) {
                            setState(() {
                              economizar = check ?? false;
                            });
                          }),
                      Text("Deseja economizar?")
                    ],
                  )
                ],
              ),
            )));
  }
}
