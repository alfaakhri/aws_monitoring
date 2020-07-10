class UserModel {
  String uid;
  String fullname;
  String email;
  String address;

  UserModel({this.uid, this.fullname, this.email, this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    fullname = json['fullname'];
    email = json['email'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['address'] = this.address;
    return data;
  }
}