// To parse this JSON data, do
//
//     final carModel = carModelFromJson(jsonString);

import 'dart:convert';

class CarModel {
  CarModel({
    required this.id,
    required this.car,
    required this.rate,
  });

  final String id;
  final Car car;
  final List<Rate> rate;

  factory CarModel.fromRawJson(String str) => CarModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        id: json["_id"],
        car: Car.fromJson(json["car"]),
        rate: List<Rate>.from(json["rate"].map((x) => Rate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "car": car.toJson(),
        "rate": List<dynamic>.from(rate.map((x) => x.toJson())),
      };
}

class Car {
  Car({
    required this.models,
    required this.picturecardurl,
    required this.picturecardurlSmall,
    required this.classid,
    required this.id,
  });

  final String models;
  final String picturecardurl;
  final String picturecardurlSmall;
  final int classid;
  final String id;

  factory Car.fromRawJson(String str) => Car.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        models: json["models"],
        picturecardurl: json["picturecardurl"],
        picturecardurlSmall: "https://crm.getmancar.com.ua" + json["picturecardurl_small"],
        classid: json["classid"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "models": models,
        "picturecardurl": picturecardurl,
        "picturecardurl_small": picturecardurlSmall,
        "classid": classid,
        "_id": id,
      };
}

class Rate {
  Rate({
    required this.rateName,
    required this.name,
    required this.price,
    required this.parkrate,
    required this.packtype,
    required this.priceTitle,
    required this.backSide,
    required this.comment,
    required this.activeInsurance,
    required this.priceWithInsurance,
    required this.overruncostWithInsurance,
    required this.timeFrom,
    required this.timeto,
    required this.applymonday,
    required this.applytuesday,
    required this.applywednesday,
    required this.applythursday,
    required this.applyfriday,
    required this.applysaturday,
    required this.applysunday,
    required this.hold,
    required this.description,
    required this.minPrice,
    required this.maxPrice,
    required this.priceArr,
  });

  final String rateName;
  final String name;
  final String price;
  final int parkrate;
  final String packtype;
  final String priceTitle;
  final bool backSide;
  final String comment;
  final bool activeInsurance;
  final double priceWithInsurance;
  final int overruncostWithInsurance;
  final int timeFrom;
  final int timeto;
  final bool applymonday;
  final bool applytuesday;
  final bool applywednesday;
  final bool applythursday;
  final bool applyfriday;
  final bool applysaturday;
  final bool applysunday;
  final int hold;
  final List<Description> description;
  final double minPrice;
  final double maxPrice;
  final List<double> priceArr;

  factory Rate.fromRawJson(String str) => Rate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        rateName: json["rateName"],
        name: json["name"],
        price: json["price"].toString(),
        parkrate: json["parkrate"],
        packtype: json["packtype"],
        priceTitle: json["price_title"],
        backSide: json["back_side"],
        comment: json["comment"],
        activeInsurance: json["activeInsurance"],
        priceWithInsurance: json["priceWithInsurance"].toDouble(),
        overruncostWithInsurance: json["overruncostWithInsurance"],
        timeFrom: json["timeFrom"],
        timeto: json["timeto"],
        applymonday: json["applymonday"],
        applytuesday: json["applytuesday"],
        applywednesday: json["applywednesday"],
        applythursday: json["applythursday"],
        applyfriday: json["applyfriday"],
        applysaturday: json["applysaturday"],
        applysunday: json["applysunday"],
        hold: json["hold"],
        description: List<Description>.from(json["description"].map((x) => Description.fromJson(x))),
        minPrice: json["min_price"].toDouble(),
        maxPrice: json["max_price"].toDouble(),
        priceArr: List<double>.from(json["priceArr"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "rateName": rateName,
        "name": name,
        "price": price,
        "parkrate": parkrate,
        "packtype": packtype,
        "price_title": priceTitle,
        "back_side": backSide,
        "comment": comment,
        "activeInsurance": activeInsurance,
        "priceWithInsurance": priceWithInsurance,
        "overruncostWithInsurance": overruncostWithInsurance,
        "timeFrom": timeFrom,
        "timeto": timeto,
        "applymonday": applymonday,
        "applytuesday": applytuesday,
        "applywednesday": applywednesday,
        "applythursday": applythursday,
        "applyfriday": applyfriday,
        "applysaturday": applysaturday,
        "applysunday": applysunday,
        "hold": hold,
        "description": List<dynamic>.from(description.map((x) => x.toJson())),
        "min_price": minPrice,
        "max_price": maxPrice,
        "priceArr": List<dynamic>.from(priceArr.map((x) => x)),
      };
}

class Description {
  Description({
    required this.val,
    required this.title,
    required this.desc,
    required this.type,
    required this.comment,
  });

  final double val;
  final String title;
  final String desc;
  final int type;
  final String comment;

  factory Description.fromRawJson(String str) => Description.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        val: json["val"].toDouble(),
        title: json["title"],
        desc: json["desc"],
        type: json["type"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "val": val,
        "title": title,
        "desc": desc,
        "type": type,
        "comment": comment,
      };
}
