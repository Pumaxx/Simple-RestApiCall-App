import 'package:rest/model/user_name.dart';
import 'package:rest/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserPicture picture;
  final UserName name;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.picture,
    required this.name,
  });

  String get fullname {
    return '${name.first} ${name.last}';
  }
}
