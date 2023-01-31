import 'package:flutter/material.dart';

class ChatHomeContainer extends StatelessWidget {
  const ChatHomeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 2),
                  Text("Sinta-se confortável para contar sobre seu dia!"),
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
    );
  }
}
