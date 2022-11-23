import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:product_app/helpers/database_helper.dart';
import 'package:product_app/screens/taken_picture_screen.dart';
import 'package:product_app/widgets/custom_item_widget.dart';
import '../models/cat_model.dart';

class HomeScreen extends StatefulWidget {
  final CameraDescription firstCamera;
  final String? ImagePhath;

  const HomeScreen({Key? key, this.ImagePhath, required this.firstCamera}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textControllerTitle = TextEditingController();
  final textControllerCategory = TextEditingController();
  final textControllerRanking = TextEditingController();
  final textControllerImage = TextEditingController();
  final textControllerDescription = TextEditingController();
  final textControllerCalories = TextEditingController();
  final textControllerAdditives = TextEditingController();
  final textControllerVitamins = TextEditingController();
  final textControllerPrice = TextEditingController();
  int? catID;
  //final CameraDescription firstCamera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite Database"),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
           ElevatedButton(onPressed:() {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) =>TakenPictureScreen(camera: widget.firstCamera,)));
           }, 
           style: ElevatedButton.styleFrom(primary: Color(0xFF69503C),
           ),child: const Text('Take Photo')),

            TextFormField(
              controller: textControllerTitle,
              decoration: const InputDecoration(
                  icon: Icon(Icons.text_format_outlined),
                  labelText: "input the Title"),
            ),
            TextFormField(
              controller: textControllerCategory,
              decoration: const InputDecoration(
                  icon: Icon(Icons.view_comfortable_outlined),
                  labelText: "input the Category"),
            ),
            TextFormField(
              controller: textControllerRanking,
              decoration: const InputDecoration(
                  icon: Icon(Icons.text_format_outlined),
                  labelText: "input the Ranking"),
            ),
            TextFormField(
              controller: textControllerDescription,
              decoration: const InputDecoration(
                  icon: Icon(Icons.text_format_outlined),
                  labelText: "input the Description"),
            ),
            TextFormField(
              controller: textControllerCalories,
              decoration: const InputDecoration(
                  icon: Icon(Icons.text_format_outlined),
                  labelText: "input the Calories"),
            ),
            TextFormField(
              controller: textControllerAdditives,
              decoration: const InputDecoration(
                  icon: Icon(Icons.text_format_outlined),
                  labelText: "input the Additives"),
            ),
            TextFormField(
              controller: textControllerVitamins,
              decoration: const InputDecoration(
                  icon: Icon(Icons.text_format_outlined),
                  labelText: "input the Vitamins"),
            ),
            TextFormField(
              controller: textControllerPrice,
              decoration: const InputDecoration(
                  icon: Icon(Icons.text_format_outlined),
                  labelText: "input the Price"),
            ),
            Center(
              child: (FutureBuilder<List<Cat>>(
                  future: DatabaseHelper.instance.getCats(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Cat>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: const Text("Loading..."),
                        ),
                      );
                    } else {
                      return snapshot.data!.isEmpty
                          ? Center(
                              child: Container(
                                  child: const Text("No cats in the list")))
                          : ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: snapshot.data!.map((cat) {
                                return Center(
                                  child: ListTile(
                                    title: Row(children: [Container(child: Image.file(File(cat.image)), height: 50, width: 50,),Container(child: Text('Title: ${cat.title} | Category: ${cat.category} | Ranking: ${cat.ranking} | Description: ${cat.description} | Calories: ${cat.calories} | Additives: ${cat.additives} | Vitamins: ${cat.vitamins} | Price: ${cat.price}',),width: 150,)],) 
                                    ,
                                    onTap: () {
                                      setState(() {
                                        final route = MaterialPageRoute(
                                            builder: (context) =>
                                                TakenPictureScreen(
                                                  camera: widget.firstCamera,
                                                ));
                                        Navigator.push(context, route);
                                        textControllerTitle.text = cat.title;
                                        textControllerCategory.text =
                                            cat.category;
                                        textControllerRanking.text =
                                            cat.ranking;
                                        textControllerDescription.text =
                                            cat.description;
                                        textControllerCalories.text =
                                            cat.calories;
                                        textControllerAdditives.text =
                                            cat.additives;
                                        textControllerVitamins.text =
                                            cat.vitamins;
                                        textControllerPrice.text = cat.price;
                                        catID = cat.id;
                                      });
                                    },
                                    onLongPress: () {
                                      DatabaseHelper.instance.delete(cat.id!);
                                      setState(() {});
                                    },
                                  ),
                                );
                              }).toList());
                    }
                  })),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF69503C),
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
        onPressed: () async {
          if (catID != null) {
            DatabaseHelper.instance.update(Cat(
                id: catID,
                title: textControllerTitle.text,
                category: textControllerCategory.text,
                ranking: textControllerRanking.text,
                description: textControllerDescription.text,
                calories: textControllerCalories.text,
                additives: textControllerAdditives.text,
                vitamins: textControllerVitamins.text,
                price: textControllerPrice.text,
                image: widget.ImagePhath!));
          } else {
            DatabaseHelper.instance.add(Cat(
                title: textControllerTitle.text,
                category: textControllerCategory.text,
                ranking: textControllerRanking.text,
                description: textControllerDescription.text,
                calories: textControllerCalories.text,
                additives: textControllerAdditives.text,
                vitamins: textControllerVitamins.text,
                price: textControllerPrice.text,
                image: widget.ImagePhath!));
          }

          setState(() {
            textControllerTitle.clear();
            textControllerCategory.clear();
            textControllerRanking.clear();
            textControllerDescription.clear();
            textControllerCalories.clear();
            textControllerAdditives.clear();
            textControllerVitamins.clear();
            textControllerPrice.clear();
          });
        },
      ),
    );
  }
}
