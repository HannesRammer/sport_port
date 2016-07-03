import 'package:dartabase_model/dartabase_model.dart';
class Users extends Model{

  num id;
  String username;
  String email;
  String password_hash;
  String password_salt;
  DateTime created_at;
  DateTime updated_at;
  num admin;
  
  String toString() => "Users id=$id:username=$username:email=$email:password_hash=$password_hash:password_salt=$password_salt:created_at=$created_at:updated_at=$updated_at:admin=$admin";
  //toJSON() is available through the "extends Model"
}

        