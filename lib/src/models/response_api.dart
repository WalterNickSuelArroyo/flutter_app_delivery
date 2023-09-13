import 'dart:convert';

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
    bool? sucess;
    String? message;
    dynamic data;

    ResponseApi({
        this.sucess,
        this.message,
        this.data
    });

    factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
        sucess: json["sucess"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "sucess": sucess,
        "message": message,
        "data": data,
    };
}
