import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uimobile_web/Components/filled_category_button.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({ Key? key }) : super(key: key);

  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class _CategoryBarState extends State<CategoryBar> {
  final List<String> entries = <String>['Pribadi', 'Kontak', 'Alamat', 'Kontak Darurat', 'Keluarga dan Tanggungan', 'Pendidikan', 'Catatan Pelatihan', 'Kompetensi', 'Evaluasi Kinerja', 'KTP NPWP', 'Nama Resmi/Ulang Tahun', 'Bibliografi', 'Nama Pegawai'];
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  return FillCategoryButton(
                    text: entries[index],
                    );
                }
              ),
            )
            
          );
  }
}