import 'package:flutter/material.dart';
import 'package:uimobile_web/Models/appbar.dart';
import 'package:uimobile_web/Models/category_bar.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:intl/intl.dart';

class KtpScreen extends StatefulWidget {
  const KtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KtpScreen();
  }
}

class _KtpScreen extends State<KtpScreen> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CategoryBar(),
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, right: 250, left: 250),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#DADCE0')),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, right: 24, bottom: 16, left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'KTP/NPWP',
                          style: TextStyle(
                            fontSize: 24.75,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Nomor Kartu Identitas',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 512,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 12.0, bottom: 12.0, left: 65),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nomor Kartu Identitas',
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Nomor Pokok Wajib Pajak',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 512,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 12.0, bottom: 12.0, left: 65),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nomor Pokok Wajib Pajak',
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Tanggal NPWP',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 65),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 270,
                                child: TextField(
                                  focusNode: AlwaysDisabledFocusNode(),
                                  controller: _textEditingController,
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: "dd/mm/yyyy",
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.date_range_rounded),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        Text(
                            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
