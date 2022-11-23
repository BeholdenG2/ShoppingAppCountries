import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../flutter_widgets/flutter_flow_icon_button.dart';
import '../flutter_widgets/flutter_flow_theme.dart';
import '../flutter_widgets/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class StoresWidget extends StatefulWidget {
  const StoresWidget({Key? key}) : super(key: key);

  @override
  _StoresWidgetState createState() => _StoresWidgetState();
}

class _StoresWidgetState extends State<StoresWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List AllCountries = [];


  @override
  void initState() {
    super.initState();
    getCountries();
  }
  void getCountries() async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("countries");
    QuerySnapshot countries = await collectionReference.get();
    
    if (countries.docs.length != 0){
      for (var doc in countries.docs) {
        AllCountries.add(doc.data());
      }
      print(AllCountries);
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF69503C),
      appBar: AppBar(
        backgroundColor: Color(0x907761),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Color(0xFF69503C),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(80, 50, 0, 50),
                    child: ListView.builder(
                      
                                  itemCount: AllCountries.length,
                                  itemBuilder: (context, index) {
                                  
                                  return SizedBox(
                                    height: 150,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(child: Image.network(AllCountries[index]["Flag"]), width: 150,
                                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),),
                                       Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AllCountries[index]["Name"],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                ),
                                          ),
                                          Text(
                                            'Stores: '+ AllCountries[index]["Store"],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                          ),
                                          Text(
                                            'Population: ' + AllCountries[index]["Population"],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ]
                                      ),
                                      ]
                                    ),
                                  );
                                  }
                                ),
                            
                          ),
                        ),
                      
                    
                  ),
            ],
          ),
        ),
      ),
    );
  }
}



