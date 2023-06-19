// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  var nf = NumberFormat('###,###.00', "en_US");
  
  String _selectedYearPay = "1";
  String _downPay = "10";

  TextEditingController _carpriceCtrl = TextEditingController(text: '');
  TextEditingController _interestCtrl = TextEditingController(text: '');

  List<DropdownMenuItem<String>> get _dropdownItemsYearPay {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: "1",
        child: Text("12 งวด (1 ปี)"),
      ),
      DropdownMenuItem(
        value: "2",
        child: Text("24 งวด (2 ปี)"),
      ),
      DropdownMenuItem(
        value: "3",
        child: Text("36 งวด (3 ปี)"),
      ),
      DropdownMenuItem(
        value: "4",
        child: Text("48 งวด (4 ปี)"),
      ),
      DropdownMenuItem(
        value: "5",
        child: Text("60 งวด (5 ปี)"),
      ),
      DropdownMenuItem(
        value: "6",
        child: Text("72 งวด (6 ปี)"),
      ),
      DropdownMenuItem(
        value: "7",
        child: Text("84 งวด (7 ปี)"),
      ),
    ];
    return menuItems;
  }

  _showWarningDialog(context, msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepOrange,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: GoogleFonts.kanit(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: Colors.deepOrange,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.kanit(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _showResultDialog(context, msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepOrange,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'ยอดผ่อนรถต่อเดือน',
                style: GoogleFonts.kanit(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: Colors.deepOrange,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.kanit(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'คำนวณค่างวดรถ',
            style: GoogleFonts.kanit(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: MediaQuery.of(context).size.width * 0.21,
                  child: CircleAvatar(
                    backgroundColor: Colors.deepOrange[50],
                    radius: MediaQuery.of(context).size.width * 0.19,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.18,
                      backgroundImage: AssetImage(
                        'assets/images/car.jpg',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ราคารถ (บาท)',
                      style: GoogleFonts.kanit(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: TextField(
                    controller: _carpriceCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.kanit(
                      color: Colors.grey[700],
                    ),
                    decoration: InputDecoration(
                      hintText: '0.00',
                      hintStyle: GoogleFonts.kanit(),
                      suffixText: 'บาท',
                      suffixStyle: GoogleFonts.kanit(
                        color: Colors.deepOrange,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'เงินดาวน์ (%)',
                      style: GoogleFonts.kanit(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: "10",
                      groupValue: _downPay,
                      activeColor: Colors.deepOrange,
                      onChanged: (value) {
                        setState(() {
                          _downPay = value!;
                        });
                      },
                    ),
                    Text(
                      '10%',
                      style: GoogleFonts.kanit(
                        color: Colors.grey[700],
                      ),
                    ),
                    Radio(
                      value: "20",
                      groupValue: _downPay,
                      activeColor: Colors.deepOrange,
                      onChanged: (value) {
                        setState(() {
                          _downPay = value!;
                        });
                      },
                    ),
                    Text(
                      '20%',
                      style: GoogleFonts.kanit(
                        color: Colors.grey[700],
                      ),
                    ),
                    Radio(
                      value: "25",
                      groupValue: _downPay,
                      activeColor: Colors.deepOrange,
                      onChanged: (value) {
                        setState(() {
                          _downPay = value!;
                        });
                      },
                    ),
                    Text(
                      '25%',
                      style: GoogleFonts.kanit(
                        color: Colors.grey[700],
                      ),
                    ),
                    Radio(
                      value: "30",
                      groupValue: _downPay,
                      activeColor: Colors.deepOrange,
                      onChanged: (value) {
                        setState(() {
                          _downPay = value!;
                        });
                      },
                    ),
                    Text(
                      '30%',
                      style: GoogleFonts.kanit(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'จำนวนปีที่ผ่อน',
                      style: GoogleFonts.kanit(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: _dropdownItemsYearPay,
                        value: _selectedYearPay,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedYearPay = value!;
                          });
                        },
                        style: GoogleFonts.kanit(
                          color: Colors.grey[700],
                        ),
                        iconEnabledColor: Colors.grey[700],
                        dropdownColor: Colors.deepOrange[50],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ดอกเบี้ย (%) ต่อปี',
                      style: GoogleFonts.kanit(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: TextField(
                    controller: _interestCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.kanit(
                      color: Colors.grey[700],
                    ),
                    decoration: InputDecoration(
                      hintText: '0.00',
                      hintStyle: GoogleFonts.kanit(),
                      suffixText: '% ต่อปี',
                      suffixStyle: GoogleFonts.kanit(
                        color: Colors.deepOrange,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_carpriceCtrl.text.isEmpty == true) {
                      _showWarningDialog(context, 'ป้อนราคารถ (บาท) ด้วย...');
                    } else if (_interestCtrl.text.isEmpty == true) {
                      _showWarningDialog(
                          context, 'ป้อนดอกเบี้ย (%) ต่อปีด้วย....');
                    } else {
                      double carpriceValue = double.parse(_carpriceCtrl.text);
                      double interestValue = double.parse(_interestCtrl.text);
                      int downValue = int.parse(_downPay);
                      int yearValue = int.parse(_selectedYearPay);
                      //คำนวนเงินดาวน์
                      double downPay = carpriceValue * downValue / 100;
                      //คำนวนยอดจัด
                      double carpricePay = carpriceValue - downPay;
                      //คำนวณดอกเบี้ย
                      double interestPay =
                          carpricePay * interestValue / 100 * yearValue;
                      //ยอดผ่อนต่อเดือน
                      double carPayPerMonth =
                          (carpricePay + interestPay) / (yearValue * 12);

                      String msg = 'รถราคา ${nf.format(carpriceValue)} บาท\n';
                      msg +=
                          'ดาวน์ ${downValue}% เป็นเงิน ${nf.format(downPay)} บาท\n';
                      msg += 'จำนวนเดือนผ่อน ${yearValue * 12} เดือน\n';
                      msg += 'ค่าผ่อนต่อเดือน ${nf.format(carPayPerMonth)} บาท';
                      _showResultDialog(context, msg);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.7,
                      MediaQuery.of(context).size.width * 0.15,
                    ),
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text(
                    'คำนวณค่างวดรถ',
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
