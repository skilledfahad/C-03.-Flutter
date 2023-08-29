class LoginModel {
  String? _status;
  String? _token;
  UserData? _data;

  LoginModel({String? status, String? token, UserData? data}) {
    if (status != null) {
      this._status = status;
    }
    if (token != null) {
      this._token = token;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  String? get token => _token;
  set token(String? token) => _token = token;
  UserData? get data => _data;
  set data(UserData? data) => _data = data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _token = json['token'];
    _data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['token'] = this._token;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class UserData {
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _mobile;
  String? _photo;

  UserData(
      {String? email,
        String? firstName,
        String? lastName,
        String? mobile,
        String? photo}) {
    if (email != null) {
      this._email = email;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (photo != null) {
      this._photo = photo;
    }
  }

  String? get email => _email;
  set email(String? email) => _email = email;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get photo => _photo;
  set photo(String? photo) => _photo = photo;

  UserData.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _mobile = json['mobile'];
    _photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['mobile'] = this._mobile;
    data['photo'] = this._photo;
    return data;
  }
}