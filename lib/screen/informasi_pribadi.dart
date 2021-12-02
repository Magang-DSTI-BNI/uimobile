import 'dart:js';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uimobile_web/Components/filled_category_button.dart';
import 'package:uimobile_web/Models/appbar.dart';
import 'package:uimobile_web/Models/category_bar.dart';


class InformasiPribadiScreen extends StatefulWidget {
  const InformasiPribadiScreen({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InformasiPribadiScreen();
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class _InformasiPribadiScreen extends State<InformasiPribadiScreen> {
  final List<String> entries = <String>['Pribadi', 'Kontak', 'Alamat', 'Kontak Darurat', 'Keluarga dan Tanggungan', 'Pendidikan', 'Catatan Pelatihan', 'Kompetensi', 'Evaluasi Kinerja', 'KTP NPWP', 'Nama Resmi/Ulang Tahun', 'Bibliografi', 'Nama Pegawai'];
  // final List<int> colorCodes = <int>[600, 500, 100];

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: 
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/images/icons/logo_extended.png",
                height: 38,
                width: 168,
              ),
            ),
          actions: <Widget> [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: (){

              },
                splashRadius: 18,
                hoverColor: Colors.transparent,
                
                iconSize: 24, 
                icon: const Icon(
                  Icons.notifications_outlined, 
                  color: Colors.black87,
                )),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: IconButton(
                onPressed: (){

              },
              iconSize: 38,
              splashRadius: 18,
              hoverColor: Colors.transparent,
              icon: const Icon(
                Icons.account_circle, 
                color: Colors.black87,
                )),
            ),
            ]
          ),),
          body: 
          Container(
            height: 65,
            margin: const EdgeInsets.only(top: 20),
            child: ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: ListView.separated(
                separatorBuilder: (context, index){
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.transparent,
                    ),
                  );
                },
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                controller: _controller,
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  // return Container(
                  //   width: 180,
                  //   decoration: const BoxDecoration(
                  //     color: Colors.yellow,
                  //     borderRadius: BorderRadius.all(Radius.circular(8)),
                  //   ),
                  //   margin: const EdgeInsets.only(right: 15),
                    
                  //   child: Center(child: Text(entries[index])),
                  // );
                  return FillCategoryButton(
                    text: entries[index],
                    // isFilled: false,
                    );
                }
              ),
            )
            
          )
      
    );
  }
}