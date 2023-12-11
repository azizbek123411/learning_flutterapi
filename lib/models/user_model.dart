import 'package:learning_flutterapi/models/user_dob.dart';
import 'package:learning_flutterapi/models/usernam_model.dart';

class UserModel{
  final String gender;
  final String phone;
  final String email;
  final String nat;
  final String cell;
  final  UserName name;
  final  UserDOB dob;
  UserModel({
    required this.email,
    required this.gender,
    required this.nat,
    required this.cell,
    required this.phone,
    required this.name,
    required this.dob,
});
  String get fullName{
    return "${name.title} ${name.first} ${name.last}";
  }
}
