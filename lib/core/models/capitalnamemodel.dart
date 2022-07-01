// class CapitalName{
//   List<String?>? _name;
//
//   List<String?>? get name => _name;
//
//
//   CapitalName.fromJson(dynamic json) {
//     _name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map['name'] = _name;
//
//     return map;
//   }
// }

// To parse this JSON data, do
//
//     final capitalName = capitalNameFromJson(jsonString);

import 'dart:convert';

List<String> CapitalNameFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String CapitalNameToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
