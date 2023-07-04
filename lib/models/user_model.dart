class UserModel {
  int id;
  String name;
  String surname;
  String email;
  int orderCount;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.orderCount
  });

  // database'deki kolonlar:
  // json["...."] içinde yazılı isimler kolon isimleri.
  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(id: json["id"],
        name: json["f_name"],
        surname: json["f_surname"],
        email: json["email"],
        orderCount: json["ordercount"],
    );
  }
}