import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';
import 'model/pokedex.dart';

class PokemonDeteil extends StatefulWidget {
  Pokemon pokemon;

  PokemonDeteil({this.pokemon});

  @override
  _PokemonDeteilState createState() => _PokemonDeteilState();
}

class _PokemonDeteilState extends State<PokemonDeteil> {
  PaletteGenerator paletteGenerator;
  Color baskinRenk;

  void baskinRangiBul() {
    Future<PaletteGenerator> fPalteGenarator =
        PaletteGenerator.fromImageProvider(
      NetworkImage(widget.pokemon.img),
    );
    fPalteGenarator.then((value) {
      paletteGenerator = value;
      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baskinRangiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baskinRenk != null ? baskinRenk : Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: baskinRenk != null ? baskinRenk : Colors.blueGrey,
        elevation: 0,
        title: Text(
          widget.pokemon.name,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return dikeyBody(context);
        } else {
          return yatayBody(context);
        }
      }),
    );
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height / 20,
          left: 350,
          child: Container(
            height: 30,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(widget.pokemon.num,style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ),
        Positioned(
          height: MediaQuery.of(context).size.height * (7.7 / 10),
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Heigh : " + widget.pokemon.height,
                    style: TextStyle(
                        fontSize: 20, color: Colors.blueGrey.shade700),
                  ),
                  Text(
                    "Weight : " + widget.pokemon.weight,
                    style: TextStyle(
                        fontSize: 20, color: Colors.blueGrey.shade700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Types",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type
                        .map((tip) => Chip(
                            backgroundColor: (baskinRenk != null)
                                ? baskinRenk
                                : Colors.black,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),
                  Text(
                    "Pre Evolution",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null
                        ? widget.pokemon.prevEvolution
                            .map((evolution) => Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [
                            Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  "First Version",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                  ),
                  Text(
                    "Next Evolution",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null
                        ? widget.pokemon.nextEvolution
                            .map((evolution) => Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [
                            Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  "Final Version",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null
                        ? widget.pokemon.weaknesses
                            .map((evolution) => Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  evolution,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [
                            Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  "No Weaknesses",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "General Features",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      Chip(
                          backgroundColor:
                              (baskinRenk != null) ? baskinRenk : Colors.black,
                          label: Text(
                            widget.pokemon.candy != null
                                ? "Candy : " + widget.pokemon.candy
                                : "No Candy",
                            style: TextStyle(color: Colors.white),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.black,
                              label: Text(
                                widget.pokemon.candyCount != null
                                    ? "Candy Count : " +
                                        widget.pokemon.candyCount.toString()
                                    : "No Candy Count",
                                style: TextStyle(color: Colors.white),
                              )),
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.white,
                              label: Text(
                                widget.pokemon.egg != null
                                    ? "Egg : " + widget.pokemon.egg
                                    : "No Egg",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.white,
                              label: Text(
                                widget.pokemon.spawnChance != null
                                    ? "Spawn Chance : " +
                                        widget.pokemon.spawnChance.toString()
                                    : "No Spawn Chance",
                                style: TextStyle(color: Colors.white),
                              )),
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.white,
                              label: Text(
                                widget.pokemon.avgSpawns != null
                                    ? "Avg Spawns : " +
                                        widget.pokemon.avgSpawns.toString()
                                    : "No Avg Spawns",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.white,
                              label: Text(
                                widget.pokemon.spawnTime != null
                                    ? "Spawn Time : " +
                                        widget.pokemon.spawnTime.toString()
                                    : "No Spawn Time",
                                style: TextStyle(color: Colors.white),
                              )),
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.white,
                              label: Text(
                                widget.pokemon.multipliers != null
                                    ? "Multipliers : " +
                                        widget.pokemon.multipliers.toString()
                                    : "No Multipliers",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: widget.pokemon.img,
              child: Container(
                width: 150,
                height: 150,
                child: Image.network(
                  widget.pokemon.img,
                  fit: BoxFit.contain,
                ),
              )),
        )
      ],
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * (3 / 4),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: widget.pokemon.img,
              child: Container(
                width: 200,
                child: Image.network(
                  widget.pokemon.img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "Heigh : " + widget.pokemon.height,
                    style: TextStyle(
                        fontSize: 20, color: Colors.blueGrey.shade700),
                  ),
                  Text(
                    "Weight : " + widget.pokemon.weight,
                    style: TextStyle(
                        fontSize: 20, color: Colors.blueGrey.shade700),
                  ),
                  Text(
                    "Types",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type
                        .map((tip) => Chip(
                            backgroundColor: (baskinRenk != null)
                                ? baskinRenk
                                : Colors.black,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),
                  Text(
                    "Pre Evolution",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null
                        ? widget.pokemon.prevEvolution
                            .map((evolution) => Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [
                            Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  "First Version",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                  ),
                  Text(
                    "Next Evolution",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null
                        ? widget.pokemon.nextEvolution
                            .map((evolution) => Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [
                            Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  "Final Version",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null
                        ? widget.pokemon.weaknesses
                            .map((evolution) => Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  evolution,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [
                            Chip(
                                backgroundColor: (baskinRenk != null)
                                    ? baskinRenk
                                    : Colors.black,
                                label: Text(
                                  "No Weaknesses",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "General Features",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      Chip(
                          backgroundColor:
                              (baskinRenk != null) ? baskinRenk : Colors.black,
                          label: Text(
                            widget.pokemon.candy != null
                                ? "Candy : " + widget.pokemon.candy
                                : "No Candy",
                            style: TextStyle(color: Colors.white),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.black,
                              label: Text(
                                widget.pokemon.candyCount != null
                                    ? "Candy Count : " +
                                        widget.pokemon.candyCount.toString()
                                    : "No Candy Count",
                                style: TextStyle(color: Colors.white),
                              )),
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.white,
                              label: Text(
                                widget.pokemon.egg != null
                                    ? "Egg : " + widget.pokemon.egg
                                    : "No Egg",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.white,
                              label: Text(
                                widget.pokemon.spawnChance != null
                                    ? "Spawn Chance : " +
                                        widget.pokemon.spawnChance.toString()
                                    : "No Spawn Chance",
                                style: TextStyle(color: Colors.white),
                              )),
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.white,
                              label: Text(
                                widget.pokemon.avgSpawns != null
                                    ? "Avg Spawns : " +
                                        widget.pokemon.avgSpawns.toString()
                                    : "No Avg Spawns",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.white,
                              label: Text(
                                widget.pokemon.spawnTime != null
                                    ? "Spawn Time : " +
                                        widget.pokemon.spawnTime.toString()
                                    : "No Spawn Time",
                                style: TextStyle(color: Colors.white),
                              )),
                          Chip(
                              backgroundColor: (baskinRenk != null)
                                  ? baskinRenk
                                  : Colors.white,
                              label: Text(
                                widget.pokemon.multipliers != null
                                    ? "Multipliers : " +
                                        widget.pokemon.multipliers.toString()
                                    : "No Multipliers",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
