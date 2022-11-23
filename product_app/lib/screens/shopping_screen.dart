import 'dart:io';

import 'package:camera/camera.dart';
import 'package:product_app/models/product_model.dart';
import 'package:product_app/screens/database_shopping.dart';
import 'package:product_app/screens/products_screen.dart';
import 'package:product_app/screens/stores_screen.dart';
import '../flutter_widgets/flutter_flow_count_controller.dart';
import '../flutter_widgets/flutter_flow_icon_button.dart';
import '../flutter_widgets/flutter_flow_theme.dart';
import '../flutter_widgets/flutter_flow_util.dart';
import '../flutter_widgets/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/image_widget.dart';

class ShoppingCardWidget extends StatefulWidget {
  String? priceProduct;
  String? titleProduct;
  String? imgHome;

  
  final CameraDescription firstCamera;
  ShoppingCardWidget({Key? key, required this.firstCamera, this.imgHome, this.priceProduct, this.titleProduct})
      : super(key: key);

  @override
  _ShoppingCardWidgetState createState() => _ShoppingCardWidgetState();
}

class _ShoppingCardWidgetState extends State<ShoppingCardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? countControllerValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFF69503C),
      appBar: AppBar(
        backgroundColor: Color(0xFF69503C),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () async {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => ProductsWidget(
                        firstCamera: widget.firstCamera,

                      )),
            ); // context.pushNamed('Products');
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 680,
                  decoration: BoxDecoration(
                    color: Color(0xFF907761),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 40, 0, 0),
                                child: Text(
                                  'Quantity',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF69503C),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 10, 25, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0xFF9E9E9E),
                                          width: 1,
                                        ),
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) => Icon(
                                          Icons.arrow_left,
                                          color: enabled
                                              ? Color(0xFF69503C)
                                              : Color(0xFFEEEEEE),
                                          size: 20,
                                        ),
                                        incrementIconBuilder: (enabled) => Icon(
                                          Icons.arrow_right,
                                          color: enabled
                                              ? Color(0xFF69503C)
                                              : Color(0xFFEEEEEE),
                                          size: 20,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: Color(0xFF69503C),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        count: countControllerValue ??= 0,
                                        updateCount: (count) => setState(
                                            () => countControllerValue = count),
                                        stepSize: 1,
                                        minimum: 0,
                                        maximum: 10,
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          '0.00',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF69503C),
                                                fontSize: 16,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 25, 25, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () {
                                        final route = MaterialPageRoute(builder: (context) => StoresWidget());Navigator.push(context, route);
                                      },
                                      text: 'Stores',
                                      options: FFButtonOptions(
                                        width: 200,
                                        height: 40,
                                        color: Color(0xFF69503C),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        // borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Icon(
                                          Icons.favorite,
                                          color: Color(0xFF69503C),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FFButtonWidget(
                                onPressed: () async{
                                  DatabaseShopping.instance.deleteall();
                                  setState(() {
                                    
                                  });},
                                text: 'Delete',
                                icon: Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 17,
                                ),
                                options: FFButtonOptions(
                                  width: 90,
                                  height: 40,
                                  color: Color(0xFF907761),
                                  textStyle: FlutterFlowTheme.of(context)
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
                                  // borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                              color: Color(0xFF907761),
                            ),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [


                                Center(
              child: (FutureBuilder<List<Product>>(
                  future: DatabaseShopping.instance.getCats(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Product>> snapshot) {
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
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: snapshot.data!.map((cat) {
                                return Center(
                                  child: ListTile(
                                    title: Row(children: [Container(child: Image.file(File(cat.image)), height: 50, width: 50,),Container(child: Text('Title: ${cat.title} |Price: ${cat.price}',),width: 150,)],) 
                                    
                                    
                                  ),
                                );
                              }).toList());
                    }
                  })),
            ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}
