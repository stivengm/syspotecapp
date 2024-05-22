import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    String code;
    String message;
    dynamic data;

    RegisterModel({
        required this.code,
        required this.message,
        required this.data,
    });

    RegisterModel copyWith({
        String? code,
        String? message,
        dynamic data,
    }) => 
        RegisterModel(
            code: code ?? this.code,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        code: json["code"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
    };
}
