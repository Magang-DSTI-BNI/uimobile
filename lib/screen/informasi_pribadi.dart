import 'package:flutter/material.dart';
import 'package:uimobile_web/Models/appbar.dart';
import 'package:uimobile_web/Models/category_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class InformasiPribadiScreen extends StatefulWidget {
  const InformasiPribadiScreen({ 
    Key? key, 
    }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InformasiPribadiScreen();
  }
}

class _InformasiPribadiScreen extends State<InformasiPribadiScreen> {
  String kebangsaanValue = 'Warga Negara A';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppbar(),
          body: SingleChildScrollView(
            child: Column(
            children:  [
              const CategoryBar(),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, right: 250, left: 250),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#DADCE0')),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0, right: 24, bottom: 16, left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Data Pribadi',
                          style: TextStyle(
                            fontSize: 24.75,
                          ),
                          ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Nama Pegawai',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Row(

                          children: const [
                            SizedBox(
                              width: 250,
                              child: Padding(
                                padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 65),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Masukan Nama Awal',
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 450,
                              child: Padding(
                                padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 24),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Masukan Nama Tengah',
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 250,
                              child: Padding(
                                padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 24),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Masukan Nama Akhir',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Nama Display',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 512,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 65),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama Display',
                              ),
                            ),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Nama Inisial',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 270,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 65),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama Inisial',
                              ),
                            ),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Kebangsaan',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 270,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 65),
                            child: Container(
                              padding: const EdgeInsets.only(top: 2, right: 10, left: 10, bottom: 2),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: DropdownButton<String>(
                                value: kebangsaanValue,
                                hint: const Text('Pilih Kebangsaan'),
                                icon: const Icon(Icons.arrow_drop_down_rounded),
                                iconSize: 24,

                                onChanged: (String? newValue) {
                                  setState(() {
                                    kebangsaanValue = newValue!;
                                  });
                                },
                                
                                items: <String>['Warga Negara A', 'Warga Negara B', 'Warga Negara C', 'Warga Negara D'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),

                                
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          )
    );
  }
}