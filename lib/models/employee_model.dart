class Data {
  String? id;
  String? email;
  String? password;
  String? token;
  dynamic fcmToken;
  String? ip;
  String? username;
  String? firstName;
  String? lastName;
  String? avatar;
  dynamic idProof;
  String? joined;
  String? joinedDate;
  String? onlineTimestamp;
  String? oauthProvider;
  String? oauthId;
  String? oauthToken;
  String? oauthSecret;
  String? emailNotification;
  String? aboutme;
  String? points;
  String? premiumTime;
  String? userRole;
  String? allocatedClient;
  String? premiumPlanid;
  String? active;
  String? activateCode;
  String? type;
  String? dl;
  String? contactNumber;
  String? parentNumber;
  String? sendSms;
  String? sendEmail;
  String? permission;
  String? sessionTime;

  Data({
    this.id,
    this.email,
    this.password,
    this.token,
    this.fcmToken,
    this.ip,
    this.username,
    this.firstName,
    this.lastName,
    this.avatar,
    this.idProof,
    this.joined,
    this.joinedDate,
    this.onlineTimestamp,
    this.oauthProvider,
    this.oauthId,
    this.oauthToken,
    this.oauthSecret,
    this.emailNotification,
    this.aboutme,
    this.points,
    this.premiumTime,
    this.userRole,
    this.allocatedClient,
    this.premiumPlanid,
    this.active,
    this.activateCode,
    this.type,
    this.dl,
    this.contactNumber,
    this.parentNumber,
    this.sendSms,
    this.sendEmail,
    this.permission,
    this.sessionTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['ID'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        token: json['token'] as String?,
        fcmToken: json['fcm_token'],
        ip: json['IP'] as String?,
        username: json['username'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        avatar: json['avatar'] as String?,
        idProof: json['id_proof'],
        joined: json['joined'] as String?,
        joinedDate: json['joined_date'] as String?,
        onlineTimestamp: json['online_timestamp'] as String?,
        oauthProvider: json['oauth_provider'] as String?,
        oauthId: json['oauth_id'] as String?,
        oauthToken: json['oauth_token'] as String?,
        oauthSecret: json['oauth_secret'] as String?,
        emailNotification: json['email_notification'] as String?,
        aboutme: json['aboutme'] as String?,
        points: json['points'] as String?,
        premiumTime: json['premium_time'] as String?,
        userRole: json['user_role'] as String?,
        allocatedClient: json['allocated_client'] as String?,
        premiumPlanid: json['premium_planid'] as String?,
        active: json['active'] as String?,
        activateCode: json['activate_code'] as String?,
        type: json['type'] as String?,
        dl: json['dl'] as String?,
        contactNumber: json['contact_number'] as String?,
        parentNumber: json['parent_number'] as String?,
        sendSms: json['send_sms'] as String?,
        sendEmail: json['send_email'] as String?,
        permission: json['permission'] as String?,
        sessionTime: json['session_time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'email': email,
        'password': password,
        'token': token,
        'fcm_token': fcmToken,
        'IP': ip,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar,
        'id_proof': idProof,
        'joined': joined,
        'joined_date': joinedDate,
        'online_timestamp': onlineTimestamp,
        'oauth_provider': oauthProvider,
        'oauth_id': oauthId,
        'oauth_token': oauthToken,
        'oauth_secret': oauthSecret,
        'email_notification': emailNotification,
        'aboutme': aboutme,
        'points': points,
        'premium_time': premiumTime,
        'user_role': userRole,
        'allocated_client': allocatedClient,
        'premium_planid': premiumPlanid,
        'active': active,
        'activate_code': activateCode,
        'type': type,
        'dl': dl,
        'contact_number': contactNumber,
        'parent_number': parentNumber,
        'send_sms': sendSms,
        'send_email': sendEmail,
        'permission': permission,
        'session_time': sessionTime,
      };
}

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
