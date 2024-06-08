import 'package:flutter/material.dart';

class CommonMethods {

  static SnackBar snacbarMsg(String msg) {
    return SnackBar(
      content: Row(
        children: [
          Icon(Icons.location_on_rounded,color: Colors.white,size: 40,),
          Text(
            msg,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      backgroundColor: Colors.red,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(15),
    );
  }
  static String englishToBanglaNumberConverter(String number) {
    List<String> numBn = [
      ' ',
      ',',
      '০',
      '১',
      '২',
      '৩',
      '৪',
      '৫',
      '৬',
      '৭',
      '৮',
      '৯',
      '.',
      '+',
      '-',
      '*',
      '/',
      ':',
      'এ',
      'পি',
      'এম',
      '০',
      '১',
      '২',
      '৩',
      '৪',
      '৫',
      '৬',
      '৭',
      '৮',
      '৯',
    ];
    List<String> numEn = [
      ' ',
      ',',
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '.',
      '+',
      '-',
      '*',
      '/',
      ':',
      'A',
      'P',
      'M',
      '০',
      '১',
      '২',
      '৩',
      '৪',
      '৫',
      '৬',
      '৭',
      '৮',
      '৯',
    ];

    List<String> enNum = number.split('');
    String bnNum = '';
    for (String num in enNum) {
      int i = numEn.indexOf(num);
      if (i == -1) i = 0;
      bnNum = bnNum + numBn[i];
    }
    return bnNum;
  }

  static String banglaToEnglishNumberConverter(String number) {
    List<String> numBn = [
      ' ',
      ',',
      '০',
      '১',
      '২',
      '৩',
      '৪',
      '৫',
      '৬',
      '৭',
      '৮',
      '৯',
      '.',
      '+',
      '-',
      '*',
      '/',
      ':',
      'এ',
      'পি',
      'এম',
    ];
    List<String> numEn = [
      ' ',
      ',',
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '.',
      '+',
      '-',
      '*',
      '/',
      ':',
      'A',
      'P',
      'M',
    ];

    List<String> bnNum = number.split('');
    String enNum = '';
    for (String num in bnNum) {
      int i = numBn.indexOf(num);
      if (i == -1) i = 0;
      enNum = enNum + numEn[i];
    }
    return enNum;
  }
}
