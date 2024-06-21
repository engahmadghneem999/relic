// To parse this JSON data, do
//
//     final reservationsPageModel = reservationsPageModelFromJson(jsonString);

import 'dart:convert';


class ReservationsPageModel {
  int? id;
  User? user;
  Travel? travel;
  TravelDegree? travelDegree;
  int? sure;
  int? count;
  DateTime? goDate;
  DateTime? backDate;
  int? adultCount;
  int? childCount;
  int? infantCount;
  dynamic bookingRef;
  String? status;
  int? cost;
  List<TravelerNew>? travelers;

  ReservationsPageModel({
    this.id,
    this.user,
    this.travel,
    this.travelDegree,
    this.sure,
    this.count,
    this.goDate,
    this.backDate,
    this.adultCount,
    this.childCount,
    this.infantCount,
    this.bookingRef,
    this.status,
    this.cost,
    this.travelers,
  });

  factory ReservationsPageModel.fromRawJson(String str) =>
      ReservationsPageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservationsPageModel.fromJson(Map<String, dynamic> json) =>
      ReservationsPageModel(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        travel: json["travel"] == null ? null : Travel.fromJson(json["travel"]),
        travelDegree: json["travel_degree"] == null
            ? null
            : TravelDegree.fromJson(json["travel_degree"]),
        sure: json["sure"],
        count: json["count"],
        goDate:
            json["go_date"] == null ? null : DateTime.parse(json["go_date"]),
        backDate: json["back_date"] == null
            ? null
            : DateTime.parse(json["back_date"]),
        adultCount: json["adult_count"],
        childCount: json["child_count"],
        infantCount: json["infant_count"],
        bookingRef: json["booking_REF"],
        status: json["status"],
        cost: json["cost"],
        travelers: json["travelers"] == null
            ? []
            : List<TravelerNew>.from(
                json["travelers"]!.map((x) => TravelerNew.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "travel": travel?.toJson(),
        "travel_degree": travelDegree?.toJson(),
        "sure": sure,
        "count": count,
        "go_date":
            "${goDate!.year.toString().padLeft(4, '0')}-${goDate!.month.toString().padLeft(2, '0')}-${goDate!.day.toString().padLeft(2, '0')}",
        "back_date":
            "${backDate!.year.toString().padLeft(4, '0')}-${backDate!.month.toString().padLeft(2, '0')}-${backDate!.day.toString().padLeft(2, '0')}",
        "adult_count": adultCount,
        "child_count": childCount,
        "infant_count": infantCount,
        "booking_REF": bookingRef,
        "status": status,
        "cost": cost,
        "travelers": travelers == null
            ? []
            : List<dynamic>.from(travelers!.map((x) => x.toJson())),
      };
}

class Travel {
  int? id;
  Destination? destination;
  List<String>? weekDays;
  String? weight;
  String? leaveTime;
  List<EconomicVip>? economic;
  List<EconomicVip>? vip;

  Travel({
    this.id,
    this.destination,
    this.weekDays,
    this.weight,
    this.leaveTime,
    this.economic,
    this.vip,
  });

  factory Travel.fromRawJson(String str) => Travel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
        id: json["id"],
        destination: json["destination"] == null
            ? null
            : Destination.fromJson(json["destination"]),
        weekDays: json["week_days"] == null
            ? []
            : List<String>.from(json["week_days"]!.map((x) => x)),
        weight: json["weight"],
        leaveTime: json["leave_time"],
        economic: json["economic"] == null
            ? []
            : List<EconomicVip>.from(
                json["economic"]!.map((x) => EconomicVip.fromJson(x))),
        vip: json["vip"] == null
            ? []
            : List<EconomicVip>.from(
                json["vip"]!.map((x) => EconomicVip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "destination": destination?.toJson(),
        "week_days":
            weekDays == null ? [] : List<dynamic>.from(weekDays!.map((x) => x)),
        "weight": weight,
        "leave_time": leaveTime,
        "economic": economic == null
            ? []
            : List<dynamic>.from(economic!.map((x) => x.toJson())),
        "vip": vip == null ? [] : List<dynamic>.from(vip!.map((x) => x)),
      };
}

class Destination {
  int? id;
  Airline? airline;
  City? startCity;
  City? endCity;

  Destination({
    this.id,
    this.airline,
    this.startCity,
    this.endCity,
  });

  factory Destination.fromRawJson(String str) =>
      Destination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        id: json["id"],
        airline:
            json["airline"] == null ? null : Airline.fromJson(json["airline"]),
        startCity: json["start_city"] == null
            ? null
            : City.fromJson(json["start_city"]),
        endCity:
            json["end_city"] == null ? null : City.fromJson(json["end_city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "airline": airline?.toJson(),
        "start_city": startCity?.toJson(),
        "end_city": endCity?.toJson(),
      };
}

class Airline {
  int? id;
  String? name;
  String? image;

  Airline({
    this.id,
    this.name,
    this.image,
  });

  factory Airline.fromRawJson(String str) => Airline.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

class City {
  int? id;
  String? name;
  String? airportName;
  String? code;

  City({
    this.id,
    this.name,
    this.airportName,
    this.code,
  });

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        airportName: json["airport_name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "airport_name": airportName,
        "code": code,
      };
}

class EconomicVip {
  int? id;
  int? travelId;
  String? type;
  String? title;
  String? det;
  int? price;
  String? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  EconomicVip({
    this.id,
    this.travelId,
    this.type,
    this.title,
    this.det,
    this.price,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory EconomicVip.fromRawJson(String str) =>
      EconomicVip.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EconomicVip.fromJson(Map<String, dynamic> json) => EconomicVip(
        id: json["id"],
        travelId: json["travel_id"],
        type: json["type"],
        title: json["title"],
        det: json["det"],
        price: json["price"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "travel_id": travelId,
        "type": type,
        "title": title,
        "det": det,
        "price": price,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class TravelDegree {
  int? id;
  String? type;
  String? title;
  String? det;
  int? price;
  String? status;

  TravelDegree({
    this.id,
    this.type,
    this.title,
    this.det,
    this.price,
    this.status,
  });

  factory TravelDegree.fromRawJson(String str) =>
      TravelDegree.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TravelDegree.fromJson(Map<String, dynamic> json) => TravelDegree(
        id: json["id"],
        type: json["type"],
        title: json["title"],
        det: json["det"],
        price: json["price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "title": title,
        "det": det,
        "price": price,
        "status": status,
      };
}

class TravelerNew {
  int? id;
  String? name;
  String? nickname;
  String? job;
  String? birthday;
  String? country;
  String? gender;
  String? image;
  String? passportId;
  int? ticketId;
  String? selectimageName ;
  String? travelerStatus;
  String? travelerType;
  int? cost;

  TravelerNew({
    this.id,
    this.name,
    this.selectimageName,
    this.nickname,
    this.job,
    this.birthday,
    this.country,
    this.gender,
    this.image,
    this.passportId,
    this.ticketId,
    this.travelerStatus,
    this.travelerType,
    this.cost,
  });

  factory TravelerNew.fromRawJson(String str) =>
      TravelerNew.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TravelerNew.fromJson(Map<String, dynamic> json) => TravelerNew(
        id: json["id"],
        name: json["name"],
        nickname: json["nickname"],
        job: json["job"],
        birthday: json["birthday"],
        country: json["country"],
        gender: json["gender"],
        image: json["image"],
        passportId: json["passport_id"],
        ticketId: json["ticket_id"],
        travelerStatus: json["traveler_status"],
        travelerType: json["type"],
        cost: json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nickname": nickname,
        "job": job,
        "birthday": birthday,
        "country": country,
        "gender": gender,
        "image": image,
        "passport_id": passportId,
        "ticket_id": ticketId,
        "traveler_status": travelerStatus,
        "type": travelerType,
        "cost": cost,
      };
}

class User {
  int? id;
  String? name;
  String? email;
  String? image;
  String? phoneCode;
  String? phone;
  String? role;
  int? code;

  User({
    this.id,
    this.name,
    this.email,
    this.image,
    this.phoneCode,
    this.phone,
    this.role,
    this.code,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        phoneCode: json["phone_code"],
        phone: json["phone"],
        role: json["role"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "phone_code": phoneCode,
        "phone": phone,
        "role": role,
        "code": code,
      };
}
