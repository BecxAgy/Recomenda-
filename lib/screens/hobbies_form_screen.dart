import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../components/hobbie_card.dart';
import '../components/search_bar.dart';
import '../models/hobbies_list.dart';

class HobbieFormScreen extends StatefulWidget {
  @override
  State<HobbieFormScreen> createState() => _HobbieFormScreenState();
}

class _HobbieFormScreenState extends State<HobbieFormScreen> {
  @override
  Widget build(BuildContext context) {
    final hobbies = Provider.of<HobbiesList>(context, listen: false).hobbies;
    final selectedHobbies =
        Provider.of<HobbiesList>(context, listen: false).selectedHobbies;
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 201, 48, 221),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Escolha os seus\nHobbies",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .85,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: hobbies.length,
                        itemBuilder: (BuildContext context, int index) {
                          // return item
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                hobbies[index].isSelected =
                                    !hobbies[index].isSelected;
                                if (hobbies[index].isSelected == true) {
                                  selectedHobbies.add(hobbies[index]);
                                } else if (hobbies[index].isSelected == false) {
                                  selectedHobbies.removeWhere((element) =>
                                      element.name == hobbies[index].name);
                                }
                              });

                              print(selectedHobbies);
                            },
                            child: HobbieCard(
                              hobbies[index].name,
                              hobbies[index].svgSrc,
                              hobbies[index].isSelected,
                              index,
                            ),
                          );
                        }),
                  ),
                  selectedHobbies.length > 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: Center(
                            child: FloatingActionButton(
                              backgroundColor:
                                  Color.fromARGB(255, 166, 13, 172),
                              child: Icon(Icons.check),
                              onPressed: () {
                                Provider.of<HobbiesList>(context, listen: false)
                                    .addHobbies()
                                    .then((value) {
                                  Navigator.of(context).pop();
                                });
                              },
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
