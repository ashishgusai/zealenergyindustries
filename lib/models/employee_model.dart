import 'data.dart';

class EmployeeModel {
  bool? status;
  String? message;
  List<Data>? data;
  bool? logout;

  EmployeeModel({this.status, this.message, this.data, this.logout});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
        logout: json['logout'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
        'logout': logout,
      };
}
