import 'dart:convert';

import 'package:crypto/crypto.dart';
// import 'package:flutter/material.dart';

List<String> nameHash(String name) {
  String sname = soundEx(name, soundex: false);
  // debugPrint(sname);
  return [sname, md5.convert(utf8.encode(sname)).toString()];
}

List<String> dobHash(String dob, String gen) {
  List<String> prts = dob.split('-');
  num yer = int.parse(prts[0]);
  num yer1 = (yer ~/ 5).toInt() * 5;
  num yer2 = ((yer + 5) ~/ 5).toInt() * 5;
  String ageId = "$gen${yer1.toString()}-${yer2.toString()}";
  // debugPrint(ageId);
  return [ageId, md5.convert(utf8.encode(ageId)).toString()];
}

List<String> addresHash(String addr) {
  String saddr = soundEx(addr);
  return [saddr, md5.convert(utf8.encode(saddr)).toString()];
}

String soundEx(String words, {bool soundex = true}) {
  words = words.trim().toLowerCase();
  words = words.replaceAll(
      RegExp(
          r'(mr )|(mr\. )|(mrs )|(mrs\. )|(miss )|(miss\. )|(ms )|(ms\. )|(dr )|(dr\. )|(md )|(md\. )|(madam )|(madame )|(prof )|(prof\. )|(do )|(do\. )|(sir )|(sir\. )|(sre )|(sre\. )|(sree )|(sree\. )|(mosammat )|(begum )|(mst )|(mst\. )'),
      "");
  words = words.replaceAll(
      RegExp(r"(\s)|(,)|(\.)|(;)|(:)|(-)|(!)|(\?)|(/)|([1-9])|(\')"), "");
  String st = words[0];
  String left = words.substring(1);
  left = left.replaceAll(RegExp(r'[aeiouwhy]'), "");
  // debugPrint(left);
  if (soundex) {
    String numbs = toNumber(left);
    return st.toUpperCase() + numbs;
  } else {
    left = left.replaceAll('q', "k");
    left = left.replaceAll(RegExp(r'[gz]'), 'j');
    return st + left;
  }
}

String toNumber(String word) {
  word = word.replaceAll(RegExp(r'[bfpv]'), "1");
  word = word.replaceAll(RegExp(r'[cgjkqsxz]'), "2");
  word = word.replaceAll(RegExp(r'[dt]'), "3");
  word = word.replaceAll('l', '4');
  word = word.replaceAll(RegExp(r'[mn]'), "5");
  word = word.replaceAll('r', '6');
  List<String> sme = [
    "11",
    "22",
    "33",
    "44",
    "55",
    "66",
    "77",
    "88",
    "99"
  ]; // regex (.)\1
  for (String w in sme) {
    word = word.replaceAll(w, w[0]);
    word = word.replaceAll(w, w[0]);
  }
  return word.padRight(3, '0').substring(0, 3);
}
