// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String code;
    String message;
    List<Data?> data;

    LoginModel({
        required this.code,
        required this.message,
        required this.data,
    });

    LoginModel copyWith({
        String? code,
        String? message,
        List<Data>? data,
    }) => 
        LoginModel(
            code: code ?? this.code,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x?.toJson())),
    };
}

class Data {
    String? token;
    String? refreshToken;
    UserData? userData;

    Data({
        this.token,
        this.refreshToken,
        this.userData,
    });

    Data copyWith({
        String? token,
        String? refreshToken,
        UserData? userData,
    }) => 
        Data(
            token: token ?? this.token,
            refreshToken: refreshToken ?? this.refreshToken,
            userData: userData ?? this.userData,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        refreshToken: json["refreshToken"],
        userData: UserData.fromJson(json["userData"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "userData": userData?.toJson(),
    };
}

class UserData {
    Company company;
    Gender gender;
    IdentificationType identificationType;
    String email;
    String name;
    String lastName;
    String identificationNumber;
    String phone;
    String address;
    String image;

    UserData({
        required this.company,
        required this.gender,
        required this.identificationType,
        required this.email,
        required this.name,
        required this.lastName,
        required this.identificationNumber,
        required this.phone,
        required this.address,
        required this.image,
    });

    UserData copyWith({
        Company? company,
        Gender? gender,
        IdentificationType? identificationType,
        String? email,
        String? name,
        String? lastName,
        String? identificationNumber,
        String? phone,
        String? address,
        String? image,
    }) => 
        UserData(
            company: company ?? this.company,
            gender: gender ?? this.gender,
            identificationType: identificationType ?? this.identificationType,
            email: email ?? this.email,
            name: name ?? this.name,
            lastName: lastName ?? this.lastName,
            identificationNumber: identificationNumber ?? this.identificationNumber,
            phone: phone ?? this.phone,
            address: address ?? this.address,
            image: image ?? this.image,
        );

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        company: Company.fromJson(json["company"]),
        gender: Gender.fromJson(json["gender"]),
        identificationType: IdentificationType.fromJson(json["identificationType"]),
        email: json["email"],
        name: json["name"],
        lastName: json["lastName"],
        identificationNumber: json["identificationNumber"],
        phone: json["phone"],
        address: json["address"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "company": company.toJson(),
        "gender": gender.toJson(),
        "identificationType": identificationType.toJson(),
        "email": email,
        "name": name,
        "lastName": lastName,
        "identificationNumber": identificationNumber,
        "phone": phone,
        "address": address,
        "image": image,
    };
}

class Company {
    String name;
    String nit;
    String phone;
    String address;

    Company({
        required this.name,
        required this.nit,
        required this.phone,
        required this.address,
    });

    Company copyWith({
        String? name,
        String? nit,
        String? phone,
        String? address,
    }) => 
        Company(
            name: name ?? this.name,
            nit: nit ?? this.nit,
            phone: phone ?? this.phone,
            address: address ?? this.address,
        );

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        nit: json["nit"],
        phone: json["phone"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "nit": nit,
        "phone": phone,
        "address": address,
    };
}

class Gender {
    int id;
    String name;

    Gender({
        required this.id,
        required this.name,
    });

    Gender copyWith({
        int? id,
        String? name,
    }) => 
        Gender(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class IdentificationType {
    int id;
    String name;

    IdentificationType({
        required this.id,
        required this.name,
    });

    IdentificationType copyWith({
        int? id,
        String? name,
    }) => 
        IdentificationType(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory IdentificationType.fromJson(Map<String, dynamic> json) => IdentificationType(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
