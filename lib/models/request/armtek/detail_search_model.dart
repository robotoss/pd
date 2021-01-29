// To parse this JSON data, do
//
//     final detailSearchModel = detailSearchModelFromJson(jsonString);

import 'dart:convert';

DetailSearchModel detailSearchModelFromJson(String str) =>
    DetailSearchModel.fromJson(json.decode(str) as Map<String, dynamic>);

class DetailSearchModel {
  DetailSearchModel({
    this.status,
    this.messages,
    this.resp,
  });

  int status;
  List<dynamic> messages;
  List<Resp> resp;

  factory DetailSearchModel.fromJson(Map<String, dynamic> json) =>
      DetailSearchModel(
        status: json["STATUS"] == null ? null : json["STATUS"] as int,
        messages: json["MESSAGES"] == null
            ? null
            : List<dynamic>.from(
                json["MESSAGES"].map((x) => x).toList() as List<dynamic>),
        resp: json["RESP"] == null
            ? null
            : List<Resp>.from(json["RESP"]
                .map((x) => Resp.fromJson(x as Map<String, dynamic>))
                .toList() as List<dynamic>),
      );
}

class Resp {
  Resp({
    this.pin,
    this.brand,
    this.name,
    this.artid,
    this.parnr,
    this.keyzak,
    this.rvalue,
    this.rdprf,
    this.minbm,
    this.retdays,
    this.vensl,
    this.price,
    this.waers,
    this.dlvdt,
    this.wrntdt,
    this.analog,
  });

  String pin;
  String brand;
  String name;
  String artid;
  String parnr;
  String keyzak;
  String rvalue;
  String rdprf;
  String minbm;
  String retdays;
  String vensl;
  String price;
  Waers waers;
  String dlvdt;
  String wrntdt;
  Analog analog;

  factory Resp.fromJson(Map<String, dynamic> json) => Resp(
        pin: json["PIN"] == null ? null : json["PIN"] as String,
        brand: json["BRAND"] == null ? null : json["BRAND"] as String,
        name: json["NAME"] == null ? null : json["NAME"] as String,
        artid: json["ARTID"] == null ? null : json["ARTID"] as String,
        parnr: json["PARNR"] == null ? null : json["PARNR"] as String,
        keyzak: json["KEYZAK"] == null ? null : json["KEYZAK"] as String,
        rvalue: json["RVALUE"] == null ? null : json["RVALUE"] as String,
        rdprf: json["RDPRF"] == null ? null : json["RDPRF"] as String,
        minbm: json["MINBM"] == null ? null : json["MINBM"] as String,
        retdays: json["RETDAYS"] == null ? null : json["RETDAYS"] as String,
        vensl: json["VENSL"] == null ? null : json["VENSL"] as String,
        price: json["PRICE"] == null ? null : json["PRICE"] as String,
        waers: json["WAERS"] == null ? null : waersValues.map[json["WAERS"]],
        dlvdt: json["DLVDT"] == null ? null : json["DLVDT"] as String,
        wrntdt: json["WRNTDT"] == null ? null : json["WRNTDT"] as String,
        analog:
            json["ANALOG"] == null ? null : analogValues.map[json["ANALOG"]],
      );
}

enum Analog { X }

final analogValues = EnumValues({"X": Analog.X});

enum Waers { KZT }

final waersValues = EnumValues({"KZT": Waers.KZT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
