import 'dart:convert';

List<GetContractModel> getContractModelFromJson(String str) => List<GetContractModel>.from(json.decode(str).map((x) => GetContractModel.fromJson(x)));

String getContractModelToJson(List<GetContractModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetContractModel {
    int id;
    Contract contract;
    State state;
    dynamic user;
    String userName;

    GetContractModel({
        required this.id,
        required this.contract,
        required this.state,
        required this.user,
        required this.userName,
    });

    GetContractModel copyWith({
        int? id,
        Contract? contract,
        State? state,
        dynamic user,
        String? userName,
    }) => 
        GetContractModel(
            id: id ?? this.id,
            contract: contract ?? this.contract,
            state: state ?? this.state,
            user: user ?? this.user,
            userName: userName ?? this.userName,
        );

    factory GetContractModel.fromJson(Map<String, dynamic> json) => GetContractModel(
        id: json["id"],
        contract: Contract.fromJson(json["contract"]),
        state: State.fromJson(json["state"]),
        user: json["user"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "contract": contract.toJson(),
        "state": state.toJson(),
        "user": user,
        "userName": userName,
    };
}

class Contract {
    Company company;
    String name;
    String description;
    String contractFile;

    Contract({
        required this.company,
        required this.name,
        required this.description,
        required this.contractFile,
    });

    Contract copyWith({
        Company? company,
        String? name,
        String? description,
        String? contractFile,
    }) => 
        Contract(
            company: company ?? this.company,
            name: name ?? this.name,
            description: description ?? this.description,
            contractFile: contractFile ?? this.contractFile,
        );

    factory Contract.fromJson(Map<String, dynamic> json) => Contract(
        company: Company.fromJson(json["company"]),
        name: json["name"],
        description: json["description"],
        contractFile: json["contractFile"],
    );

    Map<String, dynamic> toJson() => {
        "company": company.toJson(),
        "name": name,
        "description": description,
        "contractFile": contractFile,
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

class State {
    int id;
    String name;

    State({
        required this.id,
        required this.name,
    });

    State copyWith({
        int? id,
        String? name,
    }) => 
        State(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
