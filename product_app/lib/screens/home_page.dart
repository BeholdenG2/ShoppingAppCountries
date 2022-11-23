import 'dart:io';
import 'package:camera/camera.dart';
import 'package:product_app/screens/home_screen.dart';
import 'package:product_app/screens/products_screen.dart';
import 'package:product_app/screens/shopping_screen.dart';
import 'package:product_app/screens/taken_picture_screen.dart';
import '../flutter_widgets/flutter_flow_icon_button.dart';
import '../flutter_widgets/flutter_flow_theme.dart';
import '../flutter_widgets/flutter_flow_util.dart';
import '../flutter_widgets/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/database_helper.dart';
import '../models/cat_model.dart';
import '../widgets/image_widget.dart';

class HomePageWidget extends StatefulWidget {

  final CameraDescription firstCamera;
  HomePageWidget({Key? key, required this.firstCamera}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();

}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? titleProduct = '';
  String? priceProduct = '';
  String? imgHome = '';

  double? calif = 0;
  String? sRanking = '';
  String? sPrice = '';
  double? dPrice = 0;
  String? description = '';
  String? vitamins = '';
  String? additives = '';
  String? calories = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        elevation: 16,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF907761),
        automaticallyImplyLeading: true,
        actions: [
          FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => ShoppingCardWidget(
                            firstCamera: widget.firstCamera,
                          )),
                );
              }),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hi, Juan.',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF907761),
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'What\'s today \'s taste?',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF907761),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Icon(
                            Icons.menu_book,
                            color: Color(0xFF907761),
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: 
                                const Image(image: AssetImage('img/junkfood.jpg'
                                  ),
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  'Junk Food',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF907761),
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: 
                                const Image(image: AssetImage('img/healthyfood.jpg'
                                  ),
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  'Healthy Food',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF907761),
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 40,
                                icon: Icon(
                                  Icons.search,
                                  color: Color(0xFF69503C),
                                  size: 20,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Color(0xFF69503C),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF69503C),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    /* borderRadius: BorderRadius.circular(10), */
                                    child: mainImage(path:imgHome), width: 125, height: 125,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF69503C),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 0, 10),
                                                child: Text(
                                                  titleProduct!,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 10),
                                                child: Text(
                                                  priceProduct!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 10),
                                                child: RatingBarIndicator(
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.white,
                                                  ),
                                                  direction: Axis.horizontal,
                                                  rating: calif!,
                                                  unratedColor:
                                                      Color(0xFF907761),
                                                  itemCount: 5,
                                                  itemSize: 18,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: FFButtonWidget(
                                                  
                                                  onPressed: () async {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductsWidget(
                                                              description: description!,
                                                              additives: additives!,
                                                              calif: calif!,
                                                              calories: calories!,
                                                              priceProduct: priceProduct!,
                                                              imgHome: imgHome!,
                                                              vitamins: vitamins!,
                                                              titleProduct: titleProduct!,
                                                              firstCamera: widget.firstCamera,
                                                              )),
                                                    ); // context
                                                    //     .pushNamed('Products');
                                                  },
                                                  text: 'Add to cart',
                                                  icon: Icon(
                                                    Icons.shopping_cart,
                                                    size: 15,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 40,
                                                    color: Color(0xFF907761),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    //   borderRadius:
                                                    //       BorderRadius.circular(
                                                    //           8),
                                                    // ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Color(0xFF69503C),
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x00B3AA8F),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),



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
                                  child: const Text("No products in the list")))
                          : ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: snapshot.data!.map((cat) {
                                return Center(
                                  child: GestureDetector(
                                    child: Container(
                                      child: Container(child: Image.file(File(cat.image)), height: 100, width: 100,),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        titleProduct = cat.title;
                                        priceProduct = cat.price;
                                        imgHome = cat.image;
                                        sRanking = cat.ranking;
                                        calif = double.parse(sRanking!);

                                    
                                        description = cat.description;
                                        vitamins = cat.vitamins;
                                        calories = cat.calories;
                                        additives = cat.additives;
                                        
                                      });
                                    },
                                    onLongPress: () {
                                      DatabaseHelper.instance.delete(cat.id!);
                                      setState(() {});
                                    },
                                  ),
                                );
                              }).toList());
                          }})),



                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0x00B3AA8F),
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 10,
                                borderWidth: 1,
                                buttonSize: 30,
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Color(0xFF69503C),
                                  size: 40,
                                ),
                                onPressed: () async {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen(firstCamera: widget.firstCamera)),
                                  );
                                  // context.pushNamed('ShoppingCard');
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
