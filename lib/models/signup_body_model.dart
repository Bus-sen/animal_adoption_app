class SignUpBody{
  String name;
  String surname;
  String email;
  String password;
  String phone;
  String address;
  SignUpBody({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.phone,
    required this.address
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = this.name;
    data["f_surname"] = this.surname;
    data["email"] = this.email;
    data["password"] = this.password;
    data["f_phone"] = this.phone;
    data["f_address"] = this.address;
    return data;
  }
}